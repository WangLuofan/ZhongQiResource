//
//  ZQEnterpriseResourceViewController.m
//  中企资源
//
//  Created by 王落凡 on 15/5/28.
//  Copyright (c) 2015年 王落凡. All rights reserved.
//

#import "ZQToolBar.h"
#import "ZQEnterpriseResourceViewController.h"

#define kFilterViewHeight 40
@interface ZQEnterpriseResourceViewController ()

@end

@implementation ZQEnterpriseResourceViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setTitle:@"企业资源"];
    
    ZQToolBar* filterView = [[ZQToolBar alloc] initWithSuperView:self.view Styles:@[ZQToolBarStyleButton,ZQToolBarStyleSearchBar,ZQToolBarStyleButton] Text:@[@"按行业搜索",@"输入产品或服务",@"按地域搜索"]];
    [self.view addSubview:filterView];
    
    return ;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
