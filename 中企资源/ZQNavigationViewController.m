//
//  ZQNavigationViewController.m
//  中企资源
//
//  Created by 王落凡 on 15/5/27.
//  Copyright (c) 2015年 王落凡. All rights reserved.
//

#import "ZQNavigationViewController.h"

@interface ZQNavigationViewController ()

@end

@implementation ZQNavigationViewController

-(instancetype)initWithRootViewController:(UIViewController *)rootViewController {
    self = [super initWithRootViewController:rootViewController];
    
    if(self) {
        self.rootViewController = rootViewController;
    }
    
    return self;
}

-(UIStatusBarStyle)preferredStatusBarStyle {
    return UIStatusBarStyleLightContent;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self setNavigationBarAppearance];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//设置导航栏的样式
-(void) setNavigationBarAppearance {
    UINavigationBar* navigationBar=[UINavigationBar appearance];
    [navigationBar setBackgroundImage:[UIImage imageNamed:@"nav_top_bg"] forBarMetrics:UIBarMetricsDefault];
    return ;
}

@end
