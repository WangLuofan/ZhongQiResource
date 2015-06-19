//
//  ZQPhoneVerifyViewController.m
//  中企资源
//
//  Created by 王落凡 on 15/6/10.
//  Copyright (c) 2015年 王落凡. All rights reserved.
//

#import "ZQPhoneVerifyButton.h"
#import "ZQNavigationViewController.h"
#import "CodeVerifyTableViewController.h"
#import "ZQPhoneVerifyViewController.h"

#import <SMS_SDK/SMS_SDK.h>

@interface ZQPhoneVerifyViewController ()<UITableViewDataSource,UITableViewDelegate> {
    NSString* mobileTextString;
}

@end

@implementation ZQPhoneVerifyViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setTitle:@"号码修改"];
    
    [self.view setBackgroundColor:[UIColor colorWithRed:((CGFloat)231)/255 green:((CGFloat)232)/255 blue:((CGFloat)234)/255 alpha:1.0f]];
    
    self.tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, self.view.bounds.size.height - kNavStatusHeight) style:UITableViewStyleGrouped];
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"PhoneVerifyTableViewCellIdentifier"];
    [self.tableView setDelegate:self];
    [self.tableView setDataSource:self];
    [self.tableView setScrollEnabled:NO];
    [self.view addSubview:self.tableView];
    
    UIView* headerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.tableView.bounds.size.width, 40)];
    ZQPhoneVerifyButton* sendSMSBtn = [[ZQPhoneVerifyButton alloc] initWithFrame:CGRectMake(10, 0, headerView.bounds.size.width - 20, 40)];
    [sendSMSBtn setTitle:@"验证" forState:UIControlStateNormal];
    [sendSMSBtn addTarget:self action:@selector(sendSMSButtonPressed:) forControlEvents:UIControlEventTouchUpInside];
    [headerView addSubview:sendSMSBtn];
    [self.tableView setTableFooterView:headerView];
    
    [self.view addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(backgroundTapped:)]];
    
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemCancel target:self action:@selector(cancelButtonPressed:)];
    return ;
}

-(void)cancelButtonPressed:(UIBarButtonItem*)sender {
    [self dismissViewControllerAnimated:YES completion:^{
    }];
    return ;
}

-(void)sendSMSButtonPressed:(UIButton*)sender {
    UITextField* mobileTextField = (UITextField*)[self.tableView cellForRowAtIndexPath:[NSIndexPath indexPathForRow:0 inSection:0]].contentView.subviews[0];
    [mobileTextField resignFirstResponder];
    mobileTextString = mobileTextField.text;
    
    if(mobileTextField.text.length == 0) {
        UIAlertView* alertView = [[UIAlertView alloc] initWithTitle:@"错误" message:@"手机号码不能为空，请输入您的手机号码" delegate:nil cancelButtonTitle:@"好的" otherButtonTitles: nil];
        [alertView show];
        return ;
    }else{
        NSPredicate* predicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",@"^1[3578]\\d{9}"];
        if(![predicate evaluateWithObject:mobileTextField.text]) {
            UIAlertView* alertView = [[UIAlertView alloc] initWithTitle:@"错误" message:@"手机号码格式不正确,请重新输入" delegate:nil cancelButtonTitle:@"好的" otherButtonTitles: nil];
            [alertView show];
            return ;
        }
    }
    
    if([[[UIDevice currentDevice] systemVersion] floatValue] >= 8.0) {
        UIAlertController* alertController = [UIAlertController alertControllerWithTitle:@"警告" message:[NSString stringWithFormat:@"我们将向下面这个手机发送短信验证信息:+86 %@",mobileTextField.text] preferredStyle:UIAlertControllerStyleAlert];
        [alertController addAction:[UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
            [self dismissViewControllerAnimated:YES completion:^{
            }];
        }]];
        [alertController addAction:[UIAlertAction actionWithTitle:@"好的" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
            [self getVerificationCode];
        }]];
        [self presentViewController:alertController animated:YES completion:^{
        }];
    }else{
        UIAlertView* alertView = [[UIAlertView alloc] initWithTitle:@"警告" message:[NSString stringWithFormat:@"我们将向下面这个手机发送短信验证信息:+86 %@",mobileTextField.text] delegate:self cancelButtonTitle:@"取消" otherButtonTitles:@"好的", nil];
        [alertView show];
    }
    
    return ;
}

-(void)getVerificationCode {
    [SMS_SDK getVerificationCodeBySMSWithPhone:mobileTextString zone:@"86" result:^(SMS_SDKError *error) {
        if(!error) {
            dispatch_async(dispatch_get_main_queue(), ^{
                CodeVerifyTableViewController* codeController = [[CodeVerifyTableViewController alloc] initWithStyle:UITableViewStyleGrouped phoneNumber:((UITextField*)[self.tableView cellForRowAtIndexPath:[NSIndexPath indexPathForRow:0 inSection:0]].contentView.subviews[0]).text];
                [self.navigationController pushViewController:codeController animated:YES];
            });
        }else{
            UIAlertView* alertView = [[UIAlertView alloc] initWithTitle:@"错误" message:@"验证码发送失败" delegate:nil cancelButtonTitle:@"好的" otherButtonTitles: nil];
            [alertView show];
        }
    }];
    
    return ;
}

-(void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex {
    if(buttonIndex == 1) {
        [self getVerificationCode];
    }
    return ;
}

-(void)backgroundTapped:(UIGestureRecognizer*)sender {
    for (UITableViewCell* cell in self.tableView.visibleCells) {
        [((UITextField*)cell.contentView.subviews[0]) resignFirstResponder];
    }
    return ;
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 1;
}

-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell* cell = [tableView dequeueReusableCellWithIdentifier:@"PhoneVerifyTableViewCellIdentifier"];
    
    UITextField* phoneNumberTextField = [[UITextField alloc] initWithFrame:CGRectMake(70, 0, cell.bounds.size.width - 80, cell.frame.size.height)];
    [phoneNumberTextField setPlaceholder:@"请输入您的手机号码"];
    [phoneNumberTextField setKeyboardType:UIKeyboardTypePhonePad];
    [phoneNumberTextField setText:@""];
    [cell.contentView addSubview:phoneNumberTextField];
    
    [cell.textLabel setText:@"+86"];
    return cell;
}

-(NSString*)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    return @"请输入您的手机号码，我们将向您的手机发送短信验证码";
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
