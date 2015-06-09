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
    UIImageView* rightSelectedImage;
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
        
        rightSelectedImage = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"connrect"]];
        [rightSelectedImage setFrame:CGRectMake(rightSelectedImage.image.size.width / 2, 0, rightSelectedImage.image.size.width / 2, rightSelectedImage.image.size.height / 2)];
        [rightSelectedImage setCenter:CGPointMake(rightSelectedImage.center.x, self.bounds.size.height / 2)];
    }
    
    return self;
}

-(void)setSelected:(BOOL)selected {
    [super setSelected:selected];
    
    if(isLeftFilterItemStyle) {
        if(selected) {
            [self setBackgroundColor:[UIColor colorWithRed:((CGFloat)231)/255 green:((CGFloat)232)/255 blue:((CGFloat)  234)/255 alpha:1.0f]];
            for (UIView* subView in self.subviews) {
                if([subView isKindOfClass:[UIImageView class]]) {
                    [((UIImageView*)subView) setImage:[UIImage imageNamed:@"closure_h"]];
                    break ;
                }
            }
        }else {
            [self setBackgroundColor:oldColor];
            for (UIView* subView in self.subviews) {
                if([subView isKindOfClass:[UIImageView class]]) {
                    [((UIImageView*)subView) setImage:[UIImage imageNamed:@"closure"]];
                    break ;
                }
            }
        }
    }else {
        if(selected) {
            [self addSubview:rightSelectedImage];
        }else {
            [rightSelectedImage removeFromSuperview];
        }
    }
    
    return ;
}

@end
