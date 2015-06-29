//
//  ZQMyChatViewController.m
//  中企资源
//
//  Created by 王落凡 on 15/5/29.
//  Copyright (c) 2015年 王落凡. All rights reserved.
//

#import "ZQMyChatTableViewCell.h"
#import "ZQMyChatViewController.h"

#define kSearchBarHeight 44

@interface ZQMyChatViewController ()<UITableViewDataSource,UITableViewDelegate> {
    UISearchDisplayController* searchDisplayController;
}

@end

@implementation ZQMyChatViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setTitle:@"我的聊天"];
    
    self.tableView = [[UITableView alloc ]initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, self.view.bounds.size.height - kNavStatusHeight) style:UITableViewStylePlain];
//    [self.tableView setSeparatorStyle:UITableViewCellSeparatorStyleNone];
    [self.tableView setBackgroundColor:[UIColor clearColor]];
    [self.tableView setDelegate:self];
    [self.tableView setDataSource:self];
    [self.view addSubview:self.tableView];
    
    UISearchBar* searchBar = [[UISearchBar alloc] initWithFrame:CGRectMake(0, 0, self.tableView.bounds.size.width, kSearchBarHeight)];
    [searchBar setPlaceholder:@"搜索聊天纪录"];
    [self.tableView setTableHeaderView:searchBar];
    
    searchDisplayController = [[UISearchDisplayController alloc] initWithSearchBar:searchBar contentsController:self];
    
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
    return 4;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    return ;
}

-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    ZQMyChatTableViewCell* cell = (ZQMyChatTableViewCell*)[tableView dequeueReusableCellWithIdentifier:@"MyChatTableViewCell"];
    if(cell == nil)
        cell = [[ZQMyChatTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"MyChatTableViewCell"];
    
    [cell.headerImageButton setImage:[UIImage imageNamed:@"tx"]];
    [cell.enterpriseNameLabel setText:@"湖南力天汽车集团有限公司"];
    [cell.timeLabel setText:@"09:22"];
    [cell.messageLabel setText:@"可以留下您的联系方式吗?"];
    [cell setBradgeNumber:3];
    
    return cell;
}

@end
