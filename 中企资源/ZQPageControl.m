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
    CGSize pageControlFitSize;
}

@end

@implementation ZQPageControl

-(instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    
    if(self) {
        [self setBackgroundColor:[UIColor clearColor]];
        activeImage = [UIImage imageNamed:@"ctrl"];
        inActiveImage = [UIImage imageNamed:@"ctrl1"];
        pageControlFitSize = CGSizeZero;
    }
    
    return self;
}

-(void)drawRect:(CGRect)rect {
    // Drawing code
    NSUInteger count = [self.subviews count];
    NSUInteger totalLength = count * kPageControlSize + (count - 1) * kPageControlGapWidth ;
    for (int i = 0; i < count; i++) {
        
        UIImageView* dot = [self.subviews objectAtIndex:i];
        [dot setFrame:CGRectMake(i*totalLength / count, 0, kPageControlSize, kPageControlSize)];
        
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
    [self setFrame:CGRectMake(self.frame.origin.x, self.frame.origin.y, self.subviews.count * kPageControlSize + (self.subviews.count - 1) * kPageControlGapWidth, kPageControlSize)];
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
