//
//  CodeVerifyTableViewController.m
//  中企资源
//
//  Created by 王落凡 on 15/6/10.
//  Copyright (c) 2015年 王落凡. All rights reserved.
//

#import "ZQPhoneVerifyButton.h"
#import "CodeVerifyTableViewController.h"

#define kTimerCount 59

@interface CodeVerifyTableViewController () {
    NSString* cellPhoneNumber;
    ZQPhoneVerifyButton* codeButton;
    NSTimer* timer;
    int timeCount;
}

@end

@implementation CodeVerifyTableViewController

-(instancetype)initWithStyle:(UITableViewStyle)style phoneNumber:(NSString *)phoneNumber {
    self = [super initWithStyle:style];
    
    if(self) {
        cellPhoneNumber = phoneNumber;
        timeCount = kTimerCount;
    }
    
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setTitle:@"短信验证"];
    
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"CodeVerifyTableViewCellIdentifier"];
    
    UILabel* descLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, self.tableView.bounds.size.width, 80)];
    [descLabel setNumberOfLines:0];
    [descLabel setText:[NSString stringWithFormat:@"短信验证码已经发送到手机:\n+86 %@",cellPhoneNumber]];
    [descLabel setTextAlignment:NSTextAlignmentCenter];
    [self.tableView setTableHeaderView:descLabel];
    [self.tableView setScrollEnabled:NO];
    
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"取消" style:UIBarButtonItemStylePlain target:self action:@selector(leftButtonClicked:)];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"验证" style:UIBarButtonItemStylePlain target:self action:@selector(rightButtonClicked:)];
    
    UIView* footerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.tableView.bounds.size.width, 40)];
    
    codeButton = [[ZQPhoneVerifyButton alloc] initWithFrame:CGRectMake(10, 0, footerView.bounds.size.width - 20, footerView.bounds.size.height)];
    [codeButton setEnabled:NO];
    [codeButton addTarget:self action:@selector(codeButtonPressed:) forControlEvents:UIControlEventTouchUpInside];
    [footerView addSubview:codeButton];
    
    [self.tableView setTableFooterView:footerView];
    
    //定时器
    timer = [NSTimer scheduledTimerWithTimeInterval:1.0f target:self selector:@selector(timerFireMethod:) userInfo:nil repeats:YES];
    [codeButton setTitle:[NSString stringWithFormat:@"%d秒后可重新获取验证码",timeCount] forState:UIControlStateNormal];
    
    return ;
}

- (void)timerFireMethod:(NSTimer *)sender {
    if(timeCount > 1) {
        [codeButton setEnabled:NO];
        [codeButton setTitle:[NSString stringWithFormat:@"%d秒后可重新获取验证码",--timeCount] forState:UIControlStateNormal];
    }else{
        [timer setFireDate:[NSDate distantFuture]];
        timeCount = kTimerCount + 1;
        [codeButton setTitle:@"重新获取验证码" forState:UIControlStateNormal];
        [codeButton setEnabled:YES];
    }
    
    return ;
}

-(void)codeButtonPressed:(ZQPhoneVerifyButton*)sender {
    [sender setTitle:[NSString stringWithFormat:@"%d秒后可重新获取验证码",timeCount] forState:UIControlStateNormal];
    [timer setFireDate:[NSDate date]];
    return ;
}

-(void)leftButtonClicked:(UIBarButtonItem*)sender {
    [self dismissViewControllerAnimated:YES completion:^{
    }];
    return ;
}

-(void)rightButtonClicked:(UIBarButtonItem*)sender {
    
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 1;
}

-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell* cell = [tableView dequeueReusableCellWithIdentifier:@"CodeVerifyTableViewCellIdentifier"];
    
    UITextField* textField = [[UITextField alloc] initWithFrame:CGRectMake(0, 0, cell.bounds.size.width , cell.bounds.size.height)];
    [textField setPlaceholder:@"请输入验证码"];
    [textField setTextAlignment:NSTextAlignmentCenter];
    [textField setKeyboardType:UIKeyboardTypeNumberPad];
    [textField addTarget:self action:@selector(textFieldChanged:) forControlEvents:UIControlEventEditingChanged];
    [cell.contentView addSubview:textField];
    
    return cell;
}

-(void)textFieldChanged:(UITextField*)sender {
    if (sender.text.length > 4) {
        sender.text = [sender.text substringToIndex:4];
    }
    return ;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
