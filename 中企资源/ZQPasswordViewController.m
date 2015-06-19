//
//  ZQPasswordViewController.m
//  中企资源
//
//  Created by 王落凡 on 15/6/10.
//  Copyright (c) 2015年 王落凡. All rights reserved.
//

#import "ZQPasswordViewController.h"

#define kControlMargin 20
#define kControlHeight 25
#define kLabelWidthRatio 0.25

@interface ZQPasswordViewController ()<UITextFieldDelegate> {
    UITextField* passwordComfirmTextField;
}

@end

@implementation ZQPasswordViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setTitle:@"密码修改"];
    [self.view setBackgroundColor:[UIColor colorWithRed:((CGFloat)231)/255 green:((CGFloat)232)/255 blue:((CGFloat)234)/255 alpha:1.0f]];
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"PasswordTableViewCellIdentifier"];
    [self.tableView setScrollEnabled:NO];
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemDone target:self action:@selector(doneButtonPressed:)];
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 2;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if(section == 0)
        return 1;
    return 2;
}

-(void)doneButtonPressed:(UIBarButtonItem*)sender {
    //验证旧密码
    UITextField* oldCellField = (UITextField*)[self.tableView cellForRowAtIndexPath:[NSIndexPath indexPathForRow:0 inSection:0]].contentView.subviews[0];
    
    //未输入旧密码
    if(oldCellField.text.length == 0) {
        UIAlertView* alertView = [[UIAlertView alloc] initWithTitle:@"错误" message:@"对不起，请您先验证旧密码" delegate:nil cancelButtonTitle:@"好的" otherButtonTitles: nil];
        [alertView show];
        return ;
    }
            
            //旧密码验证错误
    NSString* password = [[NSUserDefaults standardUserDefaults] stringForKey:@"password"];
    if(![oldCellField.text isEqualToString:password]) {
        UIAlertView* alertView = [[UIAlertView alloc] initWithTitle:@"错误" message:@"对不起，旧密码错误，请重新输入" delegate:nil cancelButtonTitle:@"好的" otherButtonTitles: nil];
        [alertView show];
        
        return ;
    }
    
    //旧密码验证成功,新密码输入不一致
    UITextField* newCellFiled = (UITextField*)[self.tableView cellForRowAtIndexPath:[NSIndexPath indexPathForRow:0 inSection:1]].contentView.subviews[0];
    UITextField* confirmCellField = (UITextField*)[self.tableView cellForRowAtIndexPath:[NSIndexPath indexPathForRow:1 inSection:1]].contentView.subviews[0];
    
    if(![newCellFiled.text isEqualToString:confirmCellField.text]) {
        UIAlertView* alertView = [[UIAlertView alloc] initWithTitle:@"错误" message:@"对不起，两次输入的密码不一致，请重新输入" delegate:nil cancelButtonTitle:@"好的" otherButtonTitles: nil];
        [alertView show];
        
        return ;
    }
    
    //新密码输入为空
    if(newCellFiled.text.length == 0 && confirmCellField.text.length == 0) {
        UIAlertView* alertView = [[UIAlertView alloc] initWithTitle:@"错误" message:@"对不起，新密码不能为空，请重新输入" delegate:nil cancelButtonTitle:@"好的" otherButtonTitles: nil];
        [alertView show];
        
        return ;
    }
    
    //密码设置成功
    [[NSUserDefaults standardUserDefaults] setValue:newCellFiled.text forKey:@"password"];
    [self.navigationController popViewControllerAnimated:YES];
    return ;
}

-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell* cell = [tableView dequeueReusableCellWithIdentifier:@"PasswordTableViewCellIdentifier"];
    [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
    [cell setSeparatorInset:UIEdgeInsetsMake(0, kControlMargin, 0, 0)];
    UITextField* textField = [[UITextField alloc] initWithFrame:CGRectMake(100, 0, cell.frame.size.width - 125, cell.frame.size.height)];
    [textField setSecureTextEntry:YES];
    [textField setDelegate:self];
    [textField setClearButtonMode:UITextFieldViewModeWhileEditing];
    [textField setKeyboardType:UIKeyboardTypeAlphabet];
    [cell.contentView addSubview:textField];
    
    if(indexPath.section == 0) {
        [cell.textLabel setText:@"旧密码:"];
        [textField setPlaceholder:@"请输入旧密码"];
        [textField setReturnKeyType:UIReturnKeyNext];
    }
    else if(indexPath.section == 1 && indexPath.row == 0) {
        [cell.textLabel setText:@"新密码:"];
        [textField setPlaceholder:@"请输入新密码"];
        [textField setReturnKeyType:UIReturnKeyNext];
    }
    else {
        [cell.textLabel setText:@"确认密码:"];
        [textField setPlaceholder:@"请再次输入新密码"];
        [textField setReturnKeyType:UIReturnKeyDone];
    }
    
    return cell;
}

-(NSString*)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    if(section == 0)
        return @"输入旧密码";
    return @"输入新密码";
}

-(BOOL)textFieldShouldReturn:(UITextField *)textField {
    if(textField.returnKeyType == UIReturnKeyNext) {
        NSIndexPath* indexPath = [self.tableView indexPathForCell:(UITableViewCell*)textField.superview.superview.superview];
        if(indexPath.section == 0) {
            UITableViewCell* cell = [self.tableView cellForRowAtIndexPath:[NSIndexPath indexPathForRow:0 inSection:1]];
            for (UIView* subView in cell.contentView.subviews) {
                if([subView isKindOfClass:[UITextField class]]) {
                    [subView becomeFirstResponder];
                    break;
                }
            }
        }else {
            UITableViewCell* cell = [self.tableView cellForRowAtIndexPath:[NSIndexPath indexPathForRow:1 inSection:1]];
            for (UIView* subView in cell.contentView.subviews) {
                if([subView isKindOfClass:[UITextField class]]) {
                    [subView becomeFirstResponder];
                    break;
                }
            }
        }
    }
    else
        [textField resignFirstResponder];
    
    return YES;
}

-(NSString*)tableView:(UITableView *)tableView titleForFooterInSection:(NSInteger)section {
    if(section == 1)
        return @"密码由数字、字母、和符号组成，不能输入汉字或其他内容";
    return nil;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
