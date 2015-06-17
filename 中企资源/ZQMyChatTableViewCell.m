//
//  ZQMyChatTableViewCell.m
//  中企资源
//
//  Created by 王落凡 on 15/6/14.
//  Copyright (c) 2015年 王落凡. All rights reserved.
//

#import "ZQBradgeNumber.h"
#import "ZQMyChatTableViewCell.h"

#define kControlMargin 5

@interface ZQMyChatTableViewCell () {
    ZQBradgeNumber* bradgeNumberButton;
    UIView* selectionView;
}

@end

@implementation ZQMyChatTableViewCell

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    
    if(self) {
        [self setBackgroundColor:[UIColor clearColor]];
        [self setSelectionStyle:UITableViewCellSelectionStyleNone];
        
        self.headerImageView = [[UIImageView alloc] initWithFrame:CGRectMake(2*kControlMargin, kControlMargin, self.contentView.bounds.size.height - 2*kControlMargin, self.contentView.bounds.size.height - 2*kControlMargin)];
        [self.headerImageView setContentMode:UIViewContentModeScaleAspectFit];
        [self.headerImageView.layer setCornerRadius:self.headerImageView.bounds.size.height / 2];
        [self.contentView addSubview:self.headerImageView];
        
        self.enterpriseNameLabel = [[UILabel alloc] initWithFrame:CGRectMake(self.headerImageView.frame.origin.x + kControlMargin + self.headerImageView.bounds.size.width, self.headerImageView.frame.origin.y, (self.contentView.bounds.size.width - kControlMargin - self.headerImageView.frame.origin.x - self.headerImageView.frame.size.width) * 3 / 4, self.headerImageView.bounds.size.height / 2)];
        [self.enterpriseNameLabel setFont:[UIFont systemFontOfSize:12.0f]];
        [self.contentView addSubview:self.enterpriseNameLabel];
        
        self.timeLabel = [[UILabel alloc] initWithFrame:CGRectMake(self.enterpriseNameLabel.frame.origin.x + self.enterpriseNameLabel.frame.size.width + kControlMargin, self.enterpriseNameLabel.frame.origin.y, self.bounds.size.width - self.enterpriseNameLabel.frame.origin.x - self.enterpriseNameLabel.frame.size.width - 2*kControlMargin, self.enterpriseNameLabel.frame.size.height)];
        [self.timeLabel setTextColor:[UIColor lightGrayColor]];
        [self.timeLabel setFont:[UIFont systemFontOfSize:12.0f]];
        [self.timeLabel setTextAlignment:NSTextAlignmentCenter];
        [self.contentView addSubview:self.timeLabel];
        
        self.messageLabel = [[UILabel alloc] initWithFrame:CGRectMake(self.enterpriseNameLabel.frame.origin.x, self.enterpriseNameLabel.frame.origin.y + self.enterpriseNameLabel.frame.size.height, self.contentView.frame.size.width - self.headerImageView.frame.origin.x - self.headerImageView.frame.size.width - kControlMargin, self.enterpriseNameLabel.frame.size.height)];
        [self.messageLabel setTextColor:[UIColor lightGrayColor]];
        [self.messageLabel setFont:[UIFont systemFontOfSize:12.0f]];
        [self.contentView addSubview:self.messageLabel];
        
        //bradgeNumber
        bradgeNumberButton = [ZQBradgeNumber newInstance];
        [bradgeNumberButton setCenter:CGPointMake(self.timeLabel.center.x, self.messageLabel.center.y)];
        [self.contentView addSubview:bradgeNumberButton];
        
        selectionView = [[UIView alloc] initWithFrame:self.contentView.bounds];
        [selectionView setAlpha:0.5f];
        [selectionView setBackgroundColor:[UIColor lightGrayColor]];
    }
    
    return self;
}

-(void)setBradgeNumber:(NSInteger)bradgeNumber {
    [bradgeNumberButton setBradgeNumber:bradgeNumber];
    return ;
}

-(void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    if(selected) {
        [self setBackgroundView:selectionView];
    }else {
        [self setBackgroundView:nil];
    }
    return ;
}

@end
