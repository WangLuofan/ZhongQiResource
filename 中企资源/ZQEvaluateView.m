//
//  ZQEvaluateView.m
//  中企资源
//
//  Created by 王落凡 on 15/6/3.
//  Copyright (c) 2015年 王落凡. All rights reserved.
//

#import "ZQEvaluateView.h"

#define kShadowRadius 0.5f
#define kControlMargin 5

@implementation ZQEvaluateView

-(instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    
    if(self) {
        //灰色阴影
        UIView* grayShadowView = [[UIView alloc] initWithFrame:CGRectMake(0, kControlMargin - 2*kShadowRadius, self.frame.size.width, self.frame.size.height + 4*kShadowRadius - 2*kControlMargin)];
        [grayShadowView setBackgroundColor:[UIColor colorWithRed:((CGFloat)193)/255 green:((CGFloat)194)/255 blue:((CGFloat)195)/255 alpha:1.0f]];
        [self addSubview:grayShadowView];
        
        //白色阴影
        UIView* whiteShadowView = [[UIView alloc] initWithFrame:CGRectMake(0, grayShadowView.frame.origin.y + kShadowRadius, grayShadowView.frame.size.width, grayShadowView.frame.size.height - 2*kShadowRadius)];
        [whiteShadowView setBackgroundColor:[UIColor whiteColor]];
        [whiteShadowView setCenter:grayShadowView.center];
        [self addSubview:whiteShadowView];
        
        //内容视图
        UIView* contentView = [[UIView alloc] initWithFrame:CGRectMake(0, whiteShadowView.frame.origin.y + kShadowRadius, whiteShadowView.frame.size.width, whiteShadowView.frame.size.height - 2*kShadowRadius)];
        [contentView setBackgroundColor:[UIColor colorWithRed:((CGFloat)231)/255 green:((CGFloat)232)/255 blue:((CGFloat)234)/255 alpha:1.0f]];
        [self addSubview:contentView];
        
        
    }
    
    return self;
}

@end
