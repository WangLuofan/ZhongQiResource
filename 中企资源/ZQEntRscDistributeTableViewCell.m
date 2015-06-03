//
//  ZQEntRscDistributeTableViewCell.m
//  中企资源
//
//  Created by 王落凡 on 15/6/2.
//  Copyright (c) 2015年 王落凡. All rights reserved.
//

#import "ZQEntRscDistributeTableViewCell.h"

#define kControlMargin 5
#define kShadowRadius 0.5f
#define kEntRscDistributeTableViewCellHeight 150

@interface ZQEntRscDistributeTableViewCell () {
    UILabel* offerRscLabel;
    UIView* contentView;
}

@end

@implementation ZQEntRscDistributeTableViewCell

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    
    if(self) {
        [self setBackgroundColor:[UIColor clearColor]];
        [self setSelectionStyle:UITableViewCellSelectionStyleNone];
        
        UIView* shadowView = [[UIView alloc] initWithFrame:CGRectMake(0, kControlMargin, self.bounds.size.width, kEntRscDistributeTableViewCellHeight - 2*kControlMargin)];
        [shadowView setBackgroundColor:[UIColor whiteColor]];
        [self addSubview:shadowView];
        
        contentView = [[UIView alloc] initWithFrame:CGRectMake(0, shadowView.frame.origin.y + kShadowRadius, shadowView.bounds.size.width, shadowView.bounds.size.height - 2*kShadowRadius)];
        [contentView setBackgroundColor:[UIColor colorWithRed:((CGFloat)242)/255 green:((CGFloat)242)/255 blue:((CGFloat)244)/255 alpha:1.0f]];
        [self addSubview:contentView];
        
        offerRscLabel = [[UILabel alloc] initWithFrame:CGRectMake(kControlMargin, kControlMargin, self.bounds.size.width - 2*kControlMargin, 20)];
        [offerRscLabel setFont:[UIFont systemFontOfSize:12.0f]];
        [contentView addSubview:offerRscLabel];
        
        self.detailLabel = [[UILabel alloc] initWithFrame:CGRectMake(kControlMargin, offerRscLabel.frame.origin.y + offerRscLabel.frame.size.height, offerRscLabel.frame.size.width, 4.5*offerRscLabel.frame.size.height - kControlMargin)];
        [self.detailLabel setFont:[UIFont systemFontOfSize:12.0f]];
        [self.detailLabel setNumberOfLines:0];
        [self.detailLabel setTextColor:[UIColor lightGrayColor]];
        [contentView addSubview:self.detailLabel];
        
        //关注按钮
        UIButton* attentionButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [attentionButton setTitle:@"关注" forState:UIControlStateNormal];
        [attentionButton setTitleColor:[UIColor lightGrayColor] forState:UIControlStateNormal];
        [attentionButton setTitleColor:[UIColor blackColor] forState:UIControlStateHighlighted];
        [attentionButton setImage:[UIImage imageNamed:@"gz"] forState:UIControlStateNormal];
        [attentionButton.imageView setContentMode:UIViewContentModeScaleAspectFit];
        [attentionButton.titleLabel setFont:[UIFont systemFontOfSize:12.0f]];
        [attentionButton setFrame:CGRectMake(0, self.detailLabel.frame.origin.y + self.detailLabel.frame.size.height + kControlMargin, contentView.frame.size.width / 4, 20)];
        [contentView addSubview:attentionButton];
        
        //回复按钮
        UIButton* replyButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [replyButton setTitle:@"回复" forState:UIControlStateNormal];
        [replyButton setTitleColor:[UIColor lightGrayColor] forState:UIControlStateNormal];
        [replyButton setTitleColor:[UIColor blackColor] forState:UIControlStateHighlighted];
        [replyButton setImage:[UIImage imageNamed:@"hf"] forState:UIControlStateNormal];
        [replyButton.imageView setContentMode:UIViewContentModeScaleAspectFit];
        [replyButton.titleLabel setFont:[UIFont systemFontOfSize:12.0f]];
        [replyButton setFrame:CGRectMake(attentionButton.frame.origin.x + attentionButton.frame.size.width, attentionButton.frame.origin.y, attentionButton.frame.size.width,attentionButton.frame.size.height)];
        [contentView addSubview:replyButton];
        
        //一键呼叫
        UIButton* callButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [callButton setTitle:@"一键呼叫" forState:UIControlStateNormal];
        [callButton setTitleColor:[UIColor lightGrayColor] forState:UIControlStateNormal];
        [callButton setTitleColor:[UIColor blackColor] forState:UIControlStateHighlighted];
        [callButton setImage:[UIImage imageNamed:@"stelphone"] forState:UIControlStateNormal];
        [callButton.imageView setContentMode:UIViewContentModeScaleAspectFit];
        [callButton.titleLabel setFont:[UIFont systemFontOfSize:12.0f]];
        [callButton setFrame:CGRectMake(replyButton.frame.origin.x + replyButton.frame.size.width, attentionButton.frame.origin.y, attentionButton.frame.size.width,attentionButton.frame.size.height)];
        [contentView addSubview:callButton];
        
        //分享
        UIButton* shareButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [shareButton setTitle:@"分享" forState:UIControlStateNormal];
        [shareButton setTitleColor:[UIColor lightGrayColor] forState:UIControlStateNormal];
        [shareButton setTitleColor:[UIColor blackColor] forState:UIControlStateHighlighted];
        [shareButton setImage:[UIImage imageNamed:@"fx"] forState:UIControlStateNormal];
        [shareButton.imageView setContentMode:UIViewContentModeScaleAspectFit];
        [shareButton.titleLabel setFont:[UIFont systemFontOfSize:12.0f]];
        [shareButton setFrame:CGRectMake(callButton.frame.origin.x + callButton.frame.size.width, attentionButton.frame.origin.y, attentionButton.frame.size.width,attentionButton.frame.size.height)];
        [contentView addSubview:shareButton];
    }
    
    return self;
}

-(void)setOfferResourceTitle:(NSString *)title {
    [offerRscLabel setText:[NSString stringWithFormat:@"供求资源:%@",title]];
    return ;
}

@end
