//
//  ZQBaseExitViewController.m
//  中企资源
//
//  Created by 王落凡 on 15/5/28.
//  Copyright (c) 2015年 王落凡. All rights reserved.
//

#import "ZQBaseExitViewController.h"

@interface ZQBaseExitViewController ()

@end

@implementation ZQBaseExitViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    //返回按钮
    UIImage* btnImage = [UIImage imageNamed:@"exit"];
    UIButton* exitBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [exitBtn setFrame:CGRectMake(0, 0, btnImage.size.width / 2, btnImage.size.height / 2)];
    [exitBtn setImage:btnImage forState:UIControlStateNormal];
    [exitBtn addTarget:self action:@selector(exitButtonPressed:) forControlEvents:UIControlEventTouchUpInside];
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:exitBtn];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)exitButtonPressed:(UIBarButtonItem*)sender {
    [self dismissViewControllerAnimated:YES completion:^{
        return ;
    }];
    return ;
}

@end
