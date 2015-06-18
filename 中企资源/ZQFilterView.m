//
//  ZQFilterView.m
//  中企资源
//
//  Created by 王落凡 on 15/6/18.
//  Copyright (c) 2015年 王落凡. All rights reserved.
//

#import "ZQFilterContentItem.h"
#import "ZQFilterView.h"

#define kFilterContentItemHeight 20

@interface ZQFilterView () {
    NSArray* leftContentSrcArray;
    NSArray* rightContentSrcArray;
    ZQFilterContentItem* selectedLeftContentItem;
    ZQFilterContentItem* selectedRightContentItem;
    NSMutableArray* selectedLeftContentItemArray;
    NSMutableArray* selectedRightContentItemArray;
    
    BOOL canSelectMultiItem;
}

@end

@implementation ZQFilterView

-(instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    
    if(self) {
        canSelectMultiItem = NO;
        
        self.rightFilterScrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(self.frame.size.width / 2, 0, self.frame.size.width / 2, self.frame.size.height)];
        [self.rightFilterScrollView setShowsHorizontalScrollIndicator:NO];
        [self.rightFilterScrollView setBackgroundColor:[UIColor colorWithRed:((CGFloat)231)/255 green:((CGFloat)232)/255 blue:((CGFloat)234)/255 alpha:1.0f]];
        [self addSubview:self.rightFilterScrollView];
        
        self.leftFilterScrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, self.frame.size.width / 2, self.frame.size.height)];
        [self.leftFilterScrollView setBackgroundColor:[UIColor colorWithRed:((CGFloat)249)/255 green:((CGFloat)246)/255 blue:((CGFloat)246)/255 alpha:1.0f]];
        [self.leftFilterScrollView setShowsHorizontalScrollIndicator:NO];
        [self addSubview:self.leftFilterScrollView];
    }
    
    return self;
}

-(void)setleftFilterContentWithArray:(NSArray *)leftSrcArray RightFilterContentArray:(NSArray *)rightSrcArray {
    for (UIView* subView in self.leftFilterScrollView.subviews) {
        [subView removeFromSuperview];
    }
    [self.leftFilterScrollView setContentSize:CGSizeZero];
    
    leftContentSrcArray = [NSArray arrayWithArray:leftSrcArray];
    rightContentSrcArray = [NSArray arrayWithArray:rightSrcArray];
    
    for (int i = 0; i != leftSrcArray.count; ++i) {
        ZQFilterContentItem* contentItem = [[ZQFilterContentItem alloc] initWithFrame:CGRectMake(0, i*kFilterContentItemHeight, self.leftFilterScrollView.frame.size.width, kFilterContentItemHeight)];
        [contentItem setTag:i];
        [contentItem setTitle:(NSString *)leftSrcArray[i] forState:UIControlStateNormal];
        [contentItem addTarget:self action:@selector(contentItemSelected:) forControlEvents:UIControlEventTouchDown];
        
        if(rightContentSrcArray.count ==0  || rightContentSrcArray.count < i+1 ||((NSArray*)rightContentSrcArray[i]).count == 0 ) {
            [contentItem setIsLeftFilterContentItem:NO];
        }
        else {
            [contentItem setIsLeftFilterContentItem:YES];
            [contentItem setHasSubMenu];
        }
        
        [self.leftFilterScrollView addSubview:contentItem];
    }
//    [self contentItemSelected:nil];
    [self.leftFilterScrollView setContentSize:CGSizeMake(0, leftSrcArray.count*kFilterContentItemHeight)];
    return ;
}

-(void)setFilterViewEnableMultiSelect:(BOOL)bMulti {
    canSelectMultiItem = bMulti;
    return ;
}

-(void)contentItemSelected:(ZQFilterContentItem*)sender {
    if(selectedLeftContentItemArray == nil)
        selectedLeftContentItemArray = [[NSMutableArray alloc] init];
    
    //多选
    if(canSelectMultiItem) {
        //如果有子菜单，单选，加载子菜单
        if([sender isFilterContentItemHasSubMenu]) {
            //清空之前的所有选择
            for (ZQFilterContentItem* item in selectedLeftContentItemArray) {
                [item setSelected:NO];
            }
            
            [selectedLeftContentItem setSelected:NO];
            selectedLeftContentItem = sender;
            [selectedLeftContentItem setSelected:YES];
            
            NSArray* rightSrcArray = (NSArray*)rightContentSrcArray[sender.tag];
            [self reloadRightContentSrcWithArray:rightSrcArray];
        }else{
            //如果当前选择项有子菜单，则取消选择，清空右侧菜单项
            if([selectedLeftContentItem isFilterContentItemHasSubMenu])
                [selectedLeftContentItem setSelected:NO];
            
            for (ZQFilterContentItem* item in self.rightFilterScrollView.subviews) {
                [item removeFromSuperview];
            }
            
            selectedLeftContentItem = sender;
            if(selectedLeftContentItem.selected) {
                [selectedLeftContentItemArray removeObject:selectedLeftContentItem];
                [selectedLeftContentItem setSelected:NO];
            }else {
                [selectedLeftContentItemArray addObject:selectedLeftContentItem];
                [selectedLeftContentItem setSelected:YES];
            }
        }
    }else{
        //有子菜单,加载子菜单
        [selectedLeftContentItem setSelected:NO];
        selectedLeftContentItem = sender;
        [selectedLeftContentItem setSelected:YES];
        
        if(sender.isFilterContentItemHasSubMenu) {
            NSArray* rightSrcArray = (NSArray*)rightContentSrcArray[sender.tag];
            [self reloadRightContentSrcWithArray:rightSrcArray];
        }else{
            for (ZQFilterContentItem* item in self.rightFilterScrollView.subviews) {
                [item removeFromSuperview];
            }
            //单选直接传输
            if([self.delegate respondsToSelector:@selector(filterView:singleSelectedItemText:)])
                [self.delegate filterView:self singleSelectedItemText:[selectedLeftContentItem titleForState:UIControlStateNormal]];
        }
    }
    
    [selectedRightContentItemArray removeAllObjects];
    return ;
}

-(void)reloadRightContentSrcWithArray:(NSArray*)contentArray {
    if(selectedRightContentItemArray == nil)
        selectedRightContentItemArray = [[NSMutableArray alloc] init];
    
    for (UIView* subView in self.rightFilterScrollView.subviews) {
        [subView removeFromSuperview];
    }
    [self.rightFilterScrollView setContentSize:CGSizeZero];
    if(contentArray == nil)
        return ;
    
    for (int i = 0; i != contentArray.count; ++i) {
        ZQFilterContentItem* contentItem = [[ZQFilterContentItem alloc] initWithFrame:CGRectMake(0, i*kFilterContentItemHeight, self.rightFilterScrollView.frame.size.width, kFilterContentItemHeight)];
        [contentItem setTag:i];
        [contentItem setIsLeftFilterContentItem:NO];
        [contentItem setTitle:(NSString *)contentArray[i] forState:UIControlStateNormal];
        [contentItem addTarget:self action:@selector(rightContentItemSelected:) forControlEvents:UIControlEventTouchUpInside];
        [self.rightFilterScrollView addSubview:contentItem];
    }
    [self.rightFilterScrollView setContentSize:CGSizeMake(0, contentArray.count*kFilterContentItemHeight)];
    
    return ;
}

-(void)rightContentItemSelected:(ZQFilterContentItem*)sender {
    [selectedLeftContentItemArray removeAllObjects];
    
    if(canSelectMultiItem) {
        selectedRightContentItem = sender;
        if(selectedRightContentItem.selected) {
            [selectedRightContentItem setSelected:NO];
            [selectedRightContentItemArray removeObject:selectedRightContentItem];
        }else {
            [selectedRightContentItem setSelected:YES];
            [selectedRightContentItemArray addObject:selectedRightContentItem];
        }
    }else{
        [selectedRightContentItemArray removeAllObjects];
        [selectedRightContentItem setSelected:NO];
        selectedRightContentItem = sender;
        [selectedRightContentItem setSelected:YES];
        
        //单选直接传输
        if([self.delegate respondsToSelector:@selector(filterView:singleSelectedItemText:)])
            [self.delegate filterView:self singleSelectedItemText:[selectedRightContentItem titleForState:UIControlStateNormal]];
    }
    
    return ;
}

-(NSArray *)getMultiSelectedItemsTextCollection {
    if(!canSelectMultiItem)
        return nil;
    
    NSMutableArray* textCollection = [[NSMutableArray alloc] init];
    
    if(selectedLeftContentItemArray.count != 0) {
        for (ZQFilterContentItem* item in selectedLeftContentItemArray) {
            [textCollection addObject:[item titleForState:UIControlStateNormal]];
        }
    }else {
        for (ZQFilterContentItem* item in selectedRightContentItemArray) {
            [textCollection addObject:[item titleForState:UIControlStateNormal]];
        }
    }
    
    return [textCollection copy];
}

@end
