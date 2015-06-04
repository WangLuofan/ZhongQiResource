//
//  ZQEnterpriseDetailInfoTableViewCell.m
//  中企资源
//
//  Created by 王落凡 on 15/6/3.
//  Copyright (c) 2015年 王落凡. All rights reserved.
//

#import "ZQEnterpriseDetailInfoTableViewCell.h"

#define kControlMargin 10
#define kButtonMargin 0
#define kShadowRadius 0.5f
#define kLogoImageViewSize 32
#define kLabelHeight 15
#define kTableViewCellHeight 100

@implementation ZQEnterpriseDetailInfoTableViewCell

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    
    if(self) {
        [self setSelectionStyle:UITableViewCellSelectionStyleNone];
        [self setBackgroundColor:[UIColor clearColor]];
        
        //灰色阴影
        UIView* grayShadowView = [[UIView alloc] initWithFrame:CGRectMake(0, kControlMargin - 2*kShadowRadius, self.frame.size.width, kTableViewCellHeight + 4*kShadowRadius)];
        [grayShadowView setBackgroundColor:[UIColor colorWithRed:((CGFloat)193)/255 green:((CGFloat)194)/255 blue:((CGFloat)195)/255 alpha:1.0f]];
        [self addSubview:grayShadowView];
        
        //白色阴影
        UIView* whiteShadowView = [[UIView alloc] initWithFrame:CGRectMake(0, grayShadowView.frame.origin.y + kShadowRadius, grayShadowView.frame.size.width, grayShadowView.frame.size.height - 2*kShadowRadius)];
        [whiteShadowView setBackgroundColor:[UIColor whiteColor]];
        [whiteShadowView setCenter:grayShadowView.center];
        [self addSubview:whiteShadowView];
        
        //内容视图
        UIView* contentView = [[UIView alloc] initWithFrame:CGRectMake(0, whiteShadowView.frame.origin.y + kShadowRadius, whiteShadowView.frame.size.width, whiteShadowView.frame.size.height - 2*kShadowRadius)];
        [contentView setBackgroundColor:[UIColor colorWithRed:((CGFloat)242)/255 green:((CGFloat)242)/255 blue:((CGFloat)244)/255 alpha:1.0f]];
        [self addSubview:contentView];
        
        //图标
        self.logoImageView = [[UIImageView alloc] initWithFrame:CGRectMake(2*kControlMargin, kControlMargin / 2, kLogoImageViewSize, kLogoImageViewSize)];
        [contentView addSubview:self.logoImageView];
        
        //创建人
        self.founderLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, self.logoImageView.frame.origin.y + self.logoImageView.frame.size.height + kControlMargin / 2 , self.logoImageView.frame.size.width * 2, kLabelHeight)];
        [self.founderLabel setFont:[UIFont systemFontOfSize:12.0f]];
        [self.founderLabel setTextAlignment:NSTextAlignmentCenter];
        [self.founderLabel setCenter:CGPointMake(self.logoImageView.center.x, self.founderLabel.center.y)];
        [contentView addSubview:self.founderLabel];
        
        //帖子
        self.postLabel = [[UILabel alloc] initWithFrame:CGRectMake(self.founderLabel.frame.origin.x, self.founderLabel.frame.origin.y + self.founderLabel.frame.size.height + kControlMargin / 2, self.founderLabel.frame.size.width, self.founderLabel.frame.size.height)];
        [self.postLabel setFont:[UIFont systemFontOfSize:12.0f]];
        [contentView addSubview:self.postLabel];
        
        //回复
        self.receiveLabel = [[UILabel alloc] initWithFrame:CGRectMake(self.founderLabel.frame.origin.x, self.postLabel.frame.origin.y + self.founderLabel.frame.size.height + kControlMargin / 2, self.founderLabel.frame.size.width, self.founderLabel.frame.size.height)];
        [self.receiveLabel setFont:[UIFont systemFontOfSize:12.0f]];
        [contentView addSubview:self.receiveLabel];
        
        //商圈名
        self.districtLabel = [[UILabel alloc] initWithFrame:CGRectMake(self.logoImageView.frame.origin.x + self.logoImageView.frame.size.width + 3*kControlMargin, kControlMargin / 2, contentView.bounds.size.width - self.logoImageView.frame.origin.x - self.logoImageView.frame.size.width - 4*kControlMargin , kLabelHeight)];
        [self.districtLabel setFont:[UIFont systemFontOfSize:14.0f]];
        [contentView addSubview:self.districtLabel];
        
        //详细信息
        self.detailLabel = [[UILabel alloc] initWithFrame:CGRectMake(self.districtLabel.frame.origin.x, self.districtLabel.frame.origin.y + self.districtLabel.frame.size.height , self.districtLabel.frame.size.width, 4*self.districtLabel.frame.size.height)];
        [self.detailLabel setNumberOfLines:0];
        [self.detailLabel setTextColor:[UIColor grayColor]];
        [self.detailLabel setFont:[UIFont systemFontOfSize:10.0f]];
        [contentView addSubview:self.detailLabel];
        
        //关注商圈
        UIButton* attentionButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [attentionButton setImage:[UIImage imageNamed:@"gzsq"] forState:UIControlStateNormal];
        [attentionButton.imageView setContentMode:UIViewContentModeScaleAspectFit];
        [attentionButton setFrame:CGRectMake(self.detailLabel.frame.origin.x, self.detailLabel.frame.origin.y + self.detailLabel.frame.size.height, (contentView.bounds.size.width - self.detailLabel.frame.origin.x) / 4, kLabelHeight)];
        [attentionButton setTitleEdgeInsets:UIEdgeInsetsMake(0, -attentionButton.imageView.frame.origin.x / 2, 0, 0)];
        [attentionButton setImageEdgeInsets:UIEdgeInsetsMake(0, -attentionButton.imageView.frame.origin.x / 2, 0, 0)];
        [attentionButton setTitle:@"关注商圈" forState:UIControlStateNormal];
        [attentionButton setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
        [attentionButton setTitleColor:[UIColor blackColor] forState:UIControlStateHighlighted];
        [attentionButton.titleLabel setFont:[UIFont systemFontOfSize:8.0f]];
        [contentView addSubview:attentionButton];
        
        //我要发帖
        UIButton* postButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [postButton setImage:[UIImage imageNamed:@"wyft"] forState:UIControlStateNormal];
        [postButton.imageView setContentMode:UIViewContentModeScaleAspectFit];
        [postButton setFrame:CGRectMake(attentionButton.frame.origin.x + attentionButton.frame.size.width + kButtonMargin, attentionButton.frame.origin.y, attentionButton.frame.size.width, attentionButton.frame.size.height)];
        [postButton setTitleEdgeInsets:UIEdgeInsetsMake(0, -postButton.imageView.frame.origin.x / 2, 0, 0)];
        [postButton setImageEdgeInsets:UIEdgeInsetsMake(0, -postButton.imageView.frame.origin.x / 2, 0, 0)];
        [postButton setTitle:@"我要发帖" forState:UIControlStateNormal];
        [postButton setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
        [postButton setTitleColor:[UIColor blackColor] forState:UIControlStateHighlighted];
        [postButton.titleLabel setFont:[UIFont systemFontOfSize:8.0f]];
        [contentView addSubview:postButton];
        
        //分享商圈
        UIButton* shareButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [shareButton setImage:[UIImage imageNamed:@"fxsq"] forState:UIControlStateNormal];
        [shareButton.imageView setContentMode:UIViewContentModeScaleAspectFit];
        [shareButton setFrame:CGRectMake(postButton.frame.origin.x + postButton.frame.size.width + kButtonMargin, attentionButton.frame.origin.y, attentionButton.frame.size.width, attentionButton.frame.size.height)];
        [shareButton setTitleEdgeInsets:UIEdgeInsetsMake(0, -shareButton.imageView.frame.origin.x / 2, 0, 0)];
        [shareButton setImageEdgeInsets:UIEdgeInsetsMake(0, -shareButton.imageView.frame.origin.x / 2, 0, 0)];
        [shareButton setTitle:@"分享商圈" forState:UIControlStateNormal];
        [shareButton setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
        [shareButton setTitleColor:[UIColor blackColor] forState:UIControlStateHighlighted];
        [shareButton.titleLabel setFont:[UIFont systemFontOfSize:8.0f]];
        [contentView addSubview:shareButton];
        
        //商圈企业名单
        UIButton* nameButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [nameButton setImage:[UIImage imageNamed:@"sjqymd"] forState:UIControlStateNormal];
        [nameButton.imageView setContentMode:UIViewContentModeScaleAspectFit];
        [nameButton setFrame:CGRectMake(shareButton.frame.origin.x + shareButton.frame.size.width + kButtonMargin, attentionButton.frame.origin.y, attentionButton.frame.size.width, attentionButton.frame.size.height)];
        [nameButton setTitleEdgeInsets:UIEdgeInsetsMake(0, -nameButton.imageView.frame.origin.x / 2, 0, 0)];
        [nameButton setImageEdgeInsets:UIEdgeInsetsMake(0, -nameButton.imageView.frame.origin.x / 2, 0, 0)];
        [nameButton setTitle:@"商圈企业名单" forState:UIControlStateNormal];
        [nameButton setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
        [nameButton setTitleColor:[UIColor blackColor] forState:UIControlStateHighlighted];
        [nameButton.titleLabel setFont:[UIFont systemFontOfSize:8.0f]];
        [contentView addSubview:nameButton];
    }
    
    return self;
}

@end
