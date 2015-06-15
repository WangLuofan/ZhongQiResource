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

@implementation ZQPhoneVerifyViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setTitle:@"号码修改"];
    
    [self.view setBackgroundColor:[UIColor colorWithRed:((CGFloat)231)/255 green:((CGFloat)232)/255 blue:((CGFloat)234)/255 alpha:1.0f]];
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"PhoneVerifyTableViewCellIdentifier"];
    [self.tableView setScrollEnabled:NO];
    
    UIView* headerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.tableView.bounds.size.width, 40)];
    ZQPhoneVerifyButton* sendSMSBtn = [[ZQPhoneVerifyButton alloc] initWithFrame:CGRectMake(10, 0, headerView.bounds.size.width - 20, 40)];
    [sendSMSBtn setTitle:@"验证" forState:UIControlStateNormal];
    [sendSMSBtn addTarget:self action:@selector(sendSMSButtonPressed:) forControlEvents:UIControlEventTouchUpInside];
    [headerView addSubview:sendSMSBtn];
    [self.tableView setTableFooterView:headerView];
}

-(void)sendSMSButtonPressed:(UIButton*)sender {
    UITextField* mobileTextField = (UITextField*)[self.tableView cellForRowAtIndexPath:[NSIndexPath indexPathForRow:0 inSection:0]].contentView.subviews[0];
    [mobileTextField resignFirstResponder];
    
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
    
    UIAlertView* alertView = [[UIAlertView alloc] initWithTitle:@"号码确认" message:[NSString stringWithFormat:@"我们将向下面这个手机发送短信验证信息:+86 %@",mobileTextField.text] delegate:self cancelButtonTitle:@"取消" otherButtonTitles:@"好的", nil];
    [alertView show];
    
    return ;
}

-(void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex {
    if(buttonIndex == 1) {
        dispatch_async(dispatch_get_main_queue(), ^{
            CodeVerifyTableViewController* codeController = [[CodeVerifyTableViewController alloc] initWithStyle:   UITableViewStyleGrouped phoneNumber:((UITextField*)[self.tableView cellForRowAtIndexPath:[NSIndexPath indexPathForRow:0 inSection:0]].contentView.subviews[0]).text];
            [self presentViewController:[[ZQNavigationViewController alloc] initWithRootViewController:codeController] animated:YES completion:^{
            }];
        });
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
    [phoneNumberTextField setKeyboardType:UIKeyboardTypePhonePad];
    [phoneNumberTextField setPlaceholder:@"请输入您的手机号码"];
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
    // Dispose of any resources that can be recreated.
}

@end
