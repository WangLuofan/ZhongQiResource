//
//  ZQEnterpriseTableViewCell.m
//  中企资源
//
//  Created by 王落凡 on 15/5/29.
//  Copyright (c) 2015年 王落凡. All rights reserved.
//

#import "ZQCheckBox.h"
#import "ZQEnterpriseTableViewCell.h"

#define kControlMargin 10
#define kShadowRadius 0.5
#define kTableViewCellHeight 80

@interface ZQEnterpriseTableViewCell () {
    UILabel* subInfoLabel;
}

@end

@implementation ZQEnterpriseTableViewCell

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    
    if(self) {
        [self setSelectionStyle:UITableViewCellSelectionStyleNone];
        [self setBackgroundColor:[UIColor clearColor]];
        
        //阴影View
        UIView* shadowView = [[UIView alloc] initWithFrame:CGRectMake(0, kControlMargin, self.frame.size.width,kTableViewCellHeight)];
        [shadowView setBackgroundColor:[UIColor lightGrayColor]];
        [self addSubview:shadowView];
        
        //内容View
        UIView* contentView = [[UIView alloc] initWithFrame:CGRectMake(kShadowRadius, kShadowRadius, shadowView.bounds.size.width ,shadowView.bounds.size.height - 2*kShadowRadius)];
        [contentView setBackgroundColor:[UIColor whiteColor]];
        [shadowView addSubview:contentView];
        
        //单选框
        self.checkButton = [[ZQCheckBox alloc] initWithFrame:CGRectMake(kControlMargin, 0, 0, 0) shouldFixFrame:YES];
        [self.checkButton setCenter:CGPointMake(self.checkButton.center.x, contentView.bounds.size.height / 2)];
        [contentView addSubview:self.checkButton];
        
        //logo图片视图
        self.logoImageView = [[UIImageView alloc] initWithFrame:CGRectMake(self.checkButton.frame.origin.x + self.checkButton.bounds.size.width + kControlMargin, kControlMargin, kTableViewCellHeight, kTableViewCellHeight - 2*kControlMargin)];
        [self.logoImageView setContentMode:UIViewContentModeScaleAspectFit];
        [self.logoImageView setCenter:CGPointMake(self.logoImageView.center.x, self.checkButton.center.y)];
        [contentView addSubview:self.logoImageView];
        
        //公司名称标签
        self.companyNameLabel = [[UILabel alloc] initWithFrame:CGRectMake(self.logoImageView.frame.origin.x + self.logoImageView.bounds.size.width + kControlMargin, 2*kControlMargin, contentView.frame.size.width - self.logoImageView.bounds.size.width - self.logoImageView.frame.origin.x - 2*kControlMargin, 2*kControlMargin)];
        [self.companyNameLabel setFont:[UIFont systemFontOfSize:12.0f]];
        [self.companyNameLabel setTextColor:[UIColor blackColor]];
        [contentView addSubview:self.companyNameLabel];
        
        //下标信息标签
        subInfoLabel = [[UILabel alloc] initWithFrame:CGRectMake(self.companyNameLabel.frame.origin.x, self.companyNameLabel.frame.origin.y + self.companyNameLabel.bounds.size.height + kControlMargin / 3, self.companyNameLabel.bounds.size.width, self.companyNameLabel.bounds.size.height)];
        [subInfoLabel setFont:[UIFont systemFontOfSize:12.0f]];
        [subInfoLabel setTextColor:[UIColor blackColor]];
        [contentView addSubview:subInfoLabel];
    }
    
    return self;
}

-(void)setsubInfoLabelTextWithDiscription:(NSString *)discription ContentText:(NSString *)contentText {
    NSMutableAttributedString* attributedString = [[NSMutableAttributedString alloc] initWithString:[NSString stringWithFormat:@"%@:%@",discription,contentText]];
    [attributedString addAttribute:NSForegroundColorAttributeName value:[UIColor blueColor] range:NSMakeRange(discription.length + 1, contentText.length)];
    [subInfoLabel setAttributedText:attributedString];
    return ;
}

@end
