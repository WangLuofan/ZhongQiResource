//
//  MoreViewController.m
//  中企资源
//
//  Created by 王落凡 on 15/5/26.
//  Copyright (c) 2015年 王落凡. All rights reserved.
//

#import "ZQTabBarViewController.h"
#import "MoreViewController.h"
#import "ZQCollectionContentView.h"

#define kCollectionViewItemCount 3
#define kCollectionCellMargin 10
#define kLoginCompleteViewGap 10
#define kCollectionViewHeight 240

@interface MoreViewController ()

@end

@implementation MoreViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setTitle:@"更多"];
    [self initCollectionViewWithFrame:CGRectMake(self.view.frame.origin.x, self.view.frame.origin.y, self.view.frame.size.width, kCollectionViewHeight) cellIdentifier:@"ZQCollectionViewMoreCellIdentifier" superView:self.view];
    [self initCollectionContent:@[
                                @[@"平台通告",@"ptgg"],
                                @[@"申请商圈奖励",@"sqsqjl"],
                                @[@"版本更新",@"bbgx"],
                                @[@"关于中企资源",@"gyzqzy"],
                                @[@"用户反馈",@"yhfg"],
                                ]];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
