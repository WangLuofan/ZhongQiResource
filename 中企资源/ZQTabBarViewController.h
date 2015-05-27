//
//  ZQTabBarViewController.h
//  中企资源
//
//  Created by 王落凡 on 15/5/27.
//  Copyright (c) 2015年 王落凡. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ZQTabBarViewController : UITabBarController

@property (nonatomic,strong) UIView* tabBarView;

-(void)addViewControllers:(NSArray*)viewControllers;
-(void)addItemsWithTitle:(NSArray*)titles images:(NSArray*)images;

@end
