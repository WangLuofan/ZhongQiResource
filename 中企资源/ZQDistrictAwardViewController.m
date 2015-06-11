//
//  ZQDistrictAwardViewController.m
//  中企资源
//
//  Created by 王落凡 on 15/5/29.
//  Copyright (c) 2015年 王落凡. All rights reserved.
//

#import "ZQDistrictAwardViewController.h"

#define kControlMargin 20
@interface ZQDistrictAwardViewController ()<UITableViewDataSource,UITableViewDelegate>

@end

@implementation ZQDistrictAwardViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setTitle:@"申请商圈奖励"];
    
    self.tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, self.view.bounds.size.height - kNavStatusHeight) style:UITableViewStyleGrouped];
    [self.tableView setDelegate:self];
    [self.tableView setDataSource:self];
    [self.tableView setScrollEnabled:NO];
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"DistrictAwardTableViewCellIdentifier"];
    [self.tableView addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tableViewTapped:)]];
    [self.view addSubview:self.tableView];
    
    UIView* headerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.tableView.frame.size.width, kControlMargin*2)];
    
    UILabel* descLabel = [[UILabel alloc] initWithFrame:CGRectMake(5, 5, headerView.frame.size.width - 10, headerView.frame.size.height - 10)];
    [descLabel setNumberOfLines:0];
    [self setDescribeInfo:descLabel];
    [headerView addSubview:descLabel];
    
    [self.tableView setTableHeaderView:headerView];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillShowNotification:) name:UIKeyboardWillShowNotification object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillHideNotification:) name:UIKeyboardWillHideNotification object:nil];
    
    return ;
}

-(void)setDescribeInfo:(UILabel*)label {
    NSMutableAttributedString* attrStr = [[NSMutableAttributedString alloc] initWithString:@"☆ 活动简介，凡在本平台商圈达成的交易，均可获赠由平台提供的好礼一份。"];
    [attrStr addAttribute:NSForegroundColorAttributeName value:[UIColor redColor] range:NSMakeRange(0, 1)];
    [attrStr addAttribute:NSFontAttributeName value:[UIFont systemFontOfSize:12.0f] range:NSMakeRange(0, attrStr.length)];
    [label setAttributedText:attrStr];
    
    return ;
}

- (void)dealloc
{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
    return ;
}

-(void)tableViewTapped:(UIGestureRecognizer*)sender {
    for (UITableViewCell* cell in self.tableView.visibleCells) {
        [((UITextField*)cell.contentView.subviews[0]) resignFirstResponder];
    }
    return ;
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 2;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 3;
}

-(void)setPlaceHolderForCellTextField:(UITextField*)textField atIndexPath:(NSIndexPath*)indexPath {
    if(indexPath.section == 0) {
        switch (indexPath.row) {
            case 0:
            {
                [textField setPlaceholder:@"申请企业名称"];
            }
                break;
            case 1:
            {
                [textField setPlaceholder:@"申请联系人"];
            }
                break;
            case 2:
            {
                [textField setPlaceholder:@"申请联系方式"];
                [textField setKeyboardType:UIKeyboardTypePhonePad];
            }
                break;
            default:
                break;
        }
        
    }else {
        switch (indexPath.row) {
            case 0:
                [textField setPlaceholder:@"对方企业信息"];
                break;
            case 1:
                [textField setPlaceholder:@"对方联系人"];
                break;
            case 2:
            {
                [textField setPlaceholder:@"对方联系方式"];
                [textField setKeyboardType:UIKeyboardTypePhonePad];
            }
                break;
            default:
                break;
        }
    }
    
    return ;
}

-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell* cell = [tableView dequeueReusableCellWithIdentifier:@"DistrictAwardTableViewCellIdentifier"];
    
    UITextField* textField = [[UITextField alloc] initWithFrame:CGRectMake(kControlMargin, 0, cell.frame.size.width - 2*kControlMargin, cell.frame.size.height)];
    [self setPlaceHolderForCellTextField:textField atIndexPath:indexPath];
    [cell setSeparatorInset:UIEdgeInsetsMake(0, kControlMargin, 0, kControlMargin)];
    [cell.contentView addSubview:textField];
    
    return cell;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)keyboardWillShowNotification:(NSNotification*)notification {
    NSIndexPath* curIndexPath = nil;
    for (UITableViewCell* cell in self.tableView.visibleCells) {
        if([((UITextField*)cell.contentView.subviews[0]) isFirstResponder]) {
            curIndexPath = [self.tableView indexPathForCell:cell];
            break;
        }
    }
    
    if(curIndexPath.section == 1) {
        [self.tableView setFrame:CGRectMake(self.tableView.frame.origin.x, - [notification.userInfo[UIKeyboardFrameEndUserInfoKey] CGRectValue].size.height, self.tableView.frame.size.width, self.tableView.frame.size.height)];
    }
    
    return ;
}

-(NSString*)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    if(section == 0)
        return @"己方信息";
    return @"对方信息";
}

-(void)keyboardWillHideNotification:(NSNotification*)notification {
    [self.tableView setFrame:CGRectMake(0, 0, self.tableView.bounds.size.width, self.tableView.bounds.size.height)];
    return ;
}

@end
