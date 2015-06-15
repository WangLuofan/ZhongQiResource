//
//  ZQUserFeedbackViewController.m
//  中企资源
//
//  Created by 王落凡 on 15/5/29.
//  Copyright (c) 2015年 王落凡. All rights reserved.
//

#import "ZQUserFeedbackViewController.h"

#define kControlMargin 5
#define kDescLabelHeight 40

@interface ZQUserFeedbackViewController ()

@end

@implementation ZQUserFeedbackViewController

-(instancetype)init {
    self = [super initWithHeaderMargin:kDescLabelHeight + kControlMargin];
    
    if(self) {
    }
    
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setTitle:@"用户反馈"];
    UILabel* descLabel = [[UILabel alloc] initWithFrame:CGRectMake(kControlMargin, kControlMargin, self.view.bounds.size.width - 2*kControlMargin, kDescLabelHeight)];
    [descLabel setTextAlignment:NSTextAlignmentJustified];
    [self.view addSubview:descLabel];
    [self setDescribeInfo:descLabel];
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"提交" style:UIBarButtonItemStylePlain target:self action:@selector(submitButtonPressed:)];
    
    return ;
}

-(void)submitButtonPressed:(UIBarButtonItem*)sender {
    [self dismissViewControllerAnimated:YES completion:^{
    }];
    
    return ;
}

-(void)cancelButtonPressed:(UIButton*)sender {
    [self dismissViewControllerAnimated:YES completion:^{
    }];
    return ;
}

-(void)setDescribeInfo:(UILabel*)label {
    NSMutableAttributedString* attrStr = [[NSMutableAttributedString alloc] initWithString:@"☆ 针对用户反馈的一些说明，并表示欢迎!"];
    [attrStr addAttribute:NSForegroundColorAttributeName value:[UIColor redColor] range:NSMakeRange(0, 1)];
    [attrStr addAttribute:NSFontAttributeName value:[UIFont systemFontOfSize:14.0f] range:NSMakeRange(0, attrStr.length)];
    [label setAttributedText:attrStr];
    
    return ;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
