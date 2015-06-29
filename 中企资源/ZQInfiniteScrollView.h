//
//  ZQInfiniteScrollView.h
//  ZQInfiniteScrollView
//
//  Created by 王落凡 on 15/6/20.
//  Copyright (c) 2015年 王落凡. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ZQInfiniteScrollView : UIView

-(void)reloadImageForScrollViewWithImageNameArray:(NSArray*)imageNameArray;
-(void)setScrollViewNeedsAutoScrollWithTimeInterval:(CGFloat)timeInterval;
-(void)resumeScrollViewAutoScroll;

@end
