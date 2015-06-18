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
#define kLoadMoreHeight 30
#define kTableViewCellHeight 100

@interface ZQBaseTableViewController () {
}

@end

@implementation ZQBaseTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
   
    self.toolBarView = [[ZQToolBar alloc] initWithStyles:@[ZQToolBarButtonItem,ZQToolBarButtonItem,ZQToolBarButtonItem] TextArray:@[@"按区域选择",@"按业务范围选择",@"2015"] SuperView:self.view Delegate:self];
    [self.view addSubview:self.toolBarView];
    
    [self initTableViewWithTableViewStyle:UITableViewStylePlain];
    
    return ;
}

-(void)initTableViewWithTableViewStyle:(UITableViewStyle)tableViewStyle {
    [self.tableView removeFromSuperview];
    self.tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, self.toolBarView.frame.origin.y + self.toolBarView.bounds.size.height + 0.5, self.view.bounds.size.width, self.view.bounds.size.height - kFilterViewHeight - kNavStatusHeight) style:tableViewStyle];
    [self.tableView setBackgroundColor:[UIColor clearColor]];
    [self.tableView setSeparatorStyle:UITableViewCellSeparatorStyleNone];
    [self.tableView setDelegate:self];
    [self.tableView setDataSource:self];
    [self.view addSubview:self.tableView];
    
    return ;
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
//    [filterView setStyles:styles Text:text];
    return ;
}

-(void)setViewControllerNeedFilterView:(BOOL)bNeeds {
//    if(!bNeeds)
//        [filterView removeFromSuperview];
//    [self.tableView setFrame:CGRectMake(0, 0, self.view.bounds.size.width, self.view.bounds.size.height - kNavStatusHeight)];
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

-(void)loadMenuItemsForToolBarButtonItem:(ZQToolBarItem *)toolBarItem {
    return ;
}

@end
