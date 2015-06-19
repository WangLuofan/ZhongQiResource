//
//  ZQResourceInfomationTableViewCell.m
//  中企资源
//
//  Created by 王落凡 on 15/6/15.
//  Copyright (c) 2015年 王落凡. All rights reserved.
//

#import "ZQSplitDistrictPostTableViewCell.h"

#define kShadowRadius 0.5
#define kControlMargin 5
#define kLabelHeight 20
#define kTableViewCellHeight 250

@interface ZQSplitDistrictPostTableViewCell () {
    UIButton* browseButton;
    UIButton* attentionButton;
    UIButton* replyButton;
}

@end

@implementation ZQSplitDistrictPostTableViewCell

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    
    if(self) {
        [self setBackgroundColor:[UIColor clearColor]];
        [self setSelectionStyle:UITableViewCellSelectionStyleNone];
        
        UIView* grayView = [[UIView alloc] initWithFrame:CGRectMake(0, kControlMargin, self.contentView.bounds.size.width, kTableViewCellHeight - kControlMargin)];
        [grayView setBackgroundColor:[UIColor colorWithRed:((CGFloat)219)/255 green:((CGFloat)216)/255 blue:((CGFloat)219)/255 alpha:1.0f]];
        [self.contentView addSubview:grayView];
        
        UIView* whiteView = [[UIView alloc] initWithFrame:CGRectMake(0, kShadowRadius, grayView.bounds.size.width, grayView.bounds.size.height - 2*kShadowRadius)];
        [whiteView setBackgroundColor:[UIColor colorWithRed:((CGFloat)241)/255 green:((CGFloat)242)/255 blue:((CGFloat)244)/255 alpha:1.0f]];
        [grayView addSubview:whiteView];
        
        self.logoImageView = [[UIImageView alloc] initWithFrame:CGRectMake(4*kControlMargin, kControlMargin, 10*kControlMargin, 10*kControlMargin)];
        [self.logoImageView setContentMode:UIViewContentModeScaleAspectFit];
        [whiteView addSubview:self.logoImageView];
        
        self.enterpriseLabel = [[UILabel alloc] initWithFrame:CGRectMake(self.logoImageView.frame.origin.x + self.logoImageView.frame.size.width + kControlMargin, self.logoImageView.frame.origin.y + kControlMargin, whiteView.bounds.size.width - self.logoImageView.frame.origin.x - self.logoImageView.frame.size.width - 2*kControlMargin, kLabelHeight)];
        [self.enterpriseLabel setTextColor:[UIColor colorWithRed:((CGFloat)21)/255 green:((CGFloat)58)/255 blue:((CGFloat)99)/255 alpha:1.0f]];
        [self.enterpriseLabel setFont:[UIFont systemFontOfSize:12.0f]];
        [whiteView addSubview:self.enterpriseLabel];
        
        self.dateTimeLabel = [[UILabel alloc] initWithFrame:CGRectMake(self.enterpriseLabel.frame.origin.x, self.enterpriseLabel.frame.origin.y + self.enterpriseLabel.frame.size.height, self.enterpriseLabel.frame.size.width, self.enterpriseLabel.frame.size.height)];
        [self.dateTimeLabel setTextColor:[UIColor lightGrayColor]];
        [self.dateTimeLabel setFont:[UIFont systemFontOfSize:12.0f]];
        [whiteView addSubview:self.dateTimeLabel];
        
        self.offerLabel = [[UILabel alloc] initWithFrame:CGRectMake(self.logoImageView.frame.origin.x, self.logoImageView.frame.origin.y + self.logoImageView.frame.size.height + kControlMargin, whiteView.bounds.size.width - 2*self.logoImageView.frame.origin.x, kLabelHeight)];
        [self.offerLabel setFont:[UIFont systemFontOfSize:12.0f]];
        [self.offerLabel setTextColor:[UIColor blackColor]];
        [whiteView addSubview:self.offerLabel];
        
        //分隔线
        UIView* seperatorLine = [[UIView alloc] initWithFrame:CGRectMake(kControlMargin, self.offerLabel.frame.origin.y + self.offerLabel.frame.size.height + kControlMargin, whiteView.bounds.size.width - 2*kControlMargin, 0.5f)];
        [seperatorLine setBackgroundColor:[UIColor colorWithRed:((CGFloat)211)/255 green:((CGFloat)210)/255 blue:((CGFloat)212)/255 alpha:1.0f]];
        [whiteView addSubview:seperatorLine];
        
        self.detailLabel = [[UILabel alloc] initWithFrame:CGRectMake(seperatorLine.frame.origin.x, seperatorLine.frame.origin.y + seperatorLine.frame.size.height + kControlMargin, seperatorLine.frame.size.width, whiteView.bounds.size.height - seperatorLine.frame.origin.y - seperatorLine.frame.size.height - 2*kLabelHeight)];
        [self.detailLabel setFont:[UIFont systemFontOfSize:12.0f]];
        [self.detailLabel setTextColor:[UIColor lightGrayColor]];
        [self.detailLabel setNumberOfLines:0];
        [whiteView addSubview:self.detailLabel];
        
        //浏览按钮
        browseButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [browseButton setFrame:CGRectMake(whiteView.bounds.size.width, self.detailLabel.frame.origin.y + self.detailLabel.frame.size.height + kControlMargin, 0, 0)];
        [browseButton setImage:[UIImage imageNamed:@"dp1"] forState:UIControlStateNormal];
        [browseButton.imageView setContentMode:UIViewContentModeScaleAspectFit];
        [browseButton setTitleColor:[UIColor lightGrayColor] forState:UIControlStateNormal];
        [browseButton.titleLabel setFont:[UIFont systemFontOfSize:12.0f]];
        [browseButton setEnabled:NO];
        [whiteView addSubview:browseButton];
        
        //关注按钮
        attentionButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [attentionButton setImage:[UIImage imageNamed:@"dp2"] forState:UIControlStateNormal];
        [attentionButton.imageView setContentMode:UIViewContentModeScaleAspectFit];
        [attentionButton setTitleColor:[UIColor lightGrayColor] forState:UIControlStateNormal];
        [attentionButton.titleLabel setFont:[UIFont systemFontOfSize:12.0f]];
        [attentionButton setEnabled:NO];
        [whiteView addSubview:attentionButton];
        
        //留言按钮
        replyButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [replyButton setImage:[UIImage imageNamed:@"dp3"] forState:UIControlStateNormal];
        [replyButton.imageView setContentMode:UIViewContentModeScaleAspectFit];
        [replyButton setTitleColor:[UIColor lightGrayColor] forState:UIControlStateNormal];
        [replyButton.titleLabel setFont:[UIFont systemFontOfSize:12.0f]];
        [replyButton setEnabled:NO];
        [whiteView addSubview:replyButton];
    }
    
    return self;
}

-(void)setBrowseCount:(NSInteger)browseCount AttentionCount:(NSInteger)attentionCount ReplyCount:(NSInteger)replyCount {
    [browseButton setTitle:[NSString stringWithFormat:@"%ld",(long)browseCount] forState:UIControlStateNormal];
    [attentionButton setTitle:[NSString stringWithFormat:@"%ld",(long)attentionCount] forState:UIControlStateNormal];
    [replyButton setTitle:[NSString stringWithFormat:@"%ld",(long)replyCount] forState:UIControlStateNormal];
    
    [browseButton sizeToFit];
    [attentionButton sizeToFit];
    [replyButton sizeToFit];
    
    [browseButton setFrame:CGRectMake(browseButton.frame.origin.x - browseButton.frame.size.width - attentionButton.frame.size.width - replyButton.frame.size.width - kControlMargin, browseButton.frame.origin.y, browseButton.frame.size.width, browseButton.imageView.image.size.height / 2)];
    [attentionButton setFrame:CGRectMake(browseButton.frame.origin.x + browseButton.frame.size.width, browseButton.frame.origin.y, attentionButton.frame.size.width, browseButton.frame.size.height)];
    [replyButton setFrame:CGRectMake(attentionButton.frame.origin.x + attentionButton.frame.size.width, attentionButton.frame.origin.y, replyButton.frame.size.width, browseButton.frame.size.height)];
    
    return ;
}

-(void)setWillShowBrowseButtons:(BOOL)bShown {
    if(!bShown) {
        [browseButton removeFromSuperview];
        [attentionButton removeFromSuperview];
        [replyButton removeFromSuperview];
    }
    return ;
}

@end
