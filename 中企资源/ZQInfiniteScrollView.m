//
//  ZQInfiniteScrollView.m
//  ZQInfiniteScrollView
//
//  Created by 王落凡 on 15/6/20.
//  Copyright (c) 2015年 王落凡. All rights reserved.
//

#import "ZQPageControl.h"
#import "ZQInfiniteScrollView.h"

@interface ZQInfiniteScrollView ()<UIScrollViewDelegate> {
    UIScrollView* _scrollView;
    ZQPageControl* pageControl;
    int xCurrentOffset,currentPage;
    NSTimer* timer;
    CGFloat _timeInterval;
}

@end

@implementation ZQInfiniteScrollView

-(instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    
    if(self) {
        _scrollView = [[UIScrollView alloc] initWithFrame:self.bounds];
        
        [_scrollView setShowsVerticalScrollIndicator:NO];
        [_scrollView setShowsHorizontalScrollIndicator:NO];
        [_scrollView setBounces:NO];
        [_scrollView setPagingEnabled:YES];
        [_scrollView setDelegate:self];
        currentPage = 0;
        [self addSubview:_scrollView];
        
        pageControl = [[ZQPageControl alloc] initWithFrame:CGRectMake(0, _scrollView.bounds.size.height- 20, _scrollView.bounds.size.width / 2, 20)];
        [self addSubview:pageControl];
    }
    
    return self;
}

-(void)reloadImageForScrollViewWithImageNameArray:(NSArray*)imageNameArray {
    
    for (UIView* subView in self.subviews) {
        if([subView isKindOfClass:[UIImageView class]])
            [subView removeFromSuperview];
    }
    
    UIImageView* imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, _scrollView.bounds.size.width, _scrollView.bounds.size.height)];
    [imageView setTag:imageNameArray.count-1];
    [imageView setImage:[UIImage imageNamed:(NSString *)[imageNameArray lastObject]]];
    [_scrollView addSubview:imageView];
    
    for (int i = 0; i != imageNameArray.count - 1; ++i) {
        UIImageView* imageView = [[UIImageView alloc] initWithFrame:CGRectMake((i+1)*_scrollView.bounds.size.width, 0, _scrollView.bounds.size.width, _scrollView.bounds.size.height)];
        [imageView setImage:[UIImage imageNamed:(NSString *)imageNameArray[i]]];
        [_scrollView addSubview:imageView];
    }
    
    [pageControl setNumberOfPages:_scrollView.subviews.count];
    [pageControl setCenter:CGPointMake(self.frame.size.width / 2, pageControl.center.y)];
    [pageControl setCurrentPage:0];
    [_scrollView setContentSize:CGSizeMake(_scrollView.bounds.size.width * (imageNameArray.count ), 0)];
    [_scrollView setContentOffset:CGPointMake(_scrollView.bounds.size.width, 0)];
    xCurrentOffset = _scrollView.contentOffset.x;
    
    return ;
}

- (void)timerFireMethod:(NSTimer *)timer {
    [_scrollView setContentOffset:CGPointMake(_scrollView.contentOffset.x + _scrollView.bounds.size.width, 0) animated:YES];
    return ;
}

-(void)setScrollViewNeedsAutoScrollWithTimeInterval:(CGFloat)timeInterval {
    if(timeInterval)
        _timeInterval = timeInterval;
    
    if(timeInterval == 0.0f) {
        [timer invalidate];
        timer = nil;
    }else {
        timer = [NSTimer scheduledTimerWithTimeInterval:timeInterval target:self selector:@selector(timerFireMethod:) userInfo:nil repeats:YES];
    }
    
    return ;
}

-(void)resumeScrollViewAutoScroll {
    if(timer == nil)
        timer = [NSTimer scheduledTimerWithTimeInterval:_timeInterval target:self selector:@selector(timerFireMethod:) userInfo:nil repeats:YES];
    return ;
}

-(void)scrollViewDidScroll:(UIScrollView *)scrollView {
    CGFloat xContentOffset = scrollView.contentOffset.x / scrollView.bounds.size.width ;
    
    if(xContentOffset == 0.0f) {
        CGRect firstObjectFrameRect = ((UIImageView*)scrollView.subviews[0]).frame; //保留第一项的frame
        
        for (int i = 0; i != scrollView.subviews.count; ++i) {
            if(i == scrollView.subviews.count - 1) {
                [((UIImageView*)scrollView.subviews[i]) setFrame:firstObjectFrameRect];
            }else {
                [((UIImageView*)scrollView.subviews[i]) setFrame:((UIImageView*)scrollView.subviews[i+1]).frame];
            }
        }
        currentPage = (int)((--currentPage + scrollView.subviews.count) % scrollView.subviews.count);
        [scrollView setContentOffset:CGPointMake(scrollView.bounds.size.width, 0)];
        
    }else if(xContentOffset == scrollView.subviews.count - 1) {
        CGRect lastObjectFrameRect = ((UIImageView*)scrollView.subviews[scrollView.subviews.count - 1]).frame;
        
        for (int i = (int)scrollView.subviews.count - 1; i != -1; --i) {
            if(i == 0) {
                [((UIImageView*)scrollView.subviews[i]) setFrame:lastObjectFrameRect];
            }else {
                [((UIImageView*)scrollView.subviews[i]) setFrame:((UIImageView*)scrollView.subviews[i-1]).frame];
            }
        }
        
        currentPage = (int)((++currentPage + scrollView.subviews.count) % scrollView.subviews.count);
        [scrollView setContentOffset:CGPointMake(scrollView.bounds.size.width * (scrollView.subviews.count - 2), 0)];
        
    }else if(xContentOffset - (int)xContentOffset == 0.0f && _scrollView.contentOffset.x != xCurrentOffset){
        
        if(_scrollView.contentOffset.x > xCurrentOffset) {
            currentPage = (int)(((++currentPage) + scrollView.subviews.count) % scrollView.subviews.count);
        }else {
            currentPage = (int)(((--currentPage) + scrollView.subviews.count) % scrollView.subviews.count);
        }
        
        xCurrentOffset = _scrollView.contentOffset.x;
    }
    
    if(xContentOffset - (int)xContentOffset == 0) {
        if(currentPage)
           [pageControl setCurrentPage:currentPage - 1];
        else
            [pageControl setCurrentPage:_scrollView.subviews.count - 1];
    }
    
    return ;
}

@end
