//
//  ZQStarRatingView.m
//  ZQStarRatingView
//
//  Created by 王落凡 on 15/6/2.
//  Copyright (c) 2015年 王落凡. All rights reserved.
//

#import "ZQStarRatingView.h"

#define kControlMargin 5

@interface ZQStarRatingView () {
    UIView* backgroundView;
    UIView* foregroundView;
    NSInteger numberOfStars;
}

@end

@implementation ZQStarRatingView

-(instancetype)initWithFrame:(CGRect)frame numberOfStars:(NSInteger)Stars {
    self = [super initWithFrame:frame];
    
    if(self) {
        numberOfStars = Stars;
        backgroundView = [self buildStarRatingView:NO];
        foregroundView = [self buildStarRatingView:YES];
        
        [self addSubview:backgroundView];
        [self addSubview:foregroundView];
    }
    
    return self;
}

-(void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event {
    UITouch* touch = [touches anyObject];
    CGPoint point = [touch locationInView:self];
    
    if(point.x <0)
        point.x = 0;
    if(point.x > self.bounds.size.width)
        point.x = self.bounds.size.width;
    
    [foregroundView setFrame:CGRectMake(0, 0, point.x, foregroundView.bounds.size.height)];
    return ;
}

-(void)sizeToFit {
    [self setFrame:CGRectMake(self.frame.origin.x, self.frame.origin.y, backgroundView.frame.size.width, backgroundView.frame.size.height)];
    return ;
}

-(UIView*)buildStarRatingView:(BOOL)bTopStar{
    UIView* view = [[UIView alloc] init];
    [view setClipsToBounds:YES];
    
    //宽self.frame.size.width - numberOfStars*kControlMargin
    UIImage* image = [UIImage imageNamed:(bTopStar?@"star_h":@"star")];
    for (int i = 0; i != numberOfStars; ++i) {
        UIImageView* imageView = [[UIImageView alloc] initWithImage:image];
//        [imageView setFrame:CGRectMake(i*image.size.width / 2 + kControlMargin, 0, image.size.width / 2, image.size.height / 2)];
        [imageView setFrame:CGRectMake(i*self.frame.size.width / numberOfStars, 0, (self.frame.size.width - numberOfStars*kControlMargin) / kControlMargin, self.frame.size.height)];
        [imageView setContentMode:UIViewContentModeScaleAspectFit];
        [view addSubview:imageView];
    }
//    [view setFrame:CGRectMake(0, 0, numberOfStars*image.size.width / 2 + 2*kControlMargin, image.size.height / 2)];
    [view setFrame:self.bounds];
    return view;
}

-(void)setRating:(CGFloat)rating {
    CGFloat xPosition = (backgroundView.bounds.size.width ) * rating / numberOfStars;
    [foregroundView setFrame:CGRectMake(0, 0, xPosition, foregroundView.bounds.size.height)];
    return ;
}

@end
