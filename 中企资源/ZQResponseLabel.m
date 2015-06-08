//
//  ZQResponseLabel.m
//  中企资源
//
//  Created by 王落凡 on 15/6/5.
//  Copyright (c) 2015年 王落凡. All rights reserved.
//

#import "ZQResponseLabel.h"

#define kControlMargin 5

@implementation ZQResponseLabel

-(instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    
    if(self) {
        [self.titleLabel setFont:[UIFont systemFontOfSize:12.0f]];
        [self setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [self.titleLabel setNumberOfLines:0];
        [self.titleLabel setLineBreakMode:NSLineBreakByCharWrapping];
        [self setContentHorizontalAlignment:UIControlContentHorizontalAlignmentLeft];
    }
    
    return self;
}

-(void)setHighlighted:(BOOL)highlighted {
    [super setHighlighted:highlighted];
    
    if(highlighted)
        [self setBackgroundColor:[UIColor lightGrayColor]];
    else
        [self setBackgroundColor:[UIColor clearColor]];
    
    return ;
}

-(void)setCommentWithFrom:(NSString *)from To:(NSString *)to Conntent:(NSString *)content {
    NSAssert(from != nil || from.length != 0, @"回复人不能为空");
    
    self.from = from;
    self.to = to;
    
    NSMutableAttributedString* attrStr;
    if(to == nil) {
        attrStr = [[NSMutableAttributedString alloc] initWithString:[NSString stringWithFormat:@"%@ : %@",from,content]];
        
    } else {
        attrStr = [[NSMutableAttributedString alloc] initWithString:[NSString stringWithFormat:@"%@ 回复 %@: %@",from,to,content]];
        [attrStr addAttribute:NSForegroundColorAttributeName value:[UIColor colorWithRed:((CGFloat)55)/255 green:((CGFloat)111)/255 blue:((CGFloat)166)/255 alpha:1.0f] range:NSMakeRange(from.length + 4, to.length)];
    }
    
    [attrStr addAttribute:NSForegroundColorAttributeName value:[UIColor colorWithRed:((CGFloat)55)/255 green:((CGFloat)111)/255 blue:((CGFloat)166)/255 alpha:1.0f] range:NSMakeRange(0, from.length)];
    [attrStr addAttribute:NSFontAttributeName value:[UIFont systemFontOfSize:12.0f] range:NSMakeRange(0, attrStr.length)];
    
//    [self setAttributedText:attrStr];
    [self setAttributedTitle:attrStr forState:UIControlStateNormal];
    CGSize textSize = [attrStr boundingRectWithSize:CGSizeMake(self.frame.size.width, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin context:nil].size;
//    
    [self setFrame:CGRectMake(self.frame.origin.x, self.frame.origin.y, self.frame.size.width, textSize.height + kControlMargin)];
    return ;
}

@end