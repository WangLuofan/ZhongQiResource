//
//  ZQDistrictRscRecommendDetailViewController.m
//  中企资源
//
//  Created by 王落凡 on 15/6/15.
//  Copyright (c) 2015年 王落凡. All rights reserved.
//

#import "ZQDistrictRscRecommendDetailViewController.h"

#define kTitleLabelHeight 30

@interface ZQDistrictRscRecommendDetailViewController () {
    UILabel* titleLabel;
    UILabel* detailLabel;
}

@end

@implementation ZQDistrictRscRecommendDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setTitle:@"资源详情"];
    
    titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, kTitleLabelHeight)];
    [titleLabel setFont:[UIFont systemFontOfSize:12.0f]];
    [self.view addSubview:titleLabel];
    
    detailLabel = [[UILabel alloc] initWithFrame:CGRectMake(titleLabel.frame.origin.x, titleLabel.frame.origin.y + titleLabel.frame.size.height, self.view.bounds.size.width, self.view.bounds.size.height - 3*kTitleLabelHeight - kNavStatusHeight)];
    [detailLabel setNumberOfLines:0];
    [self.view addSubview:detailLabel];
    
    UIView* buttonContentView = [[UIView alloc] initWithFrame:CGRectMake(detailLabel.frame.origin.x, detailLabel.frame.origin.y + detailLabel.frame.size.height, self.view.bounds.size.width, 2*kTitleLabelHeight)];
    [self.view addSubview:buttonContentView];
    
    UIButton* attentionButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [attentionButton setImage:[UIImage imageNamed:@"gz"] forState:UIControlStateNormal];
    [attentionButton setTitle:@"关注" forState:UIControlStateNormal];
    [attentionButton.titleLabel setFont:[UIFont systemFontOfSize:12.0f]];
    [attentionButton setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
    [attentionButton setTitleColor:[UIColor blackColor] forState:UIControlStateHighlighted];
    [attentionButton setFrame:CGRectMake(0, 0, buttonContentView.bounds.size.width / 3, attentionButton.imageView.image.size.height / 2)];
    [attentionButton.imageView setContentMode:UIViewContentModeScaleAspectFit];
    [attentionButton setCenter:CGPointMake(attentionButton.center.x, buttonContentView.bounds.size.height / 2)];
    [buttonContentView addSubview:attentionButton];
    
    UIButton* replyButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [replyButton setImage:[UIImage imageNamed:@"chat"] forState:UIControlStateNormal];
    [replyButton setTitle:@"回复" forState:UIControlStateNormal];
    [replyButton setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
    [replyButton setTitleColor:[UIColor blackColor] forState:UIControlStateHighlighted];
    [replyButton.titleLabel setFont:[UIFont systemFontOfSize:12.0f]];
    [replyButton setFrame:CGRectMake(attentionButton.frame.origin.x + attentionButton.frame.size.width, attentionButton.frame.origin.y, attentionButton.frame.size.width, attentionButton.frame.size.height)];
    [replyButton.imageView setContentMode:UIViewContentModeScaleAspectFit];
    [replyButton setCenter:CGPointMake(replyButton.center.x, attentionButton.center.y)];
    [buttonContentView addSubview:replyButton];
    
    UIButton* callButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [callButton setImage:[UIImage imageNamed:@"stelphone"] forState:UIControlStateNormal];
    [callButton setTitle:@"一键呼叫" forState:UIControlStateNormal];
    [callButton setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
    [callButton setTitleColor:[UIColor blackColor] forState:UIControlStateHighlighted];
    [callButton.titleLabel setFont:[UIFont systemFontOfSize:12.0f]];
    [callButton setFrame:CGRectMake(replyButton.frame.origin.x + replyButton.frame.size.width, replyButton.frame.origin.y, replyButton.frame.size.width, replyButton.frame.size.height)];
    [callButton.imageView setContentMode:UIViewContentModeScaleAspectFit];
    [callButton setCenter:CGPointMake(callButton.center.x, attentionButton.center.y)];
    [buttonContentView addSubview:callButton];
    
    return ;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
