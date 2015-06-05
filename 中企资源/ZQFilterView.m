//
//  ZQFilterView.m
//  中企资源
//
//  Created by 王落凡 on 15/6/4.
//  Copyright (c) 2015年 王落凡. All rights reserved.
//

#import "ZQFilterButton.h"
#import "ZQFilterView.h"

#define kItemHeight 20

@interface ZQFilterView () {
    UIView* contentView;
    UIView* leftSrcContentView;
    UIView* rightSrcContentView;
    ZQFilterButton* selectedButton;
    
    NSArray* rightSourceArray;
}

@end

@implementation ZQFilterView

-(instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    
    if(self) {
        UIView* coverView = [[UIView alloc] initWithFrame:self.bounds];
        [coverView setBackgroundColor:[UIColor blackColor]];
        [coverView setAlpha:0.5f];
        [self addSubview:coverView];
        
        contentView = [[UIView alloc] initWithFrame:CGRectMake(0, -kScreenHeight / 2 - 0.5, self.bounds.size.width, kScreenHeight / 2)];
        [contentView setAlpha:0.0f];
        [self addSubview:contentView];
        
        rightSrcContentView = [[UIView alloc] initWithFrame:CGRectMake(contentView.bounds.size.width / 2, 0, contentView.bounds.size.width / 2, contentView.bounds.size.height)];
        [rightSrcContentView setBackgroundColor:[UIColor colorWithRed:((CGFloat)231)/255 green:((CGFloat)232)/255 blue:((CGFloat)234)/255 alpha:1.0f]];
        [rightSrcContentView setClipsToBounds:YES];
        [contentView addSubview:rightSrcContentView];
        
        leftSrcContentView = [[UIView alloc] initWithFrame:contentView.bounds];
        [leftSrcContentView setBackgroundColor:[UIColor colorWithRed:((CGFloat)249)/255 green:((CGFloat)246)/255 blue:((CGFloat)246)/255 alpha:1.0f]];
        [leftSrcContentView setClipsToBounds:YES];
        [contentView addSubview:leftSrcContentView];
    }
    
    return self;
}

-(void)showFilterContentView {
    [UIView animateWithDuration:0.5f animations:^{
        [contentView setFrame:CGRectMake(contentView.frame.origin.x, contentView.frame.origin.y + kScreenHeight / 2, contentView.frame.size.width, contentView.frame.size.height)];
        [contentView setAlpha:1.0f];
    }];
    return ;
}

-(void)dismissFilterContentView {
    [UIView animateWithDuration:0.5f animations:^{
        [contentView setFrame:CGRectMake(contentView.frame.origin.x, -kScreenHeight / 2 - 0.5, contentView.frame.size.width, contentView.frame.size.height)];
        [contentView setAlpha:0.0f];
    } completion:^(BOOL finished) {
        [self removeFromSuperview];
    }];
}

-(void)addLeftSrouceWithArray:(NSArray *)leftSrcArray RightSourceArray:(NSArray *)rightSrcArray {
    
    NSAssert(leftSrcArray.count == rightSrcArray.count, @"left source array count must equal to right source array count.");
    
    if(rightSrcArray != nil)
        rightSourceArray = [NSArray arrayWithArray:rightSrcArray];
    
    for (UIView* subview in leftSrcContentView.subviews) {
        [subview removeFromSuperview];
    }
    
    for (int i = 0; i!= leftSrcArray.count; ++i) {
        ZQFilterButton* filterButton = [[ZQFilterButton alloc] initWithFrame:CGRectMake(0, i*kItemHeight, leftSrcContentView.frame.size.width, kItemHeight) isLeftFilterItemStyle:YES];
        [filterButton setTitle:leftSrcArray[i] forState:UIControlStateNormal];
        [filterButton addTarget:self action:@selector(filterItemSelected:) forControlEvents:UIControlEventTouchDown];
        [filterButton setTag:i];
        [leftSrcContentView addSubview:filterButton];
        
        if(i == 0)
           [self filterItemSelected:filterButton];
    }
    
    return ;
}

-(void)addRightSrcContentWithIndex:(NSInteger)index {
    
    if(((NSArray*)rightSourceArray[index]).count == 0)
        [UIView animateWithDuration:0.5f animations:^{
            [leftSrcContentView setFrame:CGRectMake(leftSrcContentView.frame.origin.x, leftSrcContentView.frame.origin.y, contentView.bounds.size.width, contentView.bounds.size.height)];
            for (UIView* subView in leftSrcContentView.subviews) {
                [subView setFrame:CGRectMake(subView.frame.origin.x, subView.frame.origin.y, contentView.frame.size.width, subView.frame.size.height)];
            }
        }];
    else {
        [UIView animateWithDuration:0.5f animations:^{
            [leftSrcContentView setFrame:CGRectMake(leftSrcContentView.frame.origin.x, leftSrcContentView.frame.origin.y, contentView.bounds.size.width / 2, leftSrcContentView.frame.size.height)];
            for (UIView* subView in leftSrcContentView.subviews) {
                [subView setFrame:CGRectMake(subView.frame.origin.x, subView.frame.origin.y, contentView.frame.size.width, subView.frame.size.height)];
            }
        }];
        
        for (UIView* subview in rightSrcContentView.subviews) {
            [subview removeFromSuperview];
        }
        
        for (int i = 0; i!= ((NSArray*)rightSourceArray[index]).count; ++i) {
            ZQFilterButton* filterButton = [[ZQFilterButton alloc] initWithFrame:CGRectMake(0, i*kItemHeight, rightSrcContentView.frame.size.width, kItemHeight) isLeftFilterItemStyle:NO];
            [filterButton setTitle:((NSArray*)rightSourceArray[index])[i] forState:UIControlStateNormal];
            [filterButton addTarget:self action:@selector(rightFilterItemSelected:) forControlEvents:UIControlEventTouchDown];
            [filterButton setTag:i];
            [rightSrcContentView addSubview:filterButton];
            
            if(i == 0)
                [self rightFilterItemSelected:filterButton];
        }
    }
    
    return ;
}

-(void)filterItemSelected:(ZQFilterButton*)sender {

    [UIView animateWithDuration:0.5f animations:^{
        [selectedButton setSelected:NO];
        selectedButton = sender;
        [selectedButton setSelected:YES];
    }];
    
    [self addRightSrcContentWithIndex:sender.tag];
    
    return ;
}

-(void)rightFilterItemSelected:(ZQFilterButton*)sender {
    NSLog(@"%@",sender.titleLabel.text);
    return ;
}

@end
