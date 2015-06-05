//
//  ZQEvaluateView.h
//  中企资源
//
//  Created by 王落凡 on 15/6/3.
//  Copyright (c) 2015年 王落凡. All rights reserved.
//

#import <UIKit/UIKit.h>

@class ZQEvaluateView;
@protocol ZQEvaluateViewDelegate <NSObject>

@optional
-(void)evaluateView:(ZQEvaluateView*)evaluateView commentButtonPressed:(UIButton*)commentButton;

@end

@interface ZQEvaluateView : UIView

@property(nonatomic,assign) id<ZQEvaluateViewDelegate> delegate;

-(void)setScore:(CGFloat)score commentCount:(NSInteger)commentCount;

@end
