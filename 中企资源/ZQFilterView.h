//
//  ZQFilterView.h
//  中企资源
//
//  Created by 王落凡 on 15/6/4.
//  Copyright (c) 2015年 王落凡. All rights reserved.
//

#import <UIKit/UIKit.h>

@class ZQFilterView;
@protocol ZQFilterViewDelegate <NSObject>

@optional
-(void)filterView:(ZQFilterView*)filterView itemTextSelected:(NSString*)itemText;

@end

@interface ZQFilterView : UIView

@property(nonatomic,assign) id<ZQFilterViewDelegate> delegate;
@property(nonatomic,assign) BOOL filterViewShown;

-(BOOL)needsUpdateDataSource;
-(void)showFilterContentViewWithControlButton:(UIButton*)controlButton;
-(void)dismissFilterContentViewWithControlButton:(UIButton*)controlButton;
-(void)addLeftSrouceWithArray:(NSArray*)leftSrcArray RightSourceArray:(NSArray*)rightSrcArray;;

@end
