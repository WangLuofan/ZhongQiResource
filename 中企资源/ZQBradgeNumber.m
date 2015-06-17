//
//  ZQBradgeNumber.m
//  中企资源
//
//  Created by 王落凡 on 15/6/16.
//  Copyright (c) 2015年 王落凡. All rights reserved.
//

#import "ZQBradgeNumber.h"

#define kBradgeNumberButtonSize 14

@implementation ZQBradgeNumber

+(instancetype)newInstance {
    ZQBradgeNumber* bradgeNumber = [super buttonWithType:UIButtonTypeCustom];
    [bradgeNumber setFrame:CGRectMake(0, 0, kBradgeNumberButtonSize, kBradgeNumberButtonSize)];
    [bradgeNumber setEnabled:NO];
    [bradgeNumber.titleLabel setFont:[UIFont systemFontOfSize:10.0f]];
    [bradgeNumber.layer setCornerRadius:kBradgeNumberButtonSize / 2];
    [bradgeNumber setBackgroundColor:[UIColor redColor]];
    [bradgeNumber setBradgeNumber:0];
    
    return bradgeNumber;
}

-(void)setFrame:(CGRect)frame {
    [super setFrame:frame];
    [self.layer setCornerRadius:frame.size.width / 2];
    
    return ;
}

-(void)setBradgeNumber:(NSInteger)bradgeNumber {
    if(bradgeNumber == 0) {
        [self setHidden:YES];
        return ;
    }
    [self setHidden:NO];
    [self setTitle:[NSString stringWithFormat:@"%ld",(long)bradgeNumber] forState:UIControlStateNormal];
    return ;
}

@end
