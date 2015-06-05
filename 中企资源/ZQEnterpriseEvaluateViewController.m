//
//  ZQEnterpriseEvaluateViewController.m
//  中企资源
//
//  Created by 王落凡 on 15/6/3.
//  Copyright (c) 2015年 王落凡. All rights reserved.
//

#import "ZQEvaluateView.h"
#import "ZQCommentBar.h"
#import "ZQNavigationViewController.h"
#import "ZQEnterpriseCommentViewController.h"
#import "ZQEnterpriseEvaluateViewController.h"

#define kTopEvaluateViewHeight 80
#define kBottomCommentBarHeight 40

@interface ZQEnterpriseEvaluateViewController () <ZQEvaluateViewDelegate> {
    ZQEvaluateView* evaluateView;
    ZQCommentBar* commentBar;
}

@end

@implementation ZQEnterpriseEvaluateViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setTitle:@"企业评价"];
    
    evaluateView = [[ZQEvaluateView alloc] initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, kTopEvaluateViewHeight)];
    [evaluateView setDelegate:self];
    [evaluateView setScore:4.9f commentCount:88];
    [self.view addSubview:evaluateView];
    
    commentBar = [[ZQCommentBar alloc] initWithFrame:CGRectMake(0, self.view.bounds.size.height - kNavStatusHeight - kBottomCommentBarHeight, self.view.bounds.size.width, kBottomCommentBarHeight)];
    [self.view addSubview:commentBar];
    
    self.tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, evaluateView.frame.origin.y + evaluateView.frame.size.height, self.view.bounds.size.width, self.view.bounds.size.height - kTopEvaluateViewHeight - kBottomCommentBarHeight - kNavStatusHeight) style:UITableViewStylePlain];
    [self.tableView setSeparatorStyle:UITableViewCellSeparatorStyleNone];
    [self.tableView setBackgroundColor:[UIColor clearColor]];
    [self.tableView addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tableViewTapped:)]];
    [self.view addSubview:self.tableView];
    
    return ;
}

-(void)evaluateView:(ZQEvaluateView *)evaluateView commentButtonPressed:(UIButton *)commentButton {
    ZQEnterpriseCommentViewController* commentController = [[ZQEnterpriseCommentViewController alloc] init];
    [self presentViewController:[[ZQNavigationViewController alloc] initWithRootViewController:commentController] animated:YES completion:^{
    }];
}

-(void)tableViewTapped:(UIGestureRecognizer*)sender {
    [commentBar resignFirstResponder];
    return ;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
