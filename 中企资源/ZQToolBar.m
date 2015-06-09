//
//  ZQToolBar.m
//  中企资源
//
//  Created by 王落凡 on 15/5/29.
//  Copyright (c) 2015年 王落凡. All rights reserved.
//

#import "ZQFilterView.h"
#import "ZQToolBar.h"
#import "ZQToolItem.h"

#define kCenterItemRatio 0.5
#define kSeperatorLineWidth 0.5
#define kFilterViewHeight 40

@interface ZQToolBar ()<ZQFilterViewDelegate> {
    ZQToolItem* selectedToolItem;
}

@end

@implementation ZQToolBar

-(instancetype)initWithSuperView:(UIView *)superView {
    self = [super init];
    
    if(self) {
        self.superView = superView;
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
        self.superView = superView;
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
            
            ZQToolItem* toolItem = nil;
            if(i == itemCount / 2)
                toolItem = [[ZQToolItem alloc] initWithFrame:CGRectMake(xPosition, 0, self.frame.size.width*kCenterItemRatio, self.frame.size.height) Title:(NSString*)text[i] superView:self.superView];
            else
                toolItem = [[ZQToolItem alloc] initWithFrame:CGRectMake(xPosition, 0, kItemsWidth, self.frame.size.height) Title:(NSString*)text[i] superView:self.superView];
            [toolItem setTag:i];
            [toolItem.filterView setDelegate:self];
            [toolItem addTarget:self action:@selector(toolItemPressed:) forControlEvents:UIControlEventTouchUpInside];
            xPosition += toolItem.frame.size.width ;
            [self addSubview:toolItem];
            
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

-(void)showFilterView:(ZQFilterView*)filterView {
    [self.superView addSubview:filterView];
    [self.superView bringSubviewToFront:self];
    [filterView showFilterContentView];
    
    return ;
}

-(void)filterView:(ZQFilterView *)filterView itemTextSelected:(NSString *)itemText {
    [selectedToolItem setTitle:itemText forState:UIControlStateNormal];
    return ;
}

-(void)toolItemPressed:(ZQToolItem*)sender {
    if(![sender isEqual:selectedToolItem]) {
        [selectedToolItem.filterView dismissFilterContentView];
        selectedToolItem = sender;
        if([selectedToolItem.filterView needsUpdateDataSource])
            if([self.delegate respondsToSelector:@selector(toolBar:dataSourceForItem:itemIndex:)])
                [self.delegate toolBar:self dataSourceForItem:selectedToolItem itemIndex:selectedToolItem.tag];
        [self showFilterView:selectedToolItem.filterView];
    }else {
        if([selectedToolItem.filterView filterViewShown])
           [selectedToolItem.filterView dismissFilterContentView];
        else
            [self showFilterView:selectedToolItem.filterView];
    }
    
    return ;
}

@end
