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

- (void)viewDidLoad {
    [super viewDidLoad];
    
    detailContentLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, self.view.bounds.size.height - kNavStatusHeight)];
    [detailContentLabel setTextColor:[UIColor blackColor]];
    [detailContentLabel setFont:[UIFont systemFontOfSize:14.0f]];
    [detailContentLabel setNumberOfLines:0];
    [self.view addSubview:detailContentLabel];
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"fxsq"] style:UIBarButtonItemStylePlain target:self action:@selector(shareButtonPressed:)];
}

-(void)shareButtonPressed:(UIBarButtonItem*)sender {
    [ZQBaseSocialShare consturctPublishContentWithContent:detailContentLabel.text image:nil title:self.title url:nil description:nil];
    return ;
}

-(void)setDetailContentLabelText:(NSString *)text {
    [detailContentLabel setText:text];
    return ;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
