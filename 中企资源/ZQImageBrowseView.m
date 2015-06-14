//
//  ZQImageBrowseView.m
//  中企资源
//
//  Created by 王落凡 on 15/6/12.
//  Copyright (c) 2015年 王落凡. All rights reserved.
//

#import "ZQImageBrowseView.h"

#define kSelectCheckMarkSize 15
@interface ZQImageBrowseView () {
    UIView* coverView;
}

@end

@implementation ZQImageBrowseView

-(instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    
    if(self) {
        [self setUserInteractionEnabled:YES];
        
        coverView = [[UIView alloc] initWithFrame:self.bounds];
        [coverView setUserInteractionEnabled:YES];
        
        UIView* shadowView = [[UIView alloc] initWithFrame:coverView.bounds];
        [shadowView setBackgroundColor:[UIColor whiteColor]];
        [shadowView setAlpha:0.5f];
        [coverView addSubview:shadowView];
        
        UIImageView* imageView = [[UIImageView alloc] initWithFrame:CGRectMake(coverView.bounds.size.width - kSelectCheckMarkSize, coverView.bounds.size.height - kSelectCheckMarkSize, kSelectCheckMarkSize, kSelectCheckMarkSize)];
        [imageView setImage:[UIImage imageNamed:@"select"]];
        [coverView addSubview:imageView];
    }
    
    return self;
}

-(void)setSelected:(BOOL)selected {
    if(selected)
        [self addSubview:coverView];
    else
       [coverView removeFromSuperview];
    
    self.imageViewSelected = selected;
    return ;
}

@end
