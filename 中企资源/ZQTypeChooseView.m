//
//  ZQTypeChooseView.m
//  中企资源
//
//  Created by 王落凡 on 15/6/3.
//  Copyright (c) 2015年 王落凡. All rights reserved.
//

#import "ZQTypeChooseView.h"

#define kItemHeight 40

@implementation ZQTypeChooseView

-(instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    
    if(self) {
        [self setBackgroundColor:[UIColor colorWithRed:((CGFloat)240)/255 green:((CGFloat)241)/255 blue:((CGFloat)242)/255 alpha:1.0f]];
        
        UILabel* title = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, self.bounds.size.width, kItemHeight)];
        [title setBackgroundColor:[UIColor colorWithRed:((CGFloat)35)/255 green:((CGFloat)131)/255 blue:((CGFloat)240)/255 alpha:1.0f]];
        [title setTextColor:[UIColor whiteColor]];
        [title setText:@"    选择类型"];
        [self addSubview:title];
    }
    
    return self;
}

-(void)setContentsWithArray:(NSArray *)contents type:(ZQTypeChooseViewType)type {
    self.chooseViewType = type;
    
    for (UIView* subview in self.subviews) {
        if([subview isKindOfClass:[UIButton class]])
            [subview removeFromSuperview];
    }
    
    for (int i = 0; i != contents.count; ++i) {
        UIButton* button = [UIButton buttonWithType:UIButtonTypeCustom];
        [button setFrame:CGRectMake(0, i*kItemHeight + kItemHeight, self.bounds.size.width, kItemHeight)];
        [button setTitle:contents[i] forState:UIControlStateNormal];
        [button setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
        [button setTitleColor:[UIColor blackColor] forState:UIControlStateHighlighted];
        [button addTarget:self action:@selector(itemClicked:) forControlEvents:UIControlEventTouchUpInside];
        
        UIView* seperatorLine = [[UIView alloc] initWithFrame:CGRectMake(0, button.frame.size.height - 0.5, button.frame.size.width, 0.5)];
        [seperatorLine setBackgroundColor:[UIColor lightGrayColor]];
        [button addSubview:seperatorLine];
        
        [self addSubview:button];
    }
    
    return ;
}

-(void)itemClicked:(UIButton*)sender {
    [UIView animateWithDuration:0.3f animations:^{
        [self setAlpha:0.0f];
    } completion:^(BOOL finished) {
        if([self.delegate respondsToSelector:@selector(chooseViewType:content:)])
            [self.delegate chooseViewType:self.chooseViewType content:sender.titleLabel.text];
    }];
    return ;
}

@end
