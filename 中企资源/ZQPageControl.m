//
//  ZQPageControl.m
//  中企资源
//
//  Created by 王落凡 on 15/5/27.
//  Copyright (c) 2015年 王落凡. All rights reserved.
//

#import "ZQPageControl.h"

#define kPageControlSize 10
#define kPageControlGapWidth 3

@interface ZQPageControl () {
    UIImage* activeImage;
    UIImage* inActiveImage;
}

@end

@implementation ZQPageControl

-(instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    
    if(self) {
        activeImage = [UIImage imageNamed:@"ctrl"];
        inActiveImage = [UIImage imageNamed:@"ctrl1"];
        [self setBackgroundColor:[UIColor clearColor]];
    }
    
    return self;
}

-(void)drawRect:(CGRect)rect {
    // Drawing code
    NSUInteger count = [self.subviews count];
    NSUInteger totalLenth = count * kPageControlSize + (count - 1) * kPageControlGapWidth ;
    for (int i = 0; i < count; i++) {
        
        UIImageView* dot = [self.subviews objectAtIndex:i];
        [dot setFrame:CGRectMake(i*(kPageControlSize+kPageControlGapWidth) + (self.center.x - totalLenth / 2), 0, kPageControlSize, kPageControlSize)];
        
        if (i == 0) {
            [dot setImage:activeImage];
        }else {
            [dot setImage:inActiveImage];
        }
    }
    
    return ;
}

-(void)setNumberOfPages:(NSInteger)numberOfPages {
    for (int i = 0; i != numberOfPages; ++i) {
        UIImageView* imageView = [[UIImageView alloc] initWithImage:inActiveImage];
        [self addSubview:imageView];
    }
    return ;
}

- (void)setCurrentPage:(NSInteger)currentPage{
    self.theCurrentPage = currentPage;
    [self updateDots];
}

- (void)updateDots{
    for (int i = 0; i < [self.subviews count]; i++)
    {
        UIImageView* dot = [self.subviews objectAtIndex:i];
        if (i == self.theCurrentPage)
            dot.image = activeImage;
        else
            dot.image = inActiveImage;
    }
    
    return ;
}

@end
