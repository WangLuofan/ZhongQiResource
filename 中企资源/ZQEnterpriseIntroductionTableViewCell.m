//
//  ZQEnterpriseIntroductionTableViewCell.m
//  中企资源
//
//  Created by 王落凡 on 15/6/1.
//  Copyright (c) 2015年 王落凡. All rights reserved.
//

#import "ZQStarRatingView.h"
#import "ZQEnterpriseIntroductionTableViewCell.h"

#define kControlMargin 5
#define kOtherControlViewHeight 110
#define kRightMarginWidth 150
#define kLogoImageWidth 75
#define kLogoImageHeight 45
#define kButtonHeight 20
#define kShadowRadius 0.5f


static CGFloat textContentHeight;

@interface ZQEnterpriseIntroductionTableViewCell () {
    UIView* otherControlView;
    NSString* telephoneNumber;
    BOOL bAttentioned;
    ZQStarRatingView* starRatingView;
    UIView* contentView;
}

@end

@implementation ZQEnterpriseIntroductionTableViewCell

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    
    if(self) {
        [self setSelectionStyle:UITableViewCellSelectionStyleNone];
        bAttentioned = NO;
        
        contentView = [[UIView alloc] initWithFrame:CGRectZero];
        [contentView setBackgroundColor:[UIColor colorWithRed:((CGFloat)242)/255 green:((CGFloat)242)/255 blue:((CGFloat)244)/255 alpha:1.0f]];
        [self addSubview:contentView];
        
        self.introductionLabel = [[UILabel alloc] initWithFrame:CGRectMake(kControlMargin, 0, self.bounds.size.width - 2*kControlMargin, 0)];
        [self.introductionLabel setNumberOfLines:0];
        [self.introductionLabel setFont:[UIFont systemFontOfSize:14.0f]];
        [self.introductionLabel setTextColor:[UIColor grayColor]];
        [self addSubview:self.introductionLabel];
        
        otherControlView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.bounds.size.width, kOtherControlViewHeight)];
        [self addSubview:otherControlView];
        
        //logo
        self.logoImageView = [[UIImageView alloc] initWithFrame:CGRectMake(kControlMargin, 0, kLogoImageWidth, kLogoImageHeight)];
        [self.logoImageView setCenter:CGPointMake(self.logoImageView.center.x, otherControlView.bounds.size.height / 4 + kControlMargin)];
        [self.logoImageView setContentMode:UIViewContentModeScaleAspectFit];
        [otherControlView addSubview:self.logoImageView];
        
        //联系方式
        self.contractLabel = [[UILabel alloc] initWithFrame:CGRectMake(self.logoImageView.bounds.origin.x + self.logoImageView.bounds.size.width + 2*kControlMargin, kControlMargin, self.bounds.size.width - kRightMarginWidth - self.logoImageView.bounds.origin.x - self.imageView.bounds.size.width, 20)];
        [self.contractLabel setTextColor:[UIColor lightGrayColor]];
        [self.contractLabel setFont:[UIFont systemFontOfSize:12.0f]];
        [otherControlView addSubview:self.contractLabel];
        
        //地址
        self.addressLabel = [[UILabel alloc] initWithFrame:CGRectMake(self.contractLabel.frame.origin.x, self.contractLabel.frame.origin.y + self.contractLabel.frame.size.height + kControlMargin, self.contractLabel.frame.size.width, self.contractLabel.frame.size.height)];
        [self.addressLabel setTextColor:[UIColor lightGrayColor]];
        [self.addressLabel setFont:[UIFont systemFontOfSize:12.0f]];
        [otherControlView addSubview:self.addressLabel];
        
        //综合评价
        UILabel* ratingLabel = [[UILabel alloc] initWithFrame:CGRectMake(self.contractLabel.frame.origin.x, self.addressLabel.frame.origin.y + self.addressLabel.frame.size.height + kControlMargin, 0, self.contractLabel.frame.size.height)];
        [ratingLabel setTextColor:[UIColor lightGrayColor]];
        [ratingLabel setFont:[UIFont systemFontOfSize:12.0f]];
        [ratingLabel setText:@"综合评价:"];
        [ratingLabel sizeToFit];
        [otherControlView addSubview:ratingLabel];
        
        //评分控件
        starRatingView = [[ZQStarRatingView alloc] initWithFrame:CGRectMake(ratingLabel.frame.origin.x + ratingLabel.frame.size.width, ratingLabel.frame.origin.y, self.addressLabel.frame.size.width / 3, ratingLabel.bounds.size.height) numberOfStars:5];
        [starRatingView setUserInteractionEnabled:NO];
        [starRatingView sizeToFit];
        [otherControlView addSubview:starRatingView];
        
        //分数
        self.scoreLabel = [[UILabel alloc] initWithFrame:CGRectMake(starRatingView.frame.origin.x + starRatingView.frame.size.width + kControlMargin, starRatingView.frame.origin.y, self.contractLabel.bounds.size.width / 6, starRatingView.frame.size.height)];
        [self.scoreLabel setTextColor:[UIColor lightGrayColor]];
        [self.scoreLabel setFont:[UIFont systemFontOfSize:12.0f]];
        [otherControlView addSubview:self.scoreLabel];
        
        //评论按钮
        UIButton* commentButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [commentButton setTag:0];
        [commentButton setTitle:@"评价" forState:UIControlStateNormal];
        [commentButton.titleLabel setFont:[UIFont systemFontOfSize:12.0f]];
        [commentButton setTitleColor:[UIColor lightGrayColor] forState:UIControlStateNormal];
        [commentButton setTitleColor:[UIColor blackColor] forState:UIControlStateHighlighted];
        [commentButton setImage:[UIImage imageNamed:@"pl"] forState:UIControlStateNormal];
        [commentButton.imageView setContentMode:UIViewContentModeScaleAspectFit];
        [commentButton setFrame:CGRectMake(self.contractLabel.frame.origin.x, otherControlView.bounds.size.height - kButtonHeight - kControlMargin, self.contractLabel.bounds.size.width / 3, commentButton.imageView.image.size.height / 2)];
        [commentButton setImageEdgeInsets:UIEdgeInsetsMake(0, -commentButton.imageView.image.size.width, 0, 0)];
        [commentButton setTitleEdgeInsets:UIEdgeInsetsMake(0, -commentButton.imageView.image.size.width, 0, 0)];
        [commentButton addTarget:self action:@selector(commentButtonPressed:) forControlEvents:UIControlEventTouchUpInside];
        [otherControlView addSubview:commentButton];
        
        //关注
        UIButton* attentionButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [attentionButton setTag:1];
        [attentionButton setTitle:@"关注" forState:UIControlStateNormal];
        [attentionButton.titleLabel setFont:[UIFont systemFontOfSize:12.0f]];
        [attentionButton setTitleColor:[UIColor lightGrayColor] forState:UIControlStateNormal];
        [attentionButton setTitleColor:[UIColor blackColor] forState:UIControlStateHighlighted];
        [attentionButton setImage:[UIImage imageNamed:@"gz"] forState:UIControlStateNormal];
        [attentionButton.imageView setContentMode:UIViewContentModeScaleAspectFit];
        [attentionButton setFrame:CGRectMake(commentButton.frame.origin.x + commentButton.frame.size.width, commentButton.frame.origin.y, commentButton.frame.size.width, commentButton.frame.size.height    )];
        [attentionButton setImageEdgeInsets:UIEdgeInsetsMake(0, -commentButton.imageView.image.size.width, 0, 0)];
        [attentionButton setTitleEdgeInsets:UIEdgeInsetsMake(0, -commentButton.imageView.image.size.width, 0, 0)];
        [attentionButton addTarget:self action:@selector(attentionButtonPressed:) forControlEvents:UIControlEventTouchUpInside];
        [otherControlView addSubview:attentionButton];
        
        //私聊
        UIButton* chatButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [chatButton setTag:2];
        [chatButton setTitle:@"私聊" forState:UIControlStateNormal];
        [chatButton.titleLabel setFont:[UIFont systemFontOfSize:12.0f]];
        [chatButton setTitleColor:[UIColor lightGrayColor] forState:UIControlStateNormal];
        [chatButton setTitleColor:[UIColor blackColor] forState:UIControlStateHighlighted];
        [chatButton setImage:[UIImage imageNamed:@"chat"] forState:UIControlStateNormal];
        [chatButton.imageView setContentMode:UIViewContentModeScaleAspectFit];
        [chatButton setFrame:CGRectMake(attentionButton.frame.origin.x + attentionButton.frame.size.width, commentButton.frame.origin.y, commentButton.frame.size.width, commentButton.frame.size.height    )];
        [chatButton setImageEdgeInsets:UIEdgeInsetsMake(0, -commentButton.imageView.image.size.width, 0, 0)];
        [chatButton setTitleEdgeInsets:UIEdgeInsetsMake(0, -commentButton.imageView.image.size.width, 0, 0)];
        [otherControlView addSubview:chatButton];
        
        //分隔线
        UIView* seperator = [[UIView alloc] initWithFrame:CGRectMake(self.contractLabel.frame.origin.x + self.contractLabel.frame.size.width + 2*kControlMargin, 3*kControlMargin, 0.5f, commentButton.frame.origin.y - self.contractLabel.frame.origin.y - 3*kControlMargin)];
        [seperator setBackgroundColor:[UIColor lightGrayColor]];
        [otherControlView addSubview:seperator];
        
        //电话按钮
        UIButton* telephoneButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [telephoneButton setTag:3];
        [telephoneButton setImage:[UIImage imageNamed:@"telphone"] forState:UIControlStateNormal];
        [telephoneButton setTitleColor:[UIColor lightGrayColor] forState:UIControlStateNormal];
        [telephoneButton setTitleColor:[UIColor blackColor] forState:UIControlStateHighlighted];
        [telephoneButton setFrame:CGRectMake(seperator.frame.origin.x + seperator.frame.size.width + 2*kControlMargin, 0, telephoneButton.imageView.image.size.width / 2, telephoneButton.imageView.image.size.height / 2)];
        [telephoneButton setCenter:CGPointMake(otherControlView.bounds.size.width - kRightMarginWidth / 6, seperator.center.y)];
        [telephoneButton addTarget:self action:@selector(telephoneButtonPressed:) forControlEvents:UIControlEventTouchUpInside];
        [otherControlView addSubview:telephoneButton];
    }
    
    return self;
}

-(void)setIntroductionLabelText:(NSString *)text {
    CGSize textSize = [text boundingRectWithSize:CGSizeMake(self.bounds.size.width - 2*kControlMargin, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:14.0f]} context:nil].size;
    textContentHeight = textSize.height;
    [self.introductionLabel setText:text];
    [self.introductionLabel setFrame:CGRectMake(2.0f, 1.0f, self.bounds.size.width - 4.0f, textSize.height)];
    
    [self adjustOtherControlViewPosition:(textSize.height)];
    
    return ;
}

-(void)setContractLabelText:(NSString *)text {
    [self.contractLabel setText:[NSString stringWithFormat:@"联系方式：%@",text]];
    return ;
}

-(void)setEnterpriseInfoWithPhone:(NSString *)phoneNumber Address:(NSString *)address Score:(CGFloat)score {
    [self.contractLabel setText:[NSString stringWithFormat:@"联系方式:%@",phoneNumber]];
    telephoneNumber = phoneNumber;
    [self.addressLabel setText:[NSString stringWithFormat:@"地址:%@",address]];
    [self.scoreLabel setText:[NSString stringWithFormat:@"%0.1f分",score]];
    [self.scoreLabel sizeToFit];
    [starRatingView setRating:score];
    return ;
}

-(void)adjustOtherControlViewPosition:(CGFloat)textHeight {
    [contentView setFrame:CGRectMake(0, kShadowRadius, self.bounds.size.width, [ZQEnterpriseIntroductionTableViewCell cellHeight] - 2*kShadowRadius)];
    [otherControlView setFrame:CGRectMake(0, textHeight, self.bounds.size.width, kOtherControlViewHeight)];
    return ;
}

-(void)telephoneButtonPressed:(UIButton*)sender {
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:[NSString stringWithFormat:@"tel://%@",telephoneNumber]]];
    return ;
}

+(CGFloat)cellHeight {
    return textContentHeight + kOtherControlViewHeight + kControlMargin;
}

-(void)attentionButtonPressed:(UIButton*)sender {
    if(!bAttentioned) {
        [sender setImage:[UIImage imageNamed:@"ygz"] forState:UIControlStateNormal];
        [sender setTitle:@"已关注" forState:UIControlStateNormal];
        bAttentioned = YES;
    } else {
        [sender setImage:[UIImage imageNamed:@"gz"] forState:UIControlStateNormal];
        [sender setTitle:@"关注" forState:UIControlStateNormal];
        bAttentioned = NO;
    }
    return ;
}

-(void)commentButtonPressed:(UIButton*)sender {
    if([self.delegate respondsToSelector:@selector(ZQEnterpriseIntroductionButtonPressed:)])
        [self.delegate ZQEnterpriseIntroductionButtonPressed:sender.tag];
    return ;
}

@end
