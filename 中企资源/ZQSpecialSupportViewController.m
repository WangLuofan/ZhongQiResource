//
//  ZQSpecialSupportViewController.m
//  中企资源
//
//  Created by 王落凡 on 15/5/29.
//  Copyright (c) 2015年 王落凡. All rights reserved.
//

#import "ZQToolBar.h"
#import "ZQSpecialSupportViewController.h"

#define kFilterViewHeight 40
@interface ZQSpecialSupportViewController ()

@end

@implementation ZQSpecialSupportViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setTitle:@"专项扶持"];
    
    ZQToolBar* filterView = [[ZQToolBar alloc] initWithSuperView:self.view Styles:@[ZQToolBarStyleButton,ZQToolBarStyleButton,ZQToolBarStyleButton] Text:@[@"按区域选择",@"按业务范围选择",@"2015"]];
    [self.view addSubview:filterView];
    
    return ;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
