//
//  ZQCollectionContentView.m
//  中企资源
//
//  Created by 王落凡 on 15/5/27.
//  Copyright (c) 2015年 王落凡. All rights reserved.
//

#import "ZQCollectionContentView.h"

#define kTitleLabelRatio 0.2
#define kBradgeNumberSize 20

@implementation ZQCollectionContentView

-(instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    
    if(self) {
        self.imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, self.frame.size.width, self.frame.size.height*(1-kTitleLabelRatio))];
        [self.imageView setContentMode:UIViewContentModeScaleAspectFit];
        [self addSubview:self.imageView];
        
        self.titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, self.frame.size.height*(1-kTitleLabelRatio), self.frame.size.width, self.frame.size.height*kTitleLabelRatio)];
        [self.titleLabel setTextAlignment:NSTextAlignmentCenter];
        [self.titleLabel setFont:[UIFont systemFontOfSize:12.0f]];
        [self addSubview:self.titleLabel];
        
        self.bradgeNumber = [ZQBradgeNumber newInstance];
        [self.bradgeNumber setFrame:CGRectMake(0, 0, kBradgeNumberSize, kBradgeNumberSize)];
        [self.bradgeNumber setCenter:CGPointMake(self.imageView.frame.size.width * 2 / 3, self.imageView.frame.size.height * 1 / 3)];
        [self.imageView addSubview:self.bradgeNumber];
    }
    
    return self;
}

@end
