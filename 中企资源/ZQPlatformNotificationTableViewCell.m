//
//  ZQPlatformNotificationTableViewCell.m
//  中企资源
//
//  Created by 王落凡 on 15/6/11.
//  Copyright (c) 2015年 王落凡. All rights reserved.
//

#import "ZQPlatformNotificationTableViewCell.h"

#define kControlMargin 5
#define kShadowRadius 0.5f
#define kTitleLabelHeight 15
#define kCellHeight 100

@interface ZQPlatformNotificationTableViewCell () {
    UIButton* browseButton;
    UIButton* replyButton;
}

@end

@implementation ZQPlatformNotificationTableViewCell

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    
    if(self) {
        [self setBackgroundColor:[UIColor clearColor]];
        [self setSelectionStyle:UITableViewCellSelectionStyleNone];
        
        UIView* grayView = [[UIView alloc] initWithFrame:CGRectMake(kControlMargin, kControlMargin, self.contentView.bounds.size.width - 2*kControlMargin, kCellHeight)];
        [grayView setBackgroundColor:[UIColor colorWithRed:((CGFloat)223)/255 green:((CGFloat)223)/255 blue:((CGFloat)224)/255 alpha:1.0f]];
        [self.contentView addSubview:grayView];
        
        UIView* whiteView = [[UIView alloc] initWithFrame:CGRectMake(kShadowRadius, kShadowRadius, grayView.bounds.size.width - 2*kShadowRadius, grayView.bounds.size.height - 2*kShadowRadius)];
        [whiteView setBackgroundColor:[UIColor whiteColor]];
        [grayView addSubview:whiteView];
        
        UIView* contentView = [[UIView alloc] initWithFrame:CGRectMake(kShadowRadius, kShadowRadius, whiteView.bounds.size.width - 2*kShadowRadius, whiteView.bounds.size.height - 2*kShadowRadius)];
        [contentView setBackgroundColor:[UIColor colorWithRed:((CGFloat)241)/255 green:((CGFloat)242)/255 blue:((CGFloat)244)/255 alpha:1.0f]];
        [whiteView addSubview:contentView];
        
        self.titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(kControlMargin, kControlMargin, contentView.bounds.size.width - 2*kControlMargin, kTitleLabelHeight)];
        [self.titleLabel setFont:[UIFont systemFontOfSize:14.0f]];
        [contentView addSubview:self.titleLabel];
        
        self.contentLabel = [[UILabel alloc] initWithFrame:CGRectMake(self.titleLabel.frame.origin.x, self.titleLabel.frame.origin.y + self.titleLabel.frame.size.height, self.titleLabel.frame.size.width, contentView.bounds.size.height - 2*kTitleLabelHeight - kControlMargin)];
        [self.contentLabel setNumberOfLines:0];
        [self.contentLabel setFont:[UIFont systemFontOfSize:12.0f]];
        [contentView addSubview:self.contentLabel];
        
        browseButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [browseButton setImage:[UIImage imageNamed:@"dp1"] forState:UIControlStateNormal];
        [browseButton setFrame:CGRectMake(contentView.bounds.size.width * 2 / 3, contentView.bounds.size.height - kControlMargin - browseButton.imageView.image.size.height / 2, contentView.bounds.size.width / 6, browseButton.imageView.image.size.height / 2)];
        [browseButton.titleLabel setFont:[UIFont systemFontOfSize:12.0f]];
        [browseButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [browseButton.imageView setContentMode:UIViewContentModeScaleAspectFit];
        [contentView addSubview:browseButton];
        
        replyButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [replyButton setImage:[UIImage imageNamed:@"dp3"] forState:UIControlStateNormal];
        [replyButton setFrame:CGRectMake(contentView.bounds.size.width - kControlMargin - browseButton.frame.size.width, browseButton.frame.origin.y, browseButton.frame.size.width, browseButton.frame.size.height)];
        [replyButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [replyButton.titleLabel setFont:[UIFont systemFontOfSize:12.0f]];
        [replyButton.imageView setContentMode:UIViewContentModeScaleAspectFit];
        [contentView addSubview:replyButton];
    }
    
    return self;
}

-(void)setBrowseCount:(NSInteger)browseCount ReplyCount:(NSInteger)replyCount {
    [browseButton setTitle:[NSString stringWithFormat:@"%ld",(long)browseCount] forState:UIControlStateNormal];
    [replyButton setTitle:[NSString stringWithFormat:@"%ld",(long)replyCount] forState:UIControlStateNormal];
    return ;
}

@end
