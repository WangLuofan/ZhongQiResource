//
//  ZQTypeChooseView.m
//  中企资源
//
//  Created by 王落凡 on 15/6/3.
//  Copyright (c) 2015年 王落凡. All rights reserved.
//

#import "ZQTypeChooseView.h"

#define kItemHeight 40

@interface ZQTypeChooseView () {
    UILabel* titleLabel;
}

@end

@implementation ZQTypeChooseView

-(instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    
    if(self) {
        [self setBackgroundColor:[UIColor colorWithRed:((CGFloat)240)/255 green:((CGFloat)241)/255 blue:((CGFloat)242)/255 alpha:1.0f]];
        [self setShowsHorizontalScrollIndicator:NO];
        
        titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, self.bounds.size.width, kItemHeight)];
        [titleLabel setBackgroundColor:[UIColor colorWithRed:((CGFloat)35)/255 green:((CGFloat)131)/255 blue:((CGFloat)240)/255 alpha:1.0f]];
        [titleLabel setTextColor:[UIColor whiteColor]];
        [self addSubview:titleLabel];
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
        [button.titleLabel setFont:[UIFont systemFontOfSize:12.0f]];
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

-(void)setTitle:(NSString *)title {
    [titleLabel setText:[NSString stringWithFormat:@"    %@",title]];
    return ;
}

-(void)itemClicked:(UIButton*)sender {
    [UIView animateWithDuration:0.3f animations:^{
        [self setAlpha:0.0f];
    } completion:^(BOOL finished) {
        if([self.chooseViewDelegate respondsToSelector:@selector(chooseViewType:content:)])
            [self.chooseViewDelegate chooseViewType:self.chooseViewType content:sender.titleLabel.text];
    }];
    return ;
}

@end
