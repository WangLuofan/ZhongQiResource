//
//  ZQBaseCommentHeader.m
//  中企资源
//
//  Created by 王落凡 on 15/6/12.
//  Copyright (c) 2015年 王落凡. All rights reserved.
//

#import "ZQBaseCommentHeader.h"

#define kShadowRadius 0.5f
#define kControlMargin 5

@interface ZQBaseCommentHeader () {
    UIView* contentView;
}

@end

@implementation ZQBaseCommentHeader

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        //灰色阴影
        UIView* grayShadowView = [[UIView alloc] initWithFrame:CGRectMake(0, kControlMargin, self.frame.size.width, self.frame.size.height - kControlMargin)];
        [grayShadowView setBackgroundColor:[UIColor colorWithRed:((CGFloat)193)/255 green:((CGFloat)194)/255 blue:((CGFloat)195)/255 alpha:1.0f]];
        [self addSubview:grayShadowView];
        
        //白色阴影
        UIView* whiteShadowView = [[UIView alloc] initWithFrame:CGRectMake(0, kShadowRadius, grayShadowView.bounds.size.width, grayShadowView.bounds.size.height - 2*kShadowRadius)];
        [whiteShadowView setBackgroundColor:[UIColor whiteColor]];
        [grayShadowView addSubview:whiteShadowView];
        
        //内容视图
        contentView = [[UIView alloc] initWithFrame:CGRectMake(0, kShadowRadius, whiteShadowView.bounds.size.width, whiteShadowView.bounds.size.height - 2*kShadowRadius)];
        [contentView setBackgroundColor:[UIColor colorWithRed:((CGFloat)231)/255 green:((CGFloat)232)/255 blue:((CGFloat)234)/255 alpha:1.0f]];
        [whiteShadowView addSubview:contentView];
        
        //发表评论
        UIButton* button = [UIButton buttonWithType:UIButtonTypeCustom];
        [button setImage:[UIImage imageNamed:@"pinlub"] forState:UIControlStateNormal];
        [button.imageView setContentMode:UIViewContentModeScaleAspectFit];
        [button setFrame:CGRectMake(contentView.bounds.size.width / 2 - kControlMargin, contentView.bounds.size.height - kControlMargin - button.imageView.image.size.height / 2,contentView.bounds.size.width / 2, button.imageView.image.size.height / 2)];
        [button setTitle:@"发表评论" forState:UIControlStateNormal];
        [button.titleLabel setFont:[UIFont systemFontOfSize:14.0f]];
        [button setTitleColor:[UIColor colorWithRed:((CGFloat)51)/255 green:((CGFloat)130)/255 blue:((CGFloat)240)/255 alpha:1.0f] forState:UIControlStateNormal];
        [button setTitleColor:[UIColor lightGrayColor] forState:UIControlStateHighlighted];
        [button addTarget:self action:@selector(buttonPressed:) forControlEvents:UIControlEventTouchUpInside];
        [contentView addSubview:button];
    }
    return self;
}

-(CGRect)contentViewBounds {
    return contentView.bounds;
}

-(void)addSubviewToContentView:(UIView *)view {
    [contentView addSubview:view];
    return ;
}

-(void)buttonPressed:(UIButton*)sender {
    if([self.delegate respondsToSelector:@selector(evaluateHeader:commentButtonPressed:)])
        [self.delegate evaluateHeader:self commentButtonPressed:sender];
    return ;
}

@end
