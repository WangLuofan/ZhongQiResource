//
//  ZQDistrictRscRecommendViewController.m
//  中企资源
//
//  Created by 王落凡 on 15/6/13.
//  Copyright (c) 2015年 王落凡. All rights reserved.
//

#import "ZQDistrictRscRecommendTableViewCell.h"
#import "ZQDistrictRscRecommendViewController.h"

#define kDefaultTableViewCellHeight 50

@interface ZQDistrictRscRecommendViewController () <UITableViewDataSource,UITableViewDelegate>

@end

@implementation ZQDistrictRscRecommendViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setTitle:@"商圈资源推荐"];
    
    self.tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, self.view.bounds.size.height - kNavStatusHeight)];
    [self.tableView setSeparatorStyle:UITableViewCellSeparatorStyleNone];
    [self.tableView setDelegate:self];
    [self.tableView setDataSource:self];
    [self.view addSubview:self.tableView];
    
    return ;
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 4;
}

-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    ZQDistrictRscRecommendTableViewCell* cell = [tableView dequeueReusableCellWithIdentifier:@"DistrictRscRecommendTableViewCellIdentifier"];
    
    if(cell == nil)
        cell = [[ZQDistrictRscRecommendTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"DistrictRscRecommendTableViewCellIdentifier"];
    [cell setTitle:@"供求资源:中企招人事，月薪1W元" Detail:@"中企招人事，月薪1W元，一年工作以上者从优"];
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return kDefaultTableViewCellHeight;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
