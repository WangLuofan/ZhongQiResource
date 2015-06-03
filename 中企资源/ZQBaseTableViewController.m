//
//  ZQBaseTableViewController.m
//  中企资源
//
//  Created by 王落凡 on 15/6/3.
//  Copyright (c) 2015年 王落凡. All rights reserved.
//

#import "ZQLoadMoreView.h"
#import "ZQBaseTableViewController.h"

#define kFilterViewHeight 40
#define kAdImageViewHeight 80
#define kLoadMoreHeight 30
#define kTableViewCellHeight 100

@interface ZQBaseTableViewController ()<UITableViewDelegate,UITableViewDataSource> {
    UIImageView* adImageView;
    ZQToolBar* filterView;
}

@end

@implementation ZQBaseTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    filterView = [[ZQToolBar alloc] initWithSuperView:self.view Styles:@[ZQToolBarStyleButton,ZQToolBarStyleButton,ZQToolBarStyleButton] Text:@[@"按区域选择",@"按业务范围选择",@"2015"]];
    [self.view addSubview:filterView];
    
    //广告图
    adImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, filterView.frame.origin.y + filterView.bounds.size.height + 0.5, self.view.bounds.size.width, kAdImageViewHeight)];
    [adImageView setImage:[UIImage imageNamed:@"banner01"]];
    [self.view addSubview:adImageView];
    
    self.tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, adImageView.frame.origin.y + adImageView.bounds.size.height, self.view.bounds.size.width, self.view.bounds.size.height - kFilterViewHeight - kAdImageViewHeight - kNavStatusHeight) style:UITableViewStylePlain];
    [self.tableView setBackgroundColor:[UIColor clearColor]];
    [self.tableView setSeparatorStyle:UITableViewCellSeparatorStyleNone];
    [self.tableView setDelegate:self];
    [self.tableView setDataSource:self];
    [self.view addSubview:self.tableView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)setTableViewNeedLoadMore:(BOOL)bNeeds {
    if(bNeeds) {
        UIButton* loadMore = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, self.tableView.bounds.size.width, kLoadMoreHeight)];
        [loadMore setTitle:@"加载更多..." forState:UIControlStateNormal];
        [loadMore setTitleColor:[UIColor lightGrayColor] forState:UIControlStateNormal];
        [loadMore setTitleColor:[UIColor blackColor] forState:UIControlStateHighlighted];
        [loadMore addTarget:self action:@selector(loadMoreButtonPressed:) forControlEvents:UIControlEventTouchUpInside];
        [self.tableView setTableFooterView:loadMore];
    }
    
    return ;
}

-(void)setFilterViewStyles:(NSArray *)styles Text:(NSArray *)text {
    [filterView setStyles:styles Text:text];
    return ;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 4;
}

-(void)loadMoreButtonPressed:(UIButton*)sender {
    ZQLoadMoreView* loadMore = [[ZQLoadMoreView alloc] initWithFrame:sender.bounds];
    [self.tableView setTableFooterView:loadMore];
    return ;
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return kTableViewCellHeight;
}

-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    return nil;
}

@end
