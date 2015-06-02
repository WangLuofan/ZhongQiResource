//
//  ZQStarRatingView.h
//  ZQStarRatingView
//
//  Created by 王落凡 on 15/6/2.
//  Copyright (c) 2015年 王落凡. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ZQStarRatingView : UIView

-(instancetype)initWithFrame:(CGRect)frame numberOfStars:(NSInteger)numberOfStars;
-(void)setRating:(CGFloat)rating;

@end
