//
//  ZQCheckBox.m
//  中企资源
//
//  Created by 王落凡 on 15/5/29.
//  Copyright (c) 2015年 王落凡. All rights reserved.
//

#import "ZQCheckBox.h"

@implementation ZQCheckBox

///shouldFixFrame 是否需要自动修正按钮大小
-(instancetype)initWithFrame:(CGRect)frame shouldFixFrame:(BOOL)shouldFixFrame {
    self = [super initWithFrame:frame];
    
    if(self) {
        [self setImage:[UIImage imageNamed:@"fuxuank"] forState:UIControlStateNormal];
        [self setImage:[UIImage imageNamed:@"fxk_gou"] forState:UIControlStateSelected];
        [self addTarget:self action:@selector(checkBoxPressed:) forControlEvents:UIControlEventTouchDown];
        [self.imageView setContentMode:UIViewContentModeScaleAspectFit];
        if(shouldFixFrame)
           [self setFrame:CGRectMake(self.frame.origin.x, self.frame.origin.y, self.imageView.image.size.width, self.imageView.image.size.height)];
    }
    
    return self;
}

-(void)checkBoxPressed:(ZQCheckBox*)sender {
    [sender setSelected:![sender isSelected]];
    
    if([self.delegate respondsToSelector:@selector(checkBox:isSelected:)])
       [self.delegate checkBox:self isSelected:sender.isSelected];
    
    return ;
}

//取消高亮状态
-(void)setHighlighted:(BOOL)highlighted {
    return ;
}

@end
