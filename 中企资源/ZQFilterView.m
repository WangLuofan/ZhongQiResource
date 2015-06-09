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
    ZQFilterButton* selectedLeftButton;
    ZQFilterButton* selectedRightButton;
    
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
        
        leftSrcContentView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, contentView.bounds.size.width / 2, contentView.bounds.size.height)];
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
        
        if(selectedLeftButton != nil)
            [selectedLeftButton setSelected:YES];
        if(selectedRightButton != nil) {
            [selectedRightButton setSelected:YES];
        }
    } completion:^(BOOL finished) {
        if(finished)
            self.filterViewShown = YES;
    }];
    return ;
}

-(void)dismissFilterContentView {
    [UIView animateWithDuration:0.5f animations:^{
        [contentView setFrame:CGRectMake(contentView.frame.origin.x, -kScreenHeight / 2 - 0.5, contentView.frame.size.width, contentView.frame.size.height)];
        [contentView setAlpha:0.0f];
    } completion:^(BOOL finished) {
        if(finished) {
            [self removeFromSuperview];
            self.filterViewShown = NO;
        }
    }];
}

-(BOOL)needsUpdateDataSource {
    return (leftSrcContentView.subviews.count == 0);
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
        [filterButton setTag:i];
        [filterButton setTitle:leftSrcArray[i] forState:UIControlStateNormal];
        [filterButton addTarget:self action:@selector(filterItemSelected:) forControlEvents:UIControlEventTouchDown];
        
        if([rightSrcArray[i] count] != 0) {
            UIImageView* imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"closure"]];
            [imageView setFrame:CGRectMake(filterButton.frame.size.width - imageView.image.size.width, 0, imageView.image.size.width / 2, imageView.image.size.height / 2)];
            [imageView setCenter:CGPointMake(imageView.center.x, filterButton.frame.size.height / 2)];
            [filterButton addSubview:imageView];
        }
            
        [filterButton setTag:i];
        [leftSrcContentView addSubview:filterButton];
        
        if(i == 0) {
            UIImageView* allImage = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"all"]];
            [allImage setFrame:CGRectMake(allImage.image.size.width / 2, 0, allImage.image.size.width / 2, allImage.image.size.height / 2)];
            [allImage setCenter:CGPointMake(allImage.center.x, filterButton.frame.size.height / 2)];
            [filterButton addSubview:allImage];
            [self filterItemSelected:filterButton];
        }
    }
    
    return ;
}

-(void)addRightSrcContentWithIndex:(NSInteger)index {
    
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
            [self rightFilterItemSelected:nil];
    }
    
    return ;
}

-(void)filterItemSelected:(ZQFilterButton*)sender {

    [UIView animateWithDuration:0.5f animations:^{
        [selectedLeftButton setSelected:NO];
        selectedLeftButton = sender;
        [selectedLeftButton setSelected:YES];
    }];
    if([rightSourceArray[sender.tag] count] != 0)
        [self addRightSrcContentWithIndex:sender.tag];
    else {
        
        for (UIView* subView in rightSrcContentView.subviews) {
            [subView removeFromSuperview];
        }
        
        [self dismissFilterContentView];
        if([self.delegate respondsToSelector:@selector(filterView:itemTextSelected:)])
            [self.delegate filterView:self itemTextSelected:sender.titleLabel.text];
    }
    
    return ;
}

-(void)rightFilterItemSelected:(ZQFilterButton*)sender {
    [UIView animateWithDuration:0.5f animations:^{
        [selectedRightButton setSelected:NO];
        if(sender == nil)
            selectedRightButton = rightSrcContentView.subviews[0];
        else
            selectedRightButton = sender;
        [selectedRightButton setSelected:YES];
    }];
    
    if(sender != nil) {
        [self dismissFilterContentView];
        if([self.delegate respondsToSelector:@selector(filterView:itemTextSelected:)])
            [self.delegate filterView:self itemTextSelected:sender.titleLabel.text];
    }
    
    return ;
}

@end
