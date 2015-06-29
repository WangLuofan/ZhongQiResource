//
//  ZQPolicyDetailViewController.m
//  中企资源
//
//  Created by 王落凡 on 15/6/16.
//  Copyright (c) 2015年 王落凡. All rights reserved.
//

#import "ZQBaseSocialShare.h"
#import "ZQPolicyDetailViewController.h"

@interface ZQPolicyDetailViewController () {
    UILabel* detailContentLabel;
    UIScrollView* contentScrollView;
}

@end

@implementation ZQPolicyDetailViewController

-(instancetype)initWithTitle:(NSString *)title {
    self = [super init];
    
    if(self) {
        [self setTitle:@"解读详情"];
    }
    
    return self;
}

-(instancetype)init {
    self = [super init];
    
    if(self) {
        [self setTitle:@"解读详情"];
    }
    
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    contentScrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, self.view.bounds.size.height - kNavStatusHeight)];
    [self.view addSubview:contentScrollView];
    
    detailContentLabel = [[UILabel alloc] init];
    [detailContentLabel setTextColor:[UIColor blackColor]];
    [detailContentLabel setFont:[UIFont systemFontOfSize:14.0f]];
    [detailContentLabel setNumberOfLines:0];
    [contentScrollView addSubview:detailContentLabel];
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"fxsq"] style:UIBarButtonItemStylePlain target:self action:@selector(shareButtonPressed:)];
}

-(void)shareButtonPressed:(UIBarButtonItem*)sender {
    [ZQBaseSocialShare consturctPublishContentWithContent:detailContentLabel.text image:nil title:self.title url:nil description:nil];
    return ;
}

-(void)setDetailContentLabelText:(NSString *)text {
    CGSize textSize = [text boundingRectWithSize:CGSizeMake(contentScrollView.bounds.size.width, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:14.0f]} context:nil].size;
    [detailContentLabel setFrame:CGRectMake(0, 0, contentScrollView.bounds.size.width, textSize.height)];
    [detailContentLabel setText:text];
    [contentScrollView setContentSize:CGSizeMake(0, textSize.height)];
    return ;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
