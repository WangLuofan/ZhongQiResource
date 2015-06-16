//
//  ZQSplitToolView.h
//  中企资源
//
//  Created by 王落凡 on 15/6/15.
//  Copyright (c) 2015年 王落凡. All rights reserved.
//

#import <UIKit/UIKit.h>

@class ZQSplitToolView;
@protocol ZQSplitToolViewDelegate <NSObject>

@optional
-(void)splitToolView:(ZQSplitToolView*)splitToolView itemSelectionChangedToIndex:(NSInteger)toIndex;

@end

@interface ZQSplitToolView : UIScrollView

@property(nonatomic,assign) id<ZQSplitToolViewDelegate> splitToolViewDelegate;

-(instancetype)initWithFrame:(CGRect)frame ItemTitleComponentsArray:(NSArray*)componments;
-(void)setSplitToolComponentsWithArray:(NSArray*)componments;

@end
