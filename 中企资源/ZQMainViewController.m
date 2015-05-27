//
//  ZQMainViewController.m
//  中企资源
//
//  Created by 王落凡 on 15/5/27.
//  Copyright (c) 2015年 王落凡. All rights reserved.
//

#import "StartViewController.h"
#import "UserViewController.h"
#import "MoreViewController.h"
#import "ZQMainViewController.h"

@interface ZQMainViewController ()

@end

@implementation ZQMainViewController

-(instancetype)init {
    self = [super init];
    
    if(self) {
        [self addItemsWithTitle:@[@"首页",@"用户中心",@"更多"] images:@[
                                                                [UIImage imageNamed:@"shouy"],
                                                                [UIImage imageNamed:@"user"],
                                                                [UIImage imageNamed:@"more"]
                                                                ]];
    }
    
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self addViewControllers:@[
                               [[StartViewController alloc] init],
                               [[UserViewController alloc] init],
                               [[MoreViewController alloc] init]
                               ]];
    return ;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
