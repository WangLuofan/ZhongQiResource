//
//  ZQToolBarContentView.h
//  中企资源
//
//  Created by 王落凡 on 15/6/1.
//  Copyright (c) 2015年 王落凡. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger, ZQToolBarContentViewStyle) {
    ZQToolBarContentViewStyleSigle,ZQToolBarContentViewStyleMulti
};

@class ZQToolBar;
@interface ZQToolBarContentView : UIView

-(instancetype)initWithStyle:(ZQToolBarContentViewStyle)style toolBar:(ZQToolBar*)toolBar superView:(UIView*)superView;
-(void)setDataSourceArray:(NSArray*)leftSource rightSource:(NSArray*)rightSource;

@end
