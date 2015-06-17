//
//  ZQServiceAgencySuccessExampleTableViewCell.m
//  中企资源
//
//  Created by 王落凡 on 15/6/16.
//  Copyright (c) 2015年 王落凡. All rights reserved.
//

#import "ZQServiceAgencySuccessExampleTableViewCell.h"

#define kControlMargin 5
#define kShadowRadius 0.5f
#define kTitleLabelHeight 15
#define kExampleTableViewCellHeight 100

@interface ZQServiceAgencySuccessExampleTableViewCell () {
    UIView* shadowView;
    UIView* contentView;
}

@end

@implementation ZQServiceAgencySuccessExampleTableViewCell

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    
    if(self) {
        [self setSelectionStyle:UITableViewCellSelectionStyleNone];
        [self setBackgroundColor:[UIColor clearColor]];
        
        shadowView = [[UIView alloc] initWithFrame:CGRectMake(kControlMargin, kControlMargin, self.contentView.bounds.size.width - 2*kControlMargin, kExampleTableViewCellHeight - 2*kControlMargin)];
        [shadowView setBackgroundColor:[UIColor colorWithRed:((CGFloat)221)/255 green:((CGFloat)221)/255 blue:((CGFloat)223)/255 alpha:1.0f]];
        [self.contentView addSubview:shadowView];
        
        contentView = [[UIView alloc] initWithFrame:CGRectMake(0, kShadowRadius, shadowView.bounds.size.width, shadowView.bounds.size.height - 2*kShadowRadius)];
        [contentView setBackgroundColor:[UIColor colorWithRed:((CGFloat)242)/255 green:((CGFloat)242)/255 blue:((CGFloat)244)/255 alpha:1.0f]];
        [shadowView addSubview:contentView];
        
        self.headerImageView = [[UIImageView alloc] initWithFrame:CGRectMake(3*kControlMargin, kControlMargin, contentView.bounds.size.width / 4, contentView.bounds.size.height - 5*kControlMargin)];
        [self.headerImageView setCenter:CGPointMake(self.headerImageView.center.x, contentView.bounds.size.height / 2)];
        [self.headerImageView setContentMode:UIViewContentModeScaleAspectFit];
        [contentView addSubview:self.headerImageView];
        
        self.titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(self.headerImageView.frame.origin.x + self.headerImageView.frame.size.width + 3*kControlMargin, 3*kControlMargin, contentView.bounds.size.width - self.headerImageView.frame.origin.x - self.headerImageView.frame.size.width - 4*kControlMargin, kTitleLabelHeight)];
        [self.titleLabel setFont:[UIFont systemFontOfSize:14.0f]];
        [contentView addSubview:self.titleLabel];
        
        self.detailLabel = [[UILabel alloc] initWithFrame:CGRectMake(self.titleLabel.frame.origin.x, self.titleLabel.frame.origin.y + self.titleLabel.frame.size.height , self.titleLabel.frame.size.width, 3*self.titleLabel.frame.size.height)];
        [self.detailLabel setTextColor:[UIColor lightGrayColor]];
        [self.detailLabel setNumberOfLines:0];
        [self.detailLabel setFont:[UIFont systemFontOfSize:12.0f]];
        [contentView addSubview:self.detailLabel];
    }
    
    return self;
}

-(void)addSubViewToContentView:(UIView *)subView {
    [contentView addSubview:subView];
    return ;
}

-(CGRect)contentViewBounds {
    return contentView.bounds;
}

-(void)setSuccessExampleTableViewCellHeight:(CGFloat)cellHeight {
    [shadowView setFrame:CGRectMake(shadowView.frame.origin.x, shadowView.frame.origin.y, shadowView.frame.size.width, cellHeight - 2*kControlMargin)];
    [contentView setFrame:CGRectMake(contentView.frame.origin.x, contentView.frame.origin.y, contentView.frame.size.width, shadowView.frame.size.height - 2*kShadowRadius)];
    
    return ;
}

@end
