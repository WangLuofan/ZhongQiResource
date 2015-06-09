//
//  ZQToolItem.m
//  中企资源
//
//  Created by 王落凡 on 15/6/9.
//  Copyright (c) 2015年 王落凡. All rights reserved.
//

#import "ZQFilterView.h"
#import "ZQToolItem.h"

#define kButtonImageRightBottomMargin 5
#define kButtonImageWidthHeight 10
#define kToolBarHeight 40

@implementation ZQToolItem

-(instancetype)initWithFrame:(CGRect)frame Title:(NSString *)title superView:(UIView *)superView {
    self = [super initWithFrame:frame];
    
    if(self) {
        [self setTitle:title forState:UIControlStateNormal];
        [self setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [self setTitleColor:[UIColor lightGrayColor] forState:UIControlStateHighlighted];
        [self.titleLabel setFont:[UIFont systemFontOfSize:10.0f]];
        [self setImage:[UIImage imageNamed:@"xz"] forState:UIControlStateNormal];
        [self.imageView setContentMode:UIViewContentModeScaleAspectFit];
        [self setImageEdgeInsets:UIEdgeInsetsMake(self.frame.size.height - kButtonImageRightBottomMargin - kButtonImageWidthHeight, self.frame.size.width - kButtonImageWidthHeight - kButtonImageRightBottomMargin, kButtonImageRightBottomMargin, kButtonImageRightBottomMargin)];
        [self setTitleEdgeInsets:UIEdgeInsetsMake(0, -kButtonImageRightBottomMargin*kButtonImageRightBottomMargin, 0, 0)];
        
        self.filterView = [[ZQFilterView alloc] initWithFrame:CGRectMake(0, kToolBarHeight, superView.bounds.size.width, superView.bounds.size.height)];
    }
    
    return self;
}

@end
