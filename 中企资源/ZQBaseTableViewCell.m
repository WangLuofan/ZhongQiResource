//
//  ZQBaseTableViewCell.m
//  中企资源
//
//  Created by 王落凡 on 15/6/3.
//  Copyright (c) 2015年 王落凡. All rights reserved.
//

#import "ZQBaseTableViewCell.h"

#define kControlMargin 5
#define kLogoImageWidth 75
#define kLogoImageHeight 45
#define kContentViewHeight 90
#define kShadowRadius 0.5f

@interface ZQBaseTableViewCell () {
   UIView* contentView; 
}

@end

@implementation ZQBaseTableViewCell

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    
    if(self) {
        [self setBackgroundColor:[UIColor clearColor]];
        [self setSelectionStyle:UITableViewCellSelectionStyleNone];
        
        UIView* shadowView = [[UIView alloc] initWithFrame:CGRectMake(kControlMargin, kControlMargin, self.bounds.size.width - 2*kControlMargin, kContentViewHeight)];
        [shadowView setBackgroundColor:[UIColor whiteColor]];
        [self addSubview:shadowView];
        
        contentView = [[UIView alloc] initWithFrame:CGRectMake(kShadowRadius, kShadowRadius, shadowView.bounds.size.width - 2*kShadowRadius, shadowView.bounds.size.height - 2*kShadowRadius)];
        [contentView setBackgroundColor:[UIColor colorWithRed:((CGFloat)242)/255 green:((CGFloat)242)/255 blue:((CGFloat)244)/255 alpha:1.0f]];
        [shadowView addSubview:contentView];
        
        self.logoImageView = [[UIImageView alloc] initWithFrame:CGRectMake(kControlMargin, kControlMargin, kLogoImageWidth, kLogoImageHeight)];
        [self.logoImageView setContentMode:UIViewContentModeScaleAspectFit];
        [contentView addSubview:self.logoImageView];
        
        self.methodLabel = [[UILabel alloc] initWithFrame:CGRectMake(self.logoImageView.frame.origin.x + self.logoImageView.frame.size.width + kControlMargin, self.logoImageView.frame.origin.y, contentView.bounds.size.width - self.logoImageView.frame.origin.x - self.logoImageView.frame.size.width - kControlMargin, 15)];
        [self.methodLabel setFont:[UIFont systemFontOfSize:12.0f]];
        [contentView addSubview:self.methodLabel];
        
        self.detailLabel= [[UILabel alloc] initWithFrame:CGRectMake(self.methodLabel.frame.origin.x, self.methodLabel.frame.origin.y + self.methodLabel.frame.size.height, self.methodLabel.frame.size.width, 2*self.methodLabel.frame.size.height)];
        [self.detailLabel setTextColor:[UIColor lightGrayColor]];
        [self.detailLabel setFont:[UIFont systemFontOfSize:10.0f]];
        [self.detailLabel setNumberOfLines:0];
        [contentView addSubview:self.detailLabel];
        
        if(style != ZQTableViewCellStyleNOButton) {
            self.contractButton = [UIButton buttonWithType:UIButtonTypeCustom];
            [self.contractButton.imageView setContentMode:UIViewContentModeScaleAspectFit];
            [contentView addSubview:self.contractButton];
        }else {
            [self.detailLabel setFrame:CGRectMake(self.detailLabel.frame.origin.x, self.detailLabel.frame.origin.y, self.detailLabel.frame.size.width, contentView.bounds.size.height - self.methodLabel.frame.origin.y - self.methodLabel.frame.size.height - kControlMargin)];
        }
    }
    
    return self;
}

-(void)setContractButtonImage:(UIImage*)image {
    [self.contractButton setImage:image forState:UIControlStateNormal];
    [self.contractButton setFrame:CGRectMake(self.methodLabel.frame.origin.x, self.detailLabel.frame.origin.y + self.detailLabel.frame.size.height + kControlMargin, self.contractButton.imageView.image.size.width / 2, self.contractButton.imageView.image.size.height / 2)];
    return ;
}

@end
