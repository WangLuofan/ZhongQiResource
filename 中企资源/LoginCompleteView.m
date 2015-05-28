//
//  LoginCompleteView.m
//  中企资源
//
//  Created by 王落凡 on 15/5/28.
//  Copyright (c) 2015年 王落凡. All rights reserved.
//

#import "LoginCompleteView.h"

#define kShadowRadius 8
#define kImageViewGap 3
#define kHeaderViewGap 20
#define kInfoLabelWidthGap 20
#define kClosureButtonWidth 15
#define kClosureButtonHeight 20
#define kInfoLabelHeightGap 5

@implementation LoginCompleteView

-(instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    
    if(self) {
        //外层阴影
        UIView* bottomShadowView = [[UIView alloc] initWithFrame:CGRectMake(kHeaderViewGap, kHeaderViewGap, self.frame.size.height - 2*kHeaderViewGap, self.frame.size.height - 2*kHeaderViewGap)];
        [bottomShadowView setBackgroundColor:[UIColor whiteColor]];
        [bottomShadowView setAlpha:0.5f];
        [bottomShadowView.layer setCornerRadius:bottomShadowView.bounds.size.width/2];
        [bottomShadowView.layer setMasksToBounds:YES];
        [self addSubview:bottomShadowView];
        
        //中间阴影
        UIView* centerShadowView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, bottomShadowView.frame.size.width - 2* kShadowRadius, bottomShadowView.frame.size.height - 2*kShadowRadius)];
        [centerShadowView setBackgroundColor:[UIColor whiteColor]];
        [centerShadowView.layer setCornerRadius:centerShadowView.bounds.size.width/2];
        [centerShadowView.layer setMasksToBounds:YES];
        [centerShadowView setCenter:bottomShadowView.center];
        [self addSubview:centerShadowView];
        
        //头像
        self.headerImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, centerShadowView.bounds.size.width - 2*kImageViewGap, centerShadowView.bounds.size.height - 2*kImageViewGap)];
        [self.headerImageView.layer setCornerRadius:self.headerImageView.bounds.size.width / 2];
        [self.headerImageView.layer setMasksToBounds:YES];
        [self.headerImageView setCenter:centerShadowView.center];
        [self addSubview:self.headerImageView];
        
        //用户信息标签
        self.userNameLabel = [[UILabel alloc] initWithFrame:CGRectMake(self.headerImageView.frame.origin.x + self.headerImageView.frame.size.width + kInfoLabelWidthGap, self.headerImageView.frame.origin.y + kInfoLabelHeightGap, self.frame.size.width - self.headerImageView.frame.origin.x - self.headerImageView.frame.size.width - 2* kInfoLabelWidthGap, self.headerImageView.frame.size.height / 3)];
        [self addSubview:self.userNameLabel];
        
        //公司信息标签
        self.companyLabel = [[UILabel alloc] initWithFrame:CGRectMake(self.userNameLabel.frame.origin.x, self.userNameLabel.frame.origin.y + self.userNameLabel.frame.size.height + 2*kInfoLabelHeightGap, self.userNameLabel.bounds.size.width, self.userNameLabel.bounds.size.height)];
        [self.companyLabel setFont:[UIFont systemFontOfSize:15.0f]];
        [self.companyLabel setTextColor:[UIColor whiteColor]];
        [self addSubview:self.companyLabel];
        
        //按钮
        self.closureButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [self.closureButton setFrame:CGRectMake(self.frame.size.width - kInfoLabelWidthGap, self.userNameLabel.frame.origin.y + self.userNameLabel.frame.size.height - kClosureButtonHeight / 2, kClosureButtonWidth, kClosureButtonHeight)];
        [self.closureButton setImage:[UIImage imageNamed:@"arrow_right"] forState:UIControlStateNormal];
        [self addSubview:self.closureButton];
        
        [self setHidden:YES];
    }
    
    return self;
}

-(void)showLoginCompleteViewWithImageName:(NSString *)imageName userName:(NSString *)userName companyName:(NSString *)companyName {
    [self setHidden:NO];
    [self.headerImageView setImage:[UIImage imageNamed:imageName]];
    [self.companyLabel setText:companyName];
    
    NSMutableAttributedString* attributedString = [[NSMutableAttributedString alloc] initWithString:[NSString stringWithFormat:@"%@,您好",userName]];
    [attributedString addAttribute:NSForegroundColorAttributeName value:[UIColor whiteColor] range:NSMakeRange(0, userName.length)];
    [self.userNameLabel setAttributedText:attributedString];
    
    return ;
}

@end
