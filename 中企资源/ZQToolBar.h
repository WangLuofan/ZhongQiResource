//
//  ZQToolBar.h
//  中企资源
//
//  Created by 王落凡 on 15/6/18.
//  Copyright (c) 2015年 王落凡. All rights reserved.
//

#import "ZQToolBarItem.h"
#import "ZQFilterView.h"
#import <UIKit/UIKit.h>

#define ZQToolBarButtonItem @"ZQToolBarButtonItem"
#define ZQToolBarSearchBarItem @"ZQToolBarSearchBarItem"

@class ZQToolBar;
@protocol ZQToolBarDelegate <NSObject>

@optional
-(void)loadMenuItemsForToolBarButtonItem:(ZQToolBarItem*)toolBarItem;

@end

typedef void(^CompletitionBlock)(void);

@interface ZQToolBar : UIView

@property(nonatomic,assign) id<ZQToolBarDelegate> delegate;

-(instancetype)initWithStyles:(NSArray *)styleArray TextArray:(NSArray *)textArray SuperView:(UIView *)superView Delegate:(id<ZQToolBarDelegate>)delegate;
-(void)setToolBarItemStyle:(NSArray *)styleArray TextArray:(NSArray*)textArray;
-(void)presentFilterView:(ZQFilterView*)filterView;
-(void)dismissFilterView:(ZQFilterView*)filterView;
-(void)dismissFilterView:(ZQFilterView *)filterView complete:(CompletitionBlock)complete;

@end
