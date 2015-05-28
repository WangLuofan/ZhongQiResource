//
//  ZQCollectionContentView.m
//  中企资源
//
//  Created by 王落凡 on 15/5/27.
//  Copyright (c) 2015年 王落凡. All rights reserved.
//

#import "ZQCollectionContentView.h"

#define kTitleLabelRatio 0.3
@implementation ZQCollectionContentView

-(instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    
    if(self) {
        self.imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, self.frame.size.width, self.frame.size.height*(1-kTitleLabelRatio))];
        [self.imageView setContentMode:UIViewContentModeScaleAspectFit];
        [self addSubview:self.imageView];
        
        self.titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, self.frame.size.height*(1-kTitleLabelRatio), self.frame.size.width, self.frame.size.height*kTitleLabelRatio)];
        [self.titleLabel setTextAlignment:NSTextAlignmentCenter];
        [self addSubview:self.titleLabel];
    }
    
    return self;
}

@end
