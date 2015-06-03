//
//  ZQToolBar.h
//  中企资源
//
//  Created by 王落凡 on 15/5/29.
//  Copyright (c) 2015年 王落凡. All rights reserved.
//

#import <UIKit/UIKit.h>

#define ZQToolBarStyleButton @"ZQToolBarStyleButton"
#define ZQToolBarStyleSearchBar @"ZQToolBarStylesearchBar"

@class ZQToolBar;
@protocol ZQToolBarDelegate <NSObject>

@optional
-(void)toolBar:(ZQToolBar*)toolBar Style:(NSString*)style index:(NSInteger)index;

@end

@interface ZQToolBar : UIView

@property(nonatomic,assign) id<ZQToolBarDelegate> delegate;
@property(nonatomic,assign) BOOL bFilterContentViewShown;

-(instancetype)initWithSuperView:(UIView*)superView Styles:(NSArray*)styles Text:(NSArray*)text;
-(void)setFilterCategory:(NSString*)filterCategory index:(NSInteger)index;
-(void)showFilterContentViewInView:(UIView*)view leftSource:(NSArray*)leftSource rightSource:(NSArray*)rightSource;
-(void)hideFilterContentView;
-(void)setStyles:(NSArray*)styles Text:(NSArray*)text;

@end
