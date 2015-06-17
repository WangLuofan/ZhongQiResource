//
//  ZQBaseTableViewController.h
//  中企资源
//
//  Created by 王落凡 on 15/6/3.
//  Copyright (c) 2015年 王落凡. All rights reserved.
//

#import "ZQToolBar.h"
#import "ZQToolItem.h"
#import "ZQBaseExitViewController.h"

@interface ZQBaseTableViewController : ZQBaseExitViewController <UITableViewDelegate,UITableViewDataSource,ZQToolBarDelegate>

@property(nonatomic,strong) UITableView* tableView;

-(void)initTableViewWithTableViewStyle:(UITableViewStyle)tableViewStyle;
-(void)setTableViewNeedLoadMore:(BOOL)bNeeds;
-(void)setViewControllerNeedFilterView:(BOOL)bNeeds;
-(void)setFilterViewStyles:(NSArray*)styles Text:(NSArray*)text;

@end
