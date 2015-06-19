//
//  ZQEnterpriseDetailInfoTableViewCell.m
//  中企资源
//
//  Created by 王落凡 on 15/6/3.
//  Copyright (c) 2015年 王落凡. All rights reserved.
//

#import "ZQBaseSocialShare.h"
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
        self.attentionButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [self.attentionButton setTag:0];
        [self.attentionButton setImage:[UIImage imageNamed:@"gzsq"] forState:UIControlStateNormal];
        [self.attentionButton.imageView setContentMode:UIViewContentModeScaleAspectFit];
        [self.attentionButton setFrame:CGRectMake(self.detailLabel.frame.origin.x, self.detailLabel.frame.origin.y + self.detailLabel.frame.size.height, (contentView.bounds.size.width - self.detailLabel.frame.origin.x) / 4, kLabelHeight)];
        [self.attentionButton setTitleEdgeInsets:UIEdgeInsetsMake(0, -self.attentionButton.imageView.frame.origin.x / 2, 0, 0)];
        [self.attentionButton setImageEdgeInsets:UIEdgeInsetsMake(0, -self.attentionButton.imageView.frame.origin.x / 2, 0, 0)];
        [self.attentionButton setTitle:@"关注商圈" forState:UIControlStateNormal];
        [self.attentionButton setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
        [self.attentionButton setTitleColor:[UIColor blackColor] forState:UIControlStateHighlighted];
        [self.attentionButton.titleLabel setFont:[UIFont systemFontOfSize:8.0f]];
        [contentView addSubview:self.attentionButton];
        
        //我要发帖
        self.postButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [self.postButton setTag:1];
        [self.postButton setImage:[UIImage imageNamed:@"wyft"] forState:UIControlStateNormal];
        [self.postButton.imageView setContentMode:UIViewContentModeScaleAspectFit];
        [self.postButton setFrame:CGRectMake(self.attentionButton.frame.origin.x + self.attentionButton.frame.size.width + kButtonMargin, self.attentionButton.frame.origin.y, self.attentionButton.frame.size.width, self.attentionButton.frame.size.height)];
        [self.postButton setTitleEdgeInsets:UIEdgeInsetsMake(0, -self.postButton.imageView.frame.origin.x / 2, 0, 0)];
        [self.postButton setImageEdgeInsets:UIEdgeInsetsMake(0, -self.postButton.imageView.frame.origin.x / 2, 0, 0)];
        [self.postButton setTitle:@"我要发帖" forState:UIControlStateNormal];
        [self.postButton setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
        [self.postButton setTitleColor:[UIColor blackColor] forState:UIControlStateHighlighted];
        [self.postButton.titleLabel setFont:[UIFont systemFontOfSize:8.0f]];
        [contentView addSubview:self.postButton];
        
        //分享商圈
        self.shareButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [self.shareButton setTag:2];
        [self.shareButton setImage:[UIImage imageNamed:@"fxsq"] forState:UIControlStateNormal];
        [self.shareButton.imageView setContentMode:UIViewContentModeScaleAspectFit];
        [self.shareButton setFrame:CGRectMake(self.postButton.frame.origin.x + self.postButton.frame.size.width + kButtonMargin, self.attentionButton.frame.origin.y, self.attentionButton.frame.size.width, self.attentionButton.frame.size.height)];
        [self.shareButton setTitleEdgeInsets:UIEdgeInsetsMake(0, -self.shareButton.imageView.frame.origin.x / 2, 0, 0)];
        [self.shareButton setImageEdgeInsets:UIEdgeInsetsMake(0, -self.shareButton.imageView.frame.origin.x / 2, 0, 0)];
        [self.shareButton setTitle:@"分享商圈" forState:UIControlStateNormal];
        [self.shareButton setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
        [self.shareButton setTitleColor:[UIColor blackColor] forState:UIControlStateHighlighted];
        [self.shareButton.titleLabel setFont:[UIFont systemFontOfSize:8.0f]];
        [self.shareButton addTarget:self action:@selector(shareButtonPressed:) forControlEvents:UIControlEventTouchUpInside];
        [contentView addSubview:self.shareButton];
        
        //商圈企业名单
        self.nameButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [self.nameButton setTag:3];
        [self.nameButton setImage:[UIImage imageNamed:@"sjqymd"] forState:UIControlStateNormal];
        [self.nameButton.imageView setContentMode:UIViewContentModeScaleAspectFit];
        [self.nameButton setFrame:CGRectMake(self.shareButton.frame.origin.x + self.shareButton.frame.size.width + kButtonMargin, self.attentionButton.frame.origin.y, self.attentionButton.frame.size.width, self.attentionButton.frame.size.height)];
        [self.nameButton setTitleEdgeInsets:UIEdgeInsetsMake(0, -self.nameButton.imageView.frame.origin.x / 2, 0, 0)];
        [self.nameButton setImageEdgeInsets:UIEdgeInsetsMake(0, -self.nameButton.imageView.frame.origin.x / 2, 0, 0)];
        [self.nameButton setTitle:@"商圈企业名单" forState:UIControlStateNormal];
        [self.nameButton setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
        [self.nameButton setTitleColor:[UIColor blackColor] forState:UIControlStateHighlighted];
        [self.nameButton.titleLabel setFont:[UIFont systemFontOfSize:8.0f]];
        [contentView addSubview:self.nameButton];
    }
    
    return self;
}

-(void)shareButtonPressed:(UIButton*)sender {
    [ZQBaseSocialShare consturctPublishContentWithContent:nil image:nil title:nil url:nil description:nil];
    return ;
}

@end
