//
//  ZQResourceInfomationTableViewCell.m
//  中企资源
//
//  Created by 王落凡 on 15/6/15.
//  Copyright (c) 2015年 王落凡. All rights reserved.
//

#import "ZQResourceInfomationTableViewCell.h"

#define kShadowRadius 0.5
#define kControlMargin 5
#define kLabelHeight 20
#define kTableViewCellHeight 200

@implementation ZQResourceInfomationTableViewCell

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    
    if(self) {
        [self setBackgroundColor:[UIColor clearColor]];
        
        UIView* grayView = [[UIView alloc] initWithFrame:CGRectMake(0, kControlMargin, self.contentView.bounds.size.width, kTableViewCellHeight - kControlMargin)];
        [grayView setBackgroundColor:[UIColor colorWithRed:((CGFloat)219)/255 green:((CGFloat)216)/255 blue:((CGFloat)219)/255 alpha:1.0f]];
        [self.contentView addSubview:grayView];
        
        UIView* whiteView = [[UIView alloc] initWithFrame:CGRectMake(0, kShadowRadius, grayView.bounds.size.width, grayView.bounds.size.height - 2*kShadowRadius)];
        [whiteView setBackgroundColor:[UIColor whiteColor]];
        [grayView addSubview:whiteView];
        
        self.logoImageView = [[UIImageView alloc] initWithFrame:CGRectMake(4*kControlMargin, kControlMargin, 10*kControlMargin, 10*kControlMargin)];
        [self.logoImageView setContentMode:UIViewContentModeScaleAspectFit];
        [whiteView addSubview:self.logoImageView];
        
        self.enterpriseLabel = [[UILabel alloc] initWithFrame:CGRectMake(self.logoImageView.frame.origin.x + self.logoImageView.frame.size.width + kControlMargin, self.logoImageView.frame.origin.y + kControlMargin, whiteView.bounds.size.width - self.logoImageView.frame.origin.x - self.logoImageView.frame.size.width - 2*kControlMargin, kLabelHeight)];
        [self.enterpriseLabel setTextColor:[UIColor colorWithRed:((CGFloat)21)/255 green:((CGFloat)58)/255 blue:((CGFloat)99)/255 alpha:1.0f]];
        [self.enterpriseLabel setFont:[UIFont systemFontOfSize:12.0f]];
        [whiteView addSubview:self.enterpriseLabel];
        
        self.dateTimeLabel = [[UILabel alloc] initWithFrame:CGRectMake(self.enterpriseLabel.frame.origin.x, self.enterpriseLabel.frame.origin.y + self.enterpriseLabel.frame.size.height, self.enterpriseLabel.frame.size.width, self.enterpriseLabel.frame.size.height)];
        [self.dateTimeLabel setTextColor:[UIColor lightGrayColor]];
        [self.dateTimeLabel setFont:[UIFont systemFontOfSize:12.0f]];
        [whiteView addSubview:self.dateTimeLabel];
    }
    
    return self;
}

@end
