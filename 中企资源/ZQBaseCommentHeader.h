//
//  ZQBaseCommentHeader.h
//  中企资源
//
//  Created by 王落凡 on 15/6/12.
//  Copyright (c) 2015年 王落凡. All rights reserved.
//

#import <UIKit/UIKit.h>

@class ZQBaseCommentHeader;
@protocol ZQBaseCommentHeaderDelegate <NSObject>

@optional
-(void)evaluateHeader:(ZQBaseCommentHeader*)evaluateHeader commentButtonPressed:(UIButton*)commentButton;

@end

@interface ZQBaseCommentHeader : UIView

@property(nonatomic,assign) id<ZQBaseCommentHeaderDelegate> delegate;

-(CGRect)contentViewBounds;
-(void)addSubviewToContentView:(UIView *)view;

@end
