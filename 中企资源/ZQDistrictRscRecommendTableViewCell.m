//
//  ZQDistrictRscRecommendTableViewCell.m
//  中企资源
//
//  Created by 王落凡 on 15/6/13.
//  Copyright (c) 2015年 王落凡. All rights reserved.
//

#import "ZQDistrictRscRecommendTableViewCell.h"

#define kTableViewCellHeight 50
#define kControlMargin 5
#define kShadowRadius 0.5f

@implementation ZQDistrictRscRecommendTableViewCell

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    
    if(self){
        [self setSelectionStyle:UITableViewCellSelectionStyleNone];
        [self setBackgroundColor:[UIColor clearColor]];
        
        //灰色阴影
        UIView* grayShadowView = [[UIView alloc] initWithFrame:CGRectMake(0, kControlMargin, self.frame.size.width, kTableViewCellHeight - kControlMargin)];
        [grayShadowView setBackgroundColor:[UIColor colorWithRed:((CGFloat)193)/255 green:((CGFloat)194)/255 blue:((CGFloat)195)/255 alpha:1.0f]];
        [self.contentView addSubview:grayShadowView];
        
        //白色阴影
        UIView* whiteShadowView = [[UIView alloc] initWithFrame:CGRectMake(0, kShadowRadius, grayShadowView.frame.size.width, grayShadowView.frame.size.height - 2*kShadowRadius)];
        [whiteShadowView setBackgroundColor:[UIColor whiteColor]];
        [grayShadowView addSubview:whiteShadowView];
        
        //内容视图
        UIView* contentView = [[UIView alloc] initWithFrame:CGRectMake(0, kShadowRadius, whiteShadowView.frame.size.width, whiteShadowView.frame.size.height - 2*kShadowRadius)];
        [contentView setBackgroundColor:[UIColor colorWithRed:((CGFloat)242)/255 green:((CGFloat)242)/255 blue:((CGFloat)244)/255 alpha:1.0f]];
        [whiteShadowView addSubview:contentView];
        
        self.titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(kControlMargin, kControlMargin, (self.bounds.size.width - 3*kControlMargin) * 3 / 4, (self.bounds.size.height - 3*kControlMargin) / 2)];
        [self.titleLabel setTextColor:[UIColor blackColor]];
        [self.titleLabel setFont:[UIFont systemFontOfSize:12.0f]];
        [contentView addSubview:self.titleLabel];
        
        self.dateLabel = [[UILabel alloc] initWithFrame:CGRectMake(self.titleLabel.frame.origin.x + self.titleLabel.frame.size.width + kControlMargin, self.titleLabel.frame.origin.y, self.titleLabel.frame.size.width / 3, self.titleLabel.frame.size.height)];
        [self.dateLabel setTextColor:[UIColor blackColor]];
        [self.dateLabel setFont:[UIFont systemFontOfSize:12.0f]];
        [contentView addSubview:self.dateLabel];
        
        self.detailLabel = [[UILabel alloc] initWithFrame:CGRectMake(self.titleLabel.frame.origin.x, self.titleLabel.frame.origin.y + self.titleLabel.frame.size.height + kControlMargin, self.bounds.size.width - 2*kControlMargin, self.titleLabel.frame.size.height)];
        [self.detailLabel setTextColor:[UIColor lightGrayColor]];
        [self.detailLabel setFont:[UIFont systemFontOfSize:12.0f]];
        [contentView addSubview:self.detailLabel];
    }
    
    return self;
}

-(void)setTitle:(NSString *)title Detail:(NSString *)detail Date:(NSString *)date {
    [self.titleLabel setText:title];
    [self.detailLabel setText:detail];
    [self.dateLabel setText:date];
    
    return ;
}

-(void)setTitle:(NSString *)title Detail:(NSString *)detail {
    [self.titleLabel setText:title];
    [self.detailLabel setText:detail];
    
    NSDateFormatter* formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"yyyy-MM-dd"];
    [self.dateLabel setText:[formatter stringFromDate:[NSDate date]]];
    
    return ;
}

@end
