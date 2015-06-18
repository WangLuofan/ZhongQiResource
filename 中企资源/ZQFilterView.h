//
//  ZQFilterView.h
//  中企资源
//
//  Created by 王落凡 on 15/6/18.
//  Copyright (c) 2015年 王落凡. All rights reserved.
//

#import <UIKit/UIKit.h>

@class ZQFilterView;
@protocol ZQFilterViewDelegate <NSObject>

@optional
-(void)filterView:(ZQFilterView*)filterView singleSelectedItemText:(NSString*)singleSelectedItemText;

@end

@interface ZQFilterView : UIView

@property(nonatomic,assign) id<ZQFilterViewDelegate> delegate;
@property(nonatomic,strong) UIScrollView* leftFilterScrollView;
@property(nonatomic,strong) UIScrollView* rightFilterScrollView;

-(void)setleftFilterContentWithArray:(NSArray*)leftSrcArray RightFilterContentArray:(NSArray*)rightSrcArray;
-(void)setFilterViewEnableMultiSelect:(BOOL)bMulti;
-(NSArray*)getMultiSelectedItemsTextCollection;

@end
