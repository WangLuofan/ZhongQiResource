//
//  ZQBaseRscReplyViewController.m
//  中企资源
//
//  Created by 王落凡 on 15/6/15.
//  Copyright (c) 2015年 王落凡. All rights reserved.
//

#import "ZQBaseRscReplyViewController.h"

#define kControlMargin 5
#define kHeaderTitleLabelHeight 15
#define kHeaderTitleViewHeight 100

@interface ZQBaseRscReplyViewController () {
    UIView* headerTitleView;
    UILabel* headerTitleLabel;
    UILabel* commentContentLabel;
}

@end

@implementation ZQBaseRscReplyViewController

-(instancetype)init {
    self = [super initWithHeaderMargin:kHeaderTitleViewHeight];
    if(self) {
        [self generateHeaderTitleView];
    }
    
    return self;
}

-(void)generateHeaderTitleView {
//    headerTitleView = [self generateShadowViewWithHeight:kHeaderTitleViewHeight yPosition:0];
    headerTitleView = [self generateShadowViewWithHeight:kHeaderTitleViewHeight yPosition:0];

    headerTitleLabel = [[UILabel alloc] initWithFrame:CGRectMake(kControlMargin, kControlMargin, headerTitleView.bounds.size.width - 2*kControlMargin, kHeaderTitleLabelHeight)];
    [headerTitleLabel setFont:[UIFont systemFontOfSize:14.0f]];
    [headerTitleView addSubview:headerTitleLabel];

    commentContentLabel = [[UILabel alloc] initWithFrame:CGRectMake(headerTitleLabel.frame.origin.x, headerTitleLabel.frame.origin.y + headerTitleLabel.frame.size.height, headerTitleLabel.frame.size.width, headerTitleView.bounds.size.height - headerTitleLabel.frame.origin.y - headerTitleLabel.frame.size.height)];
    [commentContentLabel setNumberOfLines:0];
    [commentContentLabel setTextColor:[UIColor lightGrayColor]];
    [commentContentLabel setFont:[UIFont systemFontOfSize:12.0f]];
    [headerTitleView addSubview:commentContentLabel];
    return ;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setTitle:@"资源回复"];
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"回复" style:UIBarButtonItemStylePlain target:self action:@selector(replyButtonPressed:)];
    return ;
}

-(void)replyButtonPressed:(UIBarButtonItem*)sender {
    return ;
}

//[replyController setTitle:[entRscDistCell offerResourceTitle] CommentContent:entRscDistCell.detailLabel.text];
-(void)setTitle:(NSString *)title CommentContent:(NSString*)commentContent {
    [headerTitleLabel setText:title];
    [commentContentLabel setText:commentContent];
    return ;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
