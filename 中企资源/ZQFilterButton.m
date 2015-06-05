//
//  ZQFilterButton.m
//  中企资源
//
//  Created by 王落凡 on 15/6/5.
//  Copyright (c) 2015年 王落凡. All rights reserved.
//

#import "ZQFilterButton.h"

@interface ZQFilterButton () {
    UIColor* oldColor;
    
    BOOL isLeftFilterItemStyle;
}

@end

@implementation ZQFilterButton

-(void)setHighlighted:(BOOL)highlighted {
    return ;
}

-(instancetype)initWithFrame:(CGRect)frame isLeftFilterItemStyle:(BOOL)isLeft{
    self = [super initWithFrame:frame];
    
    if(self) {
        isLeftFilterItemStyle = isLeft;
        
        [self setTitleColor:[UIColor lightGrayColor] forState:UIControlStateNormal];
        if(isLeft) {
            [self setTitleColor:[UIColor colorWithRed:((CGFloat)103)/255 green:((CGFloat)167)/255 blue:((CGFloat)225)/255 alpha:1.0f] forState:UIControlStateSelected];
        }
        [self.titleLabel setFont:[UIFont systemFontOfSize:12.0f]];
        [self setContentHorizontalAlignment:UIControlContentHorizontalAlignmentLeft];
        [self setTitleEdgeInsets:UIEdgeInsetsMake(0, 2*frame.size.height, 0, 0)];
        oldColor = self.backgroundColor;
    }
    
    return self;
}

-(void)setSelected:(BOOL)selected {
    [super setSelected:selected];
    
    if(selected) {
        [self setBackgroundColor:[UIColor colorWithRed:((CGFloat)231)/255 green:((CGFloat)232)/255 blue:((CGFloat)234)/255 alpha:1.0f]];
    }else {
        [self setBackgroundColor:oldColor];
    }
        
    return ;
}

@end
