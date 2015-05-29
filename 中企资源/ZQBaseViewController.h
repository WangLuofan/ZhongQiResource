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

@property(nonatomic,copy) NSString* collectionViewCellIdentifier;
@property(nonatomic,strong) UICollectionView* _collectionView;

-(instancetype)initWithTabBarController:(UITabBarController*)tabBarController;
-(void)addChildViewControllersWithArray:(NSArray*)viewControllers;
-(UIViewController*)getChildViewController:(NSInteger)index;
-(void)initCollectionViewWithFrame:(CGRect)frame cellIdentifier:(NSString*)cellIdentifier superView:(UIView*)superView;
-(void)initCollectionContent:(NSArray*)contentArray;
-(void)addAllChildViewControllers;

@end
