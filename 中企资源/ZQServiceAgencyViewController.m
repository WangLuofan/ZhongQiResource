//
//  ZQServiceAgencyViewController.m
//  中企资源
//
//  Created by 王落凡 on 15/5/28.
//  Copyright (c) 2015年 王落凡. All rights reserved.
//

#import "ZQToolBar.h"
#import "ZQServiceAgencyViewController.h"

#define kFilterViewHeight 40
@interface ZQServiceAgencyViewController ()

@end

@implementation ZQServiceAgencyViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setTitle:@"服务机构"];
    
    ZQToolBar* filterView = [[ZQToolBar alloc] initWithSuperView:self.view Styles:@[ZQToolBarStyleButton,ZQToolBarStyleButton,ZQToolBarStyleButton] Text:@[@"按区域选择",@"按业务范围选择",@"系统推荐"]];
    [self.view addSubview:filterView];
    
    return ;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
