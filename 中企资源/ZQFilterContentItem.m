//
//  ZQFilterContentItem.m
//  中企资源
//
//  Created by 王落凡 on 15/6/18.
//  Copyright (c) 2015年 王落凡. All rights reserved.
//

#import "ZQFilterContentItem.h"

@interface ZQFilterContentItem () {
    UIImageView* closureImageView;
    UIImageView* checkMarkImageView;
}

@end

@implementation ZQFilterContentItem

-(instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    
    if(self) {
        self.isFilterContentItemHasSubMenu = NO;
        
        [self setTitleColor:[UIColor colorWithRed:((CGFloat)167)/255 green:((CGFloat)167)/255 blue:((CGFloat)168)/255 alpha:1.0f] forState:UIControlStateNormal];
        [self setTitleColor:[UIColor colorWithRed:((CGFloat)98)/255 green:((CGFloat)165)/255 blue:((CGFloat)227)/255 alpha:1.0f] forState:UIControlStateSelected];
        [self.titleLabel setFont:[UIFont systemFontOfSize:12.0f]];
        [self setTitleEdgeInsets:UIEdgeInsetsMake(0, 20, 0, 0)];
        [self setImageEdgeInsets:UIEdgeInsetsMake(0, 10, 0, 0)];
        [self setContentHorizontalAlignment:UIControlContentHorizontalAlignmentLeft];
        
        closureImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"closure"]];
        [closureImageView setFrame:CGRectMake(self.frame.size.width - 10 - closureImageView.image.size.width / 2, 0, closureImageView.image.size.width / 2, closureImageView.image.size.height / 2)];
        [closureImageView setCenter:CGPointMake(closureImageView.center.x, self.frame.size.height / 2)];
        [closureImageView setContentMode:UIViewContentModeScaleAspectFit];
        
        checkMarkImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"connrect"]];
        [checkMarkImageView setFrame:CGRectMake(checkMarkImageView.image.size.width / 2, 0, checkMarkImageView.image.size.width / 2, checkMarkImageView.image.size.height / 2)];
        [checkMarkImageView setCenter:CGPointMake(checkMarkImageView.center.x, self.frame.size.height / 2)];
    }
    
    return self;
}

-(void)setHasSubMenu {
    self.isFilterContentItemHasSubMenu = YES;
    [self addSubview:closureImageView];
    return ;
}

-(void)setSelected:(BOOL)selected {
    [super setSelected:selected];
    
    if(selected) {
        [self setBackgroundColor:[UIColor colorWithRed:((CGFloat)231)/255 green:((CGFloat)232)/255 blue:((CGFloat)  234)/255 alpha:1.0f]];
    }else {
        [self setBackgroundColor:[UIColor clearColor]];
    }
    
    if(![self isLeftFilterContentItem]){
        if(selected) {
            [self addSubview:checkMarkImageView];
        }
        else {
            [checkMarkImageView removeFromSuperview];
        }
    }
    
    return ;
}

@end
