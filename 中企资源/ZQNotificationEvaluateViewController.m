//
//  ZQNotificationEvaluateViewController.m
//  中企资源
//
//  Created by 王落凡 on 15/6/11.
//  Copyright (c) 2015年 王落凡. All rights reserved.
//

#import "ZQNotificationEvaluateViewController.h"

@interface ZQNotificationEvaluateViewController ()

@end

@implementation ZQNotificationEvaluateViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setTitle:@"平台通告评论"];
    
    [self commentWithUserInfoDict:@{
                          @"header":[UIImage imageNamed:@"tx2"],
                          @"enterprise":@"湖南讯德彩利科技有限公司",
                          @"userName":@"帅帅",
                          @"commentContent":@"不错的资源管理平台!!!不错的资源管理平台!!!不错的资源管理平台!!!不错的资源管理平台!!!不错的资源管理平台!!!不错的资源管理平台!!!",
                          @"dateTime":@"2015-05-25    18:03:29"
                          }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
