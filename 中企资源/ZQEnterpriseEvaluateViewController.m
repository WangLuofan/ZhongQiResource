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
#import "ZQNavigationViewController.h"
#import "ZQNewestTableViewCell.h"
#import "ZQEnterpriseCommentViewController.h"
#import "ZQEnterpriseEvaluateViewController.h"

#define kTopEvaluateViewHeight 80
#define kHeaderLabelHeight 30

@interface ZQEnterpriseEvaluateViewController ()<ZQEvaluateViewDelegate>  {
    ZQEvaluateView* evaluateView;
}

@end

@implementation ZQEnterpriseEvaluateViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setTitle:@"企业评价"];
    
    evaluateView = [[ZQEvaluateView alloc] initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, kTopEvaluateViewHeight)];
    [evaluateView setDelegate:self];
    [evaluateView setScore:3.5f commentCount:88];
    [self addCustomViewToTopView:evaluateView];
    
    UILabel* headerLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, self.tableView.bounds.size.width, kHeaderLabelHeight)];
    [headerLabel setText:@"    最新动态"];
    [self.tableView setTableHeaderView:headerLabel];
    
    return ;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)evaluateView:(ZQEvaluateView *)evaluateView commentButtonPressed:(UIButton *)commentButton {
    ZQEnterpriseCommentViewController* commentController = [[ZQEnterpriseCommentViewController alloc] init];
    [self presentViewController:[[ZQNavigationViewController alloc] initWithRootViewController:commentController] animated:YES completion:^{
        [commentController setPushViewController:self];
    }];
}

@end
