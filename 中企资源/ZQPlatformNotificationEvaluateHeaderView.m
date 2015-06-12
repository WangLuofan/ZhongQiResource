//
//  ZQPlatformNotificationEvaluateHeaderView.m
//  中企资源
//
//  Created by 王落凡 on 15/6/12.
//  Copyright (c) 2015年 王落凡. All rights reserved.
//

#import "ZQPlatformNotificationEvaluateHeaderView.h"

#define kControlMargin 2.5f
#define kHeaderTitleLableHeight 15

@interface ZQPlatformNotificationEvaluateHeaderView () {
    UILabel* headerLabel;
    UILabel* contentLabel;
}

@end

@implementation ZQPlatformNotificationEvaluateHeaderView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        headerLabel = [[UILabel alloc] initWithFrame:CGRectMake(kControlMargin, 0, self.bounds.size.width - 2*kControlMargin, kHeaderTitleLableHeight)];
        [headerLabel setFont:[UIFont systemFontOfSize:14.0f]];
        [self addSubviewToContentView:headerLabel];
        
        contentLabel = [[UILabel alloc] initWithFrame:CGRectMake(headerLabel.frame.origin.x, headerLabel.frame.origin.y + headerLabel.frame.size.height, headerLabel.frame.size.width, self.bounds.size.height - 2*kHeaderTitleLableHeight)];
        [contentLabel setTextColor:[UIColor lightGrayColor]];
        [contentLabel setFont:[UIFont systemFontOfSize:12.0f]];
        [contentLabel setNumberOfLines:0];
        [self addSubviewToContentView:contentLabel];
    }
    return self;
}

-(void)setTitle:(NSString *)title Content:(NSString *)content {
    [headerLabel setText:title];
    [contentLabel setText:content];
    
    return ;
}

@end
