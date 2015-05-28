//
//  ZQBaseViewController.m
//  中企资源
//
//  Created by 王落凡 on 15/5/28.
//  Copyright (c) 2015年 王落凡. All rights reserved.
//

#import "ZQBaseViewController.h"

@interface ZQBaseViewController ()

@end

@implementation ZQBaseViewController

-(instancetype)initWithTabBarController:(UITabBarController *)tabBarController {
    self = [super init];
    
    if(self) {
        self.tabBarViewController = tabBarController;
    }
    
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
