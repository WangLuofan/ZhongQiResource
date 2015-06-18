//
//  ZQMyDistributionViewController.m
//  中企资源
//
//  Created by 王落凡 on 15/5/29.
//  Copyright (c) 2015年 王落凡. All rights reserved.
//

#import "ZQSplitDistrictResourceInfomationViewController.h"
#import "ZQSplitDistrictPostViewController.h"
#import "ZQMyDistributionViewController.h"

@interface ZQMyDistributionViewController ()

@end

@implementation ZQMyDistributionViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setTitle:@"我的发布"];
    [self.splitToolView setSplitToolComponentsWithArray:@[@"资源信息",@"商圈帖子"]];
    [self setComponentsViewControllerArray:@[
                                             [ZQSplitDistrictResourceInfomationViewController new],
                                             [ZQSplitDistrictPostViewController new]
                                             ]];
    return ;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
