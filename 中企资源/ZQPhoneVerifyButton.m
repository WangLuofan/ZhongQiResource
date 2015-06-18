//
//  ZQPhoneVerifyButton.m
//  中企资源
//
//  Created by 王落凡 on 15/6/10.
//  Copyright (c) 2015年 王落凡. All rights reserved.
//

#import "ZQPhoneVerifyButton.h"

@implementation ZQPhoneVerifyButton

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setBackgroundColor:[UIColor colorWithRed:((CGFloat)13)/255 green:((CGFloat)184)/255 blue:0.0f alpha:1.0f]];
    }
    return self;
}

-(void)setEnabled:(BOOL)enabled {
    if(enabled)
        [self setBackgroundColor:[UIColor colorWithRed:((CGFloat)13)/255 green:((CGFloat)184)/255 blue:0.0f alpha:1.0f]];
    else
        [self setBackgroundColor:[UIColor grayColor]];
    [super setEnabled:enabled];
    return ;
}

-(void)setHighlighted:(BOOL)highlighted {
    [super setHighlighted:highlighted];
    
    if(highlighted)
       [self setBackgroundColor:[UIColor colorWithRed:((CGFloat)13)/255 green:((CGFloat)184)/255 blue:0.0f alpha:0.2f]];
    else
        [self setBackgroundColor:[UIColor colorWithRed:((CGFloat)13)/255 green:((CGFloat)184)/255 blue:0.0f alpha:1.0f]];
    
    return ;
}

@end
