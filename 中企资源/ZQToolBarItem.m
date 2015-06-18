//
//  ZQToolBarItem.m
//  中企资源
//
//  Created by 王落凡 on 15/6/18.
//  Copyright (c) 2015年 王落凡. All rights reserved.
//

#import "ZQToolBarItem.h"

#define kButtonImageRightBottomMargin 5
#define kButtonImageWidthHeight 10
#define kToolBarHeight 40

@implementation ZQToolBarItem

-(instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    
    if(self) {
        [self setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [self setTitleColor:[UIColor lightGrayColor] forState:UIControlStateHighlighted];
        [self.titleLabel setFont:[UIFont systemFontOfSize:10.0f]];
        [self setImage:[UIImage imageNamed:@"xz"] forState:UIControlStateNormal];
        [self.imageView setContentMode:UIViewContentModeScaleAspectFit];
        [self setImageEdgeInsets:UIEdgeInsetsMake(self.frame.size.height - kButtonImageRightBottomMargin - kButtonImageWidthHeight, self.frame.size.width - kButtonImageWidthHeight - kButtonImageRightBottomMargin, kButtonImageRightBottomMargin, kButtonImageRightBottomMargin)];
        [self setTitleEdgeInsets:UIEdgeInsetsMake(0, -kButtonImageRightBottomMargin*kButtonImageRightBottomMargin, 0, 0)];
        [self setClipsToBounds:YES];
    }
    
    return self;
}

@end
