//
//  ZQEvaluateView.m
//  中企资源
//
//  Created by 王落凡 on 15/6/3.
//  Copyright (c) 2015年 王落凡. All rights reserved.
//

#import "ZQStarRatingView.h"
#import "ZQEvaluateView.h"

#define kControlMargin 5
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
        //总体评价
        UILabel* label = [[UILabel alloc] initWithFrame:CGRectMake(2*kControlMargin, 2*kControlMargin, [self contentViewBounds].size.width / 4, kLabelHeight)];
        [label setText:@"总体评分:"];
        [self addSubviewToContentView:label];
        
        //评分控件
        ratingView = [[ZQStarRatingView alloc] initWithFrame:CGRectMake(label.frame.origin.x + label.frame.size.width, 0, self.bounds.size.width / 2, kLabelHeight + kControlMargin / 2) numberOfStars:5];
//        [ratingView sizeToFit];
        [ratingView setUserInteractionEnabled:NO];
        [ratingView setCenter:CGPointMake(ratingView.center.x, label.center.y)];
        [self addSubviewToContentView:ratingView];
        
        //分数
        scoreLabel = [[UILabel alloc] initWithFrame:CGRectMake(self.bounds.size.width - 2*kLabelHeight - 2*kControlMargin, label.frame.origin.y, 2*kLabelHeight, kLabelHeight)];
        [scoreLabel setFont:[UIFont systemFontOfSize:12.0f]];
        [self addSubviewToContentView:scoreLabel];
        
        //累积评论
        commentCountLabel = [[UILabel alloc] initWithFrame:CGRectMake(label.frame.origin.x, label.frame.origin.y + label.frame.size.height + kControlMargin / 2, self.bounds.size.width / 3, kLabelHeight)];
        [commentCountLabel setFont:[UIFont systemFontOfSize:13.0f]];
        [self addSubviewToContentView:commentCountLabel];
    }
    
    return self;
}

-(void)setScore:(CGFloat)score commentCount:(NSInteger)commentCount{
    [ratingView setRating:score];
    [scoreLabel setText:[NSString stringWithFormat:@"%0.1f 分",score]];
    [commentCountLabel setText:[NSString stringWithFormat:@"累积评论：(%ld)",(long)commentCount]];
    return ;
}

@end
