//
//  ZQEvaluateView.m
//  中企资源
//
//  Created by 王落凡 on 15/6/3.
//  Copyright (c) 2015年 王落凡. All rights reserved.
//

#import "ZQStarRatingView.h"
#import "ZQEvaluateView.h"

#define kShadowRadius 0.5f
#define kControlMargin 10
#define kLabelHeight 20

@interface ZQEvaluateView () {
    ZQStarRatingView* ratingView;
    UILabel* scoreLabel;
    UILabel* commentCountLabel;
}

@end

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
        UIView* contentView = [[UIView alloc] initWithFrame:CGRectMake(0, whiteShadowView.frame.origin.y + kShadowRadius, whiteShadowView.frame.size.width, whiteShadowView.frame.size.height - kShadowRadius)];
        [contentView setBackgroundColor:[UIColor colorWithRed:((CGFloat)231)/255 green:((CGFloat)232)/255 blue:((CGFloat)234)/255 alpha:1.0f]];
        [self addSubview:contentView];
        
        //总体评价
        UILabel* label = [[UILabel alloc] initWithFrame:CGRectMake(2*kControlMargin, 2*kControlMargin, self.bounds.size.width / 4, kLabelHeight)];
        [label setText:@"总体评分:"];
        [self addSubview:label];
        
        //评分控件
        ratingView = [[ZQStarRatingView alloc] initWithFrame:CGRectMake(label.frame.origin.x + label.frame.size.width, 0, self.bounds.size.width / 2, kLabelHeight + kControlMargin / 2) numberOfStars:5];
//        [ratingView sizeToFit];
        [ratingView setUserInteractionEnabled:NO];
        [ratingView setCenter:CGPointMake(ratingView.center.x, label.center.y)];
        [self addSubview:ratingView];
        
        //分数
        scoreLabel = [[UILabel alloc] initWithFrame:CGRectMake(self.bounds.size.width - 2*kLabelHeight - 2*kControlMargin, label.frame.origin.y, 2*kLabelHeight, kLabelHeight)];
        [scoreLabel setFont:[UIFont systemFontOfSize:12.0f]];
        [self addSubview:scoreLabel];
        
        //累积评论
        commentCountLabel = [[UILabel alloc] initWithFrame:CGRectMake(label.frame.origin.x, label.frame.origin.y + label.frame.size.height + kControlMargin / 2, self.bounds.size.width / 3, kLabelHeight)];
        [commentCountLabel setFont:[UIFont systemFontOfSize:13.0f]];
        [self addSubview:commentCountLabel];
        
        //发表评论
        UIButton* button = [UIButton buttonWithType:UIButtonTypeCustom];
        [button setImage:[UIImage imageNamed:@"pinlub"] forState:UIControlStateNormal];
        [button.imageView setContentMode:UIViewContentModeScaleAspectFit];
        [button setFrame:CGRectMake(commentCountLabel.frame.origin.x + commentCountLabel.frame.size.width, 0, self.bounds.size.width / 2, button.imageView.image.size.height / 2)];
        [button setTitle:@"发表评论" forState:UIControlStateNormal];
        [button.titleLabel setFont:[UIFont systemFontOfSize:14.0f]];
        [button setTitleColor:[UIColor colorWithRed:((CGFloat)51)/255 green:((CGFloat)130)/255 blue:((CGFloat)240)/255 alpha:1.0f] forState:UIControlStateNormal];
        [button setTitleColor:[UIColor lightGrayColor] forState:UIControlStateHighlighted];
        [button setCenter:CGPointMake(button.center.x, commentCountLabel.center.y)];
        [button addTarget:self action:@selector(buttonPressed:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:button];
    }
    
    return self;
}

-(void)buttonPressed:(UIButton*)sender {
    if([self.delegate respondsToSelector:@selector(evaluateView:commentButtonPressed:)])
        [self.delegate evaluateView:self commentButtonPressed:sender];
    return ;
}

-(void)setScore:(CGFloat)score commentCount:(NSInteger)commentCount{
    [ratingView setRating:score];
    [scoreLabel setText:[NSString stringWithFormat:@"%0.1f 分",score]];
    [commentCountLabel setText:[NSString stringWithFormat:@"累积评论：(%ld)",(long)commentCount]];
    return ;
}

@end
