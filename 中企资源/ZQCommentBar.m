//
//  ZQCommentBar.m
//  中企资源
//
//  Created by 王落凡 on 15/6/5.
//  Copyright (c) 2015年 王落凡. All rights reserved.
//

#import "ZQCommentBar.h"

#define kControlMargin 20

@interface ZQCommentBar () {
    UITextView* commentTextView;
    UIButton* sendButton;
    
    CGRect commentBarFrame;
}

@end

@implementation ZQCommentBar

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setBackgroundColor:[UIColor colorWithRed:((CGFloat)218)/255 green:((CGFloat)219)/255 blue:((CGFloat)220)/255 alpha:1.0f]];
        
        sendButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [sendButton setImage:[UIImage imageNamed:@"fasong"] forState:UIControlStateNormal];
        [sendButton setFrame:CGRectMake(self.bounds.size.width - kControlMargin / 2 - sendButton.imageView.image.size.width / 2, 0, sendButton.imageView.image.size.width / 2, sendButton.imageView.image.size.height / 2)];
        [sendButton setCenter:CGPointMake(sendButton.center.x, self.bounds.size.height / 2)];
        [self addSubview:sendButton];
        
        commentTextView = [[UITextView alloc] initWithFrame:CGRectMake(kControlMargin, 0, self.bounds.size.width - sendButton.frame.size.width - 2*kControlMargin, self.bounds.size.height - kControlMargin / 2)];
        [commentTextView setCenter:CGPointMake(commentTextView.center.x, self.bounds.size.height / 2)];
        [commentTextView.layer setCornerRadius:5.0f];
        [self addSubview:commentTextView];
        
        [self addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(backgroundTapped:)]];
        
        commentBarFrame = self.frame;
        
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillShowNotification:) name:UIKeyboardWillShowNotification object:nil];
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillHideNotification:) name:UIKeyboardWillHideNotification object:nil];
    }
    return self;
}

-(void)dealloc {
    [[NSNotificationCenter defaultCenter] removeObserver:self];
    return ;
}

-(BOOL)resignFirstResponder {
    for (UIView* subView in self.subviews) {
        [subView resignFirstResponder];
    }
    return YES;
}

-(void)keyboardWillShowNotification:(NSNotification*)notification {
    CGSize keyboardSize = [notification.userInfo[UIKeyboardFrameEndUserInfoKey] CGRectValue].size;
    [self setFrame:CGRectMake(self.frame.origin.x, commentBarFrame.origin.y - keyboardSize.height, self.frame.size.width, self.frame.size.height)];
    return ;
}

-(void)keyboardWillHideNotification:(NSNotification*)notification {
    [self setFrame:commentBarFrame];
    return;
}

-(void)backgroundTapped:(UIGestureRecognizer*)sender {
    [commentTextView resignFirstResponder];
}

@end
