//
//  ZQCommentBar.h
//  中企资源
//
//  Created by 王落凡 on 15/6/5.
//  Copyright (c) 2015年 王落凡. All rights reserved.
//

#import <UIKit/UIKit.h>

@class ZQCommentBar;
@protocol ZQCommentBarDelegate <NSObject>

@optional
-(void)commentBar:(ZQCommentBar*)commentBar sendCommentContent:(NSString*)commentContent;

@end

typedef NS_ENUM(NSInteger, CommentBarStyle) {
    CommentBarStyleReplyToMain,CommentBarStyleReplyToOther
};

@interface ZQCommentBar : UIView

@property(nonatomic,assign) CommentBarStyle commentBarStyle;
@property(nonatomic,assign) id<ZQCommentBarDelegate> delegate;

-(void)setTextViewPlaceHolder:(NSString*)placeHolderText;
-(BOOL)resignFirstResponder;

@end
