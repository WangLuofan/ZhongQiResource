//
//  ZQEnterpriseEvaluateViewController.m
//  中企资源
//
//  Created by 王落凡 on 15/6/3.
//  Copyright (c) 2015年 王落凡. All rights reserved.
//

#import "ZQResponseLabel.h"
#import "ZQEvaluateView.h"
#import "ZQCommentBar.h"
#import "ZQNewestTableViewCell.h"
#import "ZQEnterpriseEvaluateViewController.h"

#define kHeaderLabelHeight 20

@interface ZQEnterpriseEvaluateViewController () {
    ZQEvaluateView* evaluateView;
}

@end

@implementation ZQEnterpriseEvaluateViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setTitle:@"企业评价"];
    
    evaluateView = [[ZQEvaluateView alloc] initWithFrame:CGRectMake(0, 0, [self topViewBounds].size.width, [self topViewBounds].size.height - kHeaderLabelHeight)];
    [evaluateView setDelegate:self];
    [evaluateView setScore:3.5f commentCount:88];
    [self addCustomViewToTopView:evaluateView];
    
    UILabel* headerLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, evaluateView.frame.origin.y + evaluateView.frame.size.height, self.tableView.bounds.size.width, kHeaderLabelHeight)];
    [headerLabel setText:@"    最新动态"];
    [self addCustomViewToTopView:headerLabel];
    
    return ;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
