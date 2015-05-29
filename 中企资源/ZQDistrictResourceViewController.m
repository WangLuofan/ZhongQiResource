//
//  ZQDistrictResourceViewController.m
//  中企资源
//
//  Created by 王落凡 on 15/5/29.
//  Copyright (c) 2015年 王落凡. All rights reserved.
//

#import "ZQDistrictResourceViewController.h"
#import "ZQRecommendTableViewCell.h"
#import "ZQToolBar.h"

#define kFilterViewHeight 40
#define kTableViewCellHeight 70
#define kTableViewGapWithFilterView 5

@interface ZQDistrictResourceViewController () <UITableViewDataSource,UITableViewDelegate> {
    NSArray* tableViewContentArray;
}

@end

@implementation ZQDistrictResourceViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setTitle:@"商圈资源"];
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:nil];
    
//    ZQFilterView* filterView = [[ZQFilterView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, kFilterViewHeight)];
//    [self.view addSubview:filterView];
    ZQToolBar* filterView = [[ZQToolBar alloc] initWithSuperView:self.view Styles:@[ZQToolBarStyleButton,ZQToolBarStyleSearchBar,ZQToolBarStyleButton] Text:@[@"按商圈类型",@"输入搜索内容",@"按地域选择"]];
    [self.view addSubview:filterView];
    
    self.tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, filterView.frame.origin.y + kFilterViewHeight + kTableViewGapWithFilterView, self.view.frame.size.width, self.view.bounds.size.height - kFilterViewHeight) style:UITableViewStylePlain];
    [self.tableView setBackgroundColor:self.view.backgroundColor];
    [self.tableView setSeparatorStyle:UITableViewCellSeparatorStyleNone];
    [self.tableView setDelegate:self];
    [self.tableView setDataSource:self];
    [self.view addSubview:self.tableView];
    
    tableViewContentArray = @[
                              @[@"img01",@"供求资源:整合联盟网",@"整合联盟网是中国资源整合第一官网,是资源整合嵘老师话茬下盛世纵横面向中国民营企业开展的资源整合五大平台之一。"],
                              @[@"img02",@"重工业行业商圈:中联重科",@"阿里巴巴商业圈，为您找到766个中联重科商机、中联重科经验交流、中联重科干货分享。在这里您还可以发现专业的中联重科商友圈子。"],
                              @[@"img03",@"高新技术成果转化财政专项资金扶持",@"阿里巴巴商业圈，为您找到766个中联重科商机、中联重科经验交流、中联重科干货分享。在这里您还可以发现专业的中联重科商友圈子。"]
                              ];
    
    return ;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return tableViewContentArray.count;
}

-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    ZQRecommendTableViewCell* cell = [[ZQRecommendTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"ZQDistrictResourceTableViewCellIdentifier"];
    if(cell == nil)
        cell = [[ZQRecommendTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"ZQDistrictResourceTableViewCellIdentifier"];
    
    [cell.imageView setImage:[UIImage imageNamed:tableViewContentArray[indexPath.row][0]]];
    [cell.textLabel setText:tableViewContentArray[indexPath.row][1]];
    [cell.detailTextLabel setText:tableViewContentArray[indexPath.row][2]];
    
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return kTableViewCellHeight ;
}

@end
