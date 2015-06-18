//
//  ZQToolBar.m
//  中企资源
//
//  Created by 王落凡 on 15/6/18.
//  Copyright (c) 2015年 王落凡. All rights reserved.
//

#import "ZQToolBar.h"

#define kToolBarHeight 44
#define kSeperatorLineWidth 0.5
#define kCenterItemRatio 0.5

@interface ZQToolBar ()<ZQFilterViewDelegate> {
    UIView* coverView;
    UIView* _superView;
    
    ZQToolBarItem* currentSelectedToolBarItem;
    
    BOOL hasFilterViewShown;
}

@end

@implementation ZQToolBar

-(instancetype)initWithStyles:(NSArray *)styleArray TextArray:(NSArray *)textArray SuperView:(UIView *)superView Delegate:(id<ZQToolBarDelegate>)delegate{
    self = [super init];
    
    if(self) {
        _superView = superView;
        
        hasFilterViewShown = NO;
        
        [self setBackgroundColor:[UIColor colorWithRed:((CGFloat)245)/255 green:((CGFloat)246)/255 blue:((CGFloat)247)/255 alpha:1.0f]];
        [self setFrame:CGRectMake(0, 0, superView.bounds.size.width, kToolBarHeight)];
       
        coverView = [[UIView alloc] initWithFrame:CGRectMake(0, self.frame.size.height, superView.bounds.size.width, superView.bounds.size.height)];
        [coverView setBackgroundColor:[UIColor blackColor]];
        [coverView setAlpha:0.5f];
        [coverView addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(coverViewTapped:)]];
        
        [self setDelegate:delegate];
        
        [self setToolBarItemStyle:styleArray TextArray:textArray];
    }
    
    return self;
}

-(void)setToolBarItemStyle:(NSArray *)styleArray TextArray:(NSArray*)textArray{
    
    for (UIView* subView in self.subviews) {
        [subView removeFromSuperview];
    }
    
    CGFloat xPosition = 0.0f;
    CGFloat itemWidth = (self.frame.size.width * (1-kCenterItemRatio)) / (styleArray.count - 1);
    
    for (int i = 0; i != styleArray.count; ++i) {
        if([styleArray[i] isEqualToString:ZQToolBarButtonItem]) {
            ZQToolBarItem* toolItem = nil;
            if(i == styleArray.count / 2)
                toolItem = [[ZQToolBarItem alloc] initWithFrame:CGRectMake(xPosition, 0, self.frame.size.width*kCenterItemRatio, self.frame.size.height)];
            else
                toolItem = [[ZQToolBarItem alloc] initWithFrame:CGRectMake(xPosition, 0, itemWidth, self.frame.size.height)];
            
            toolItem.filterView = [[ZQFilterView alloc] initWithFrame:CGRectMake(0, self.bounds.size.height - kScreenHeight / 2, _superView.bounds.size.width, kScreenHeight / 2)];
            [toolItem.filterView setDelegate:self];
            
            [toolItem setTag:i];
            [toolItem setTitle:textArray[i] forState:UIControlStateNormal];
            [toolItem addTarget:self action:@selector(toolBarItemSelected:) forControlEvents:UIControlEventTouchDown];
            
            if([self.delegate respondsToSelector:@selector(loadMenuItemsForToolBarButtonItem:)])
                [self.delegate loadMenuItemsForToolBarButtonItem:toolItem];
            
            xPosition += toolItem.frame.size.width ;
            [self addSubview:toolItem];
        }else {
            UISearchBar* searchBar = nil;
            if( i == styleArray.count / 2)
                searchBar = [[UISearchBar alloc] initWithFrame:CGRectMake(xPosition, 0, self.frame.size.width*kCenterItemRatio, self.bounds.size.height)];
            else
                searchBar = [[UISearchBar alloc] initWithFrame:CGRectMake(xPosition, 0, itemWidth, self.bounds.size.height)];
            [searchBar setTag:i];
            [searchBar setPlaceholder:textArray[i]];
            xPosition += searchBar.frame.size.width;
            [self addSubview:searchBar];
        }
        
        //分隔线
        if(i < styleArray.count - 2) {
            UIView* seperatorLineRight = [[UIView alloc] initWithFrame:CGRectMake(((UIView*)self.subviews[i]).bounds.size.width - kSeperatorLineWidth, 0, kSeperatorLineWidth, self.frame.size.height)];
            [seperatorLineRight setBackgroundColor:[UIColor lightGrayColor]];
            [((UIView*)self.subviews[i]) addSubview:seperatorLineRight];
        }else if (i == styleArray.count - 1) {
            UIView* seperatorLineLeft = [[UIView alloc] initWithFrame:CGRectMake(0, 0, kSeperatorLineWidth, self.frame.size.height)];
            [seperatorLineLeft setBackgroundColor:[UIColor lightGrayColor]];
            [((UIView*)self.subviews[i]) addSubview:seperatorLineLeft];
        }
    }
    
    return ;
}

-(void)presentFilterView:(ZQFilterView *)filterView {
    [_superView addSubview:coverView];
    [_superView addSubview:filterView];
    [_superView bringSubviewToFront:self];
    
    [UIView animateWithDuration:0.3f animations:^{
        [filterView setFrame:CGRectMake(filterView.frame.origin.x, self.frame.size.height, filterView.frame.size.width, filterView.frame.size.height)];
    } completion:^(BOOL finished) {
    }];
    return ;
}

-(void)dismissFilterView:(ZQFilterView *)filterView {
    
    [self dismissFilterView:filterView complete:^{
        hasFilterViewShown = NO;
        [filterView removeFromSuperview];
        [coverView removeFromSuperview];
    }];
    
    return ;
}

-(void)dismissFilterView:(ZQFilterView *)filterView complete:(CompletitionBlock)complete {
    [UIView animateWithDuration:0.3f animations:^{
        [filterView setFrame:CGRectMake(filterView.frame.origin.x, self.frame.size.height - filterView.frame.size.height, filterView.frame.size.width, filterView.frame.size.height)];
    } completion:^(BOOL finished) {
        complete();
        NSArray* textCollection = [filterView getMultiSelectedItemsTextCollection];
        if(textCollection != nil)
            NSLog(@"%@",textCollection);
    }];
    
    return ;
}

-(void)toolBarItemSelected:(ZQToolBarItem*)sender {
    if(![sender isEqual:currentSelectedToolBarItem]) {
        [self dismissFilterView:currentSelectedToolBarItem.filterView complete:^{
            currentSelectedToolBarItem = sender;
            [self presentFilterView:currentSelectedToolBarItem.filterView];
            hasFilterViewShown = YES;
        }];
    }else {
        if(hasFilterViewShown) {
            [self dismissFilterView:sender.filterView];
            hasFilterViewShown = NO;
        }
        else {
            [self presentFilterView:sender.filterView];
            hasFilterViewShown = YES;
        }
    }
    return ;
}

-(void)coverViewTapped:(UIGestureRecognizer*)sender {
    [self dismissFilterView:currentSelectedToolBarItem.filterView];
    return ;
}

-(void)filterView:(ZQFilterView *)filterView singleSelectedItemText:(NSString *)singleSelectedItemText {
    NSLog(@"%@",singleSelectedItemText);
    [self dismissFilterView:filterView];
    
    return ;
}

@end
