//
//  ZQToolBar.m
//  中企资源
//
//  Created by 王落凡 on 15/5/29.
//  Copyright (c) 2015年 王落凡. All rights reserved.
//

#import "ZQFilterView.h"
#import "ZQToolBar.h"

#define kCenterItemRatio 0.5
#define kButtonImageRightBottomMargin 5
#define kButtonImageWidthHeight 10
#define kSeperatorLineWidth 0.5
#define kFilterViewHeight 40

@interface ZQToolBar () {
    ZQFilterView* filterView;
}

@end

@implementation ZQToolBar

-(instancetype)initWithSuperView:(UIView *)superView {
    self = [super init];
    
    if(self) {
        
        [self setBackgroundColor:[UIColor whiteColor]];
        [self.layer setShadowColor:[[UIColor lightGrayColor] CGColor]];
        [self.layer setShadowOffset:CGSizeMake(0.5, 0.5)];
        [self.layer setShadowOpacity:0.5f];
        [self.layer setShadowRadius:0.1f];
        [self.layer setMasksToBounds:NO];
        [self setFrame:CGRectMake(superView.frame.origin.x, superView.frame.origin.y, superView.bounds.size.width,kFilterViewHeight)];
    }
    
    return self;
}

-(instancetype)initWithSuperView:(UIView *)superView Styles:(NSArray *)styles Text:(NSArray *)text {
    self = [super init];
    
    if(self) {
        
        [self setBackgroundColor:[UIColor whiteColor]];
        [self.layer setShadowColor:[[UIColor lightGrayColor] CGColor]];
        [self.layer setShadowOffset:CGSizeMake(0.5, 0.5)];
        [self.layer setShadowOpacity:0.5f];
        [self.layer setShadowRadius:0.1f];
        [self.layer setMasksToBounds:NO];
        [self setFrame:CGRectMake(superView.frame.origin.x, superView.frame.origin.y, superView.bounds.size.width,kFilterViewHeight)];
        
        [self setStyles:styles Text:text];
    }
    
    return self;
}

-(void)setFilterCategory:(NSString *)filterCategory index:(NSInteger)index {
    if([filterCategory isEqualToString:ZQToolBarStyleButton]) {
        UIButton* filterButton = (UIButton*)[self.subviews objectAtIndex:index];
        [filterButton setTitle:filterCategory forState:UIControlStateNormal];
    }
    return ;
}

-(void)filterButtonPressed:(UIButton*)sender {
    if([self.delegate respondsToSelector:@selector(toolBar:Style:index:)])
        [self.delegate toolBar:self Style:ZQToolBarStyleButton index:sender.tag];
    return ;
}

-(void)showFilterContentViewInView:(UIView *)view leftSrcDict:(NSDictionary *)leftSrcDict rightSrcDict:(NSDictionary *)rightSrcDict {
    
    return ;
}

-(void)showFilterContentViewInView:(UIView *)view leftSrcArray:(NSArray *)leftSrcArray rightSrcArray:(NSArray *)rightSrcArray {
    
    if(filterView == nil) {
        filterView = [[ZQFilterView alloc] initWithFrame:CGRectMake(0, kFilterViewHeight, view.bounds.size.width, view.bounds.size.height)];
    }
    [view addSubview:filterView];
    [view bringSubviewToFront:self];
    
    if(leftSrcArray != nil)
        [filterView addLeftSrouceWithArray:leftSrcArray RightSourceArray:rightSrcArray];
    
    [filterView showFilterContentView];
    [self setIsFilterContentViewShown:YES];
    
    return ;
}

-(void)setStyles:(NSArray*)styles Text:(NSArray*)text {
    
    NSAssert(styles.count == text.count, @"Styles count must be equal to Text count");
    for (UIView* subView in self.subviews) {
        [subView removeFromSuperview];
    }
    
    NSInteger itemCount = styles.count;
    CGFloat xPosition = 0.0f;
    CGFloat kItemsWidth = self.frame.size.width*(1-kCenterItemRatio) / (itemCount - 1);
    for (int i = 0; i != itemCount; ++i) {
        if([((NSString*)styles[i]) isEqualToString:ZQToolBarStyleButton]) {
            
            UIButton* btn = [UIButton buttonWithType:UIButtonTypeCustom];
            if(i == itemCount / 2)
                [btn setFrame:CGRectMake(xPosition, 0, self.frame.size.width*kCenterItemRatio, self.frame.size.height)];
            else
                [btn setFrame:CGRectMake(xPosition, 0, kItemsWidth, self.frame.size.height)];
            [btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
            [btn setTitleColor:[UIColor lightGrayColor] forState:UIControlStateHighlighted];
            [btn setTitle:(NSString*)text[i] forState:UIControlStateNormal];
            [btn.titleLabel setFont:[UIFont systemFontOfSize:10.0f]];
            [btn setImage:[UIImage imageNamed:@"xz"] forState:UIControlStateNormal];
            [btn.imageView setContentMode:UIViewContentModeScaleAspectFit];
            [btn setImageEdgeInsets:UIEdgeInsetsMake(btn.frame.size.height - kButtonImageRightBottomMargin - kButtonImageWidthHeight, btn.frame.size.width - kButtonImageWidthHeight - kButtonImageRightBottomMargin, kButtonImageRightBottomMargin, kButtonImageRightBottomMargin)];
            [btn setTitleEdgeInsets:UIEdgeInsetsMake(0, -kButtonImageRightBottomMargin*kButtonImageRightBottomMargin, 0, 0)];
            [btn addTarget:self action:@selector(filterButtonPressed:) forControlEvents:UIControlEventTouchUpInside];
            [btn setTag:i];
            xPosition += btn.frame.size.width ;
            
            [self addSubview:btn];
            
        }else {
            
            UISearchBar* searchBar = nil;
            if( i == itemCount / 2)
                searchBar = [[UISearchBar alloc] initWithFrame:CGRectMake(xPosition, 0, self.frame.size.width*kCenterItemRatio, self.bounds.size.height)];
            else
                searchBar = [[UISearchBar alloc] initWithFrame:CGRectMake(xPosition, 0, kItemsWidth, self.bounds.size.height)];
            [searchBar setPlaceholder:(NSString *)text[i]];
            [searchBar setTranslucent:YES];
            [searchBar setTag:i];
            xPosition += searchBar.frame.size.width;
            [self addSubview:searchBar];
            
        }
        
        //分隔线
        if(i < itemCount - 2) {
            UIView* seperatorLineRight = [[UIView alloc] initWithFrame:CGRectMake(((UIView*)self.subviews[i]).bounds.size.width - kSeperatorLineWidth, 0, kSeperatorLineWidth, self.frame.size.height)];
            [seperatorLineRight setBackgroundColor:[UIColor lightGrayColor]];
            [((UIView*)self.subviews[i]) addSubview:seperatorLineRight];
        }else if (i == itemCount - 1) {
            UIView* seperatorLineLeft = [[UIView alloc] initWithFrame:CGRectMake(0, 0, kSeperatorLineWidth, self.frame.size.height)];
            [seperatorLineLeft setBackgroundColor:[UIColor lightGrayColor]];
            [((UIView*)self.subviews[i]) addSubview:seperatorLineLeft];
        }
        
    }
}

-(void)hideFilterContentView {
    [filterView dismissFilterContentView];
    [self setIsFilterContentViewShown:NO];
    return ;
}

@end
