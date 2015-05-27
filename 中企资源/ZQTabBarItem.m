//
//  ZQTabBarItem.m
//  中企资源
//
//  Created by 王落凡 on 15/5/27.
//  Copyright (c) 2015年 王落凡. All rights reserved.
//

#import "ZQTabBarItem.h"

#define ktitleRatio 0.4

@implementation ZQTabBarItem

-(instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    
    if(self) {
        [self.imageView setContentMode:UIViewContentModeScaleAspectFit];
        [self.titleLabel setTextAlignment:NSTextAlignmentCenter];
    }
    
    return self;
}

-(void)setHighlighted:(BOOL)highlighted {
    return ;
}

-(void)setSelected:(BOOL)selected {
    if(selected)
        [self setBackgroundColor:[UIColor colorWithRed:((CGFloat)16)/255 green:((CGFloat)106)/255 blue:((CGFloat)203)/255 alpha:1.0f]];
    else
        [self setBackgroundColor:[UIColor clearColor]];
    return ;
}

-(CGRect)titleRectForContentRect:(CGRect)contentRect {
    return CGRectMake(0, contentRect.size.height*(1-ktitleRatio), contentRect.size.width, contentRect.size.height*ktitleRatio);
}

-(CGRect)imageRectForContentRect:(CGRect)contentRect {
    return CGRectMake(contentRect.size.width / 2 - 15, 0, 30, 30);
}

@end
