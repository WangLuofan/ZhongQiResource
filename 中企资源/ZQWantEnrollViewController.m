//
//  ZQWantEnrollViewController.m
//  中企资源
//
//  Created by 王落凡 on 15/6/11.
//  Copyright (c) 2015年 王落凡. All rights reserved.
//

#import "ZQWantEnrollViewController.h"

#define kControlMargin 20
#define kTableViewCellHeight 44

@interface ZQWantEnrollViewController ()<UITableViewDataSource,UITableViewDelegate>

@end

@implementation ZQWantEnrollViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setTitle:@"我要报名"];
    
    self.tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, self.view.bounds.size.height - kNavStatusHeight) style:UITableViewStylePlain];
    [self.tableView setBackgroundColor:[UIColor clearColor]];
    [self.tableView setDelegate:self];
    [self.tableView setDataSource:self];
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"WantEnrollTableViewCellIdentifier"];
    [self.view addSubview:self.tableView];
    
    UIView* headerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.tableView.frame.size.width, kControlMargin*2)];
    
    UILabel* descLabel = [[UILabel alloc] initWithFrame:CGRectMake(5, 5, headerView.frame.size.width - 10, headerView.frame.size.height - 10)];
    [descLabel setNumberOfLines:0];
    [self setDescribeInfo:descLabel];
    [headerView addSubview:descLabel];
    
    [self.tableView setTableHeaderView:headerView];
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemDone target:self action:@selector(doneButtonPressed:)];
    
    return ;
}

-(void)doneButtonPressed:(UIBarButtonItem*)sender {
    BOOL bInputComplete = YES;
    for (UITableViewCell* cell in self.tableView.visibleCells) {
        if([cell.contentView.subviews[0] isKindOfClass:[UITextField class]]) {
            [((UITextField*)cell.contentView.subviews[0]) resignFirstResponder];
            if(((UITextField*)cell.contentView.subviews[0]).text.length == 0) {
                bInputComplete = NO;
                UIAlertView* alertView = [[UIAlertView alloc] initWithTitle:@"错误" message:@"请将表单信息填写完整" delegate:nil cancelButtonTitle:@"好的" otherButtonTitles: nil];
                [alertView show];
                break;
            }else if([cell.textLabel.text isEqualToString:@"手机号码:"]) {
                NSPredicate* predicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",@"^1[3578]\\d{9}"];
                if(![predicate evaluateWithObject:((UITextField*)cell.contentView.subviews[0]).text]) {
                    bInputComplete = NO;
                    UIAlertView* alertView = [[UIAlertView alloc] initWithTitle:@"错误" message:@"手机号码格式有误，请检查" delegate:nil cancelButtonTitle:@"好的" otherButtonTitles: nil];
                    [alertView show];
                    break;
                }
            }
        }
    }
    
    if(bInputComplete) {
        self.enrollModel = [[ZQWantEnrollModel alloc] init];
        self.enrollModel.userName = ((UITextField*)[self.tableView cellForRowAtIndexPath:[NSIndexPath indexPathForRow:0 inSection:0]].contentView.subviews[0]).text;
        self.enrollModel.telephoneNumber = ((UITextField*)[self.tableView cellForRowAtIndexPath:[NSIndexPath indexPathForRow:1 inSection:0]].contentView.subviews[0]).text;
        self.enrollModel.enterpriseName = ((UITextField*)[self.tableView cellForRowAtIndexPath:[NSIndexPath indexPathForRow:2 inSection:0]].contentView.subviews[0]).text;
        self.enrollModel.attendCount = [((UITextField*)[self.tableView cellForRowAtIndexPath:[NSIndexPath indexPathForRow:3 inSection:0]].contentView.subviews[0]).text integerValue];
        self.enrollModel.remarksInfo = ((UITextField*)[self.tableView cellForRowAtIndexPath:[NSIndexPath indexPathForRow:4 inSection:0]].contentView.subviews[0]).text;
        
    }
    return ;
}

-(void)setDescribeInfo:(UILabel*)label {
    NSMutableAttributedString* attrStr = [[NSMutableAttributedString alloc] initWithString:@"☆ 报名须知及注意事项:填写完整下列表单内容，感谢客户的信任。"];
    [attrStr addAttribute:NSForegroundColorAttributeName value:[UIColor redColor] range:NSMakeRange(0, 1)];
    [attrStr addAttribute:NSFontAttributeName value:[UIFont systemFontOfSize:12.0f] range:NSMakeRange(0, attrStr.length)];
    [label setAttributedText:attrStr];
    
    return ;
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 5;
}

-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell* cell = [tableView dequeueReusableCellWithIdentifier:@"WantEnrollTableViewCellIdentifier"];
    [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
    
    if(indexPath.row == 4) {
        UITextView* textView = [[UITextView alloc] initWithFrame:CGRectMake(100, 0, cell.bounds.size.width - 120, cell.bounds.size.height * 4)];
        [cell.contentView addSubview:textView];
        [cell.textLabel setText:@"补充说明:"];
    }else {
        UITextField* textField = [[UITextField alloc] initWithFrame:CGRectMake(100, 0, cell.bounds.size.width - 120, cell.bounds.size.height)];
        [textField setPlaceholder:@"必填"];
        [cell.contentView addSubview:textField];
        switch (indexPath.row) {
            case 0:
                [cell.textLabel setText:@"您的姓名:"];
                break;
            case 1:
                [cell.textLabel setText:@"手机号码:"];
                [textField setKeyboardType:UIKeyboardTypePhonePad];
                break;
            case 2:
                [cell.textLabel setText:@"企业全称:"];
                break;
            case 3:
                [cell.textLabel setText:@"参会人数:"];
                [textField setKeyboardType:UIKeyboardTypeNumberPad];
                break;
            default:
                break;
        }
    }
    
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    if(indexPath.row == 4) {
        return 4*kTableViewCellHeight;
    }
    return kTableViewCellHeight;
}

- (void)dealloc
{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
    return ;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
