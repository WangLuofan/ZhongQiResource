//
//  ZQBaseViewController.h
//  中企资源
//
//  Created by 王落凡 on 15/5/28.
//  Copyright (c) 2015年 王落凡. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ZQBaseViewController : UIViewController

@property(nonatomic,strong) UITabBarController* tabBarViewController;
-(instancetype)initWithTabBarController:(UITabBarController*)tabBarController;

@end
