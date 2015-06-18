//
//  ZQSplitToolView.m
//  中企资源
//
//  Created by 王落凡 on 15/6/15.
//  Copyright (c) 2015年 王落凡. All rights reserved.
//

#import "ZQSplitToolView.h"

#define kShadowRadius 0.5f
#define kControlMargin 5

@interface ZQSplitToolView () {
    UIView* indicatorView;
}

@end

@implementation ZQSplitToolView

-(instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    
    if(self) {
        [self setBackgroundColor:[UIColor colorWithRed:((CGFloat)244)/255 green:((CGFloat)241)/255 blue:((CGFloat)242)/255 alpha:1.0f]];
        [self setShowsHorizontalScrollIndicator:NO];
        [self setShowsVerticalScrollIndicator:NO];
    }
    
    return self;
}

-(instancetype)initWithFrame:(CGRect)frame ItemTitleComponentsArray:(NSArray *)componments {
    self = [super initWithFrame:frame];
    
    if(self) {
        [self setBackgroundColor:[UIColor colorWithRed:((CGFloat)244)/255 green:((CGFloat)241)/255 blue:((CGFloat)242)/255 alpha:1.0f]];
        
        [self setSplitToolComponentsWithArray:componments];
        
        [self setShowsHorizontalScrollIndicator:NO];
        [self setShowsVerticalScrollIndicator:NO];
    }
    
    return self;
}

-(void)setSplitToolComponentsWithArray:(NSArray *)componments {
    for (UIView* subView in self.subviews) {
        [subView removeFromSuperview];
    }
    
    CGFloat maxWidth = [self findMaxWidthFromComponentsArray:componments];
    
    for (int i = 0; i != componments.count; ++i) {
        UIButton* button = [[UIButton alloc] initWithFrame:CGRectMake(i*maxWidth, 0, maxWidth, self.bounds.size.height)];
        [button setTag:i];
        [button.titleLabel setFont:[UIFont systemFontOfSize:12.0f]];
        [button setContentHorizontalAlignment:UIControlContentHorizontalAlignmentCenter];
        [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [button setTitle:(NSString *)componments[i] forState:UIControlStateNormal];
        [button addTarget:self action:@selector(splitItemChanged:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:button];
    }
    
    [self setContentSize:CGSizeMake(componments.count*maxWidth, 0)];
    
    indicatorView = [[UIView alloc] initWithFrame:CGRectMake(0, self.bounds.size.height - 1, maxWidth, 1)];
    [indicatorView setBackgroundColor:[UIColor colorWithRed:((CGFloat)157/255) green:((CGFloat)194/255) blue:((CGFloat)230)/255 alpha:1.0f]];
    [self addSubview:indicatorView];
    
    return ;
}

-(void)splitItemChanged:(UIButton*)sender {
    [UIView animateWithDuration:0.2f animations:^{
        [indicatorView setFrame:CGRectMake(sender.frame.origin.x, indicatorView.frame.origin.y, sender.frame.size.width, indicatorView.frame.size.height)];
        if(sender.center.x - self.center.x < 0)
            [self setContentOffset:CGPointMake(0, 0) animated:YES];
        else if(sender.center.x - self.center.x > self.contentSize.width - self.bounds.size.width)
            [self setContentOffset:CGPointMake(self.contentSize.width - self.bounds.size.width, 0) animated:YES];
        else
            [self setContentOffset:CGPointMake(sender.center.x - self.center.x, 0) animated:YES];
    } completion:^(BOOL finished) {
        if([self.splitToolViewDelegate respondsToSelector:@selector(splitToolView:itemSelectionChangedToIndex:)])
            [self.splitToolViewDelegate splitToolView:self itemSelectionChangedToIndex:sender.tag];
    }];
    
    return ;
}

-(CGFloat)findMaxWidthFromComponentsArray:(NSArray*)componmentsArray {
    CGFloat maxWidth = 0.0f;
    
    for (NSString* str in componmentsArray) {
        CGSize textSize = [str sizeWithAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:12.0f]}];
        if(textSize.width > maxWidth)
            maxWidth = textSize.width;
    }
    
    if(componmentsArray.count*maxWidth > self.bounds.size.width)
        return maxWidth + kControlMargin;
    
    return self.bounds.size.width / componmentsArray.count ;
}

@end
