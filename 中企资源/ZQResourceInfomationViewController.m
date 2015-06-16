//
//  ZQResourceInfomationViewController.m
//  中企资源
//
//  Created by 王落凡 on 15/6/15.
//  Copyright (c) 2015年 王落凡. All rights reserved.
//

#import "ZQResourceInfomationTableViewCell.h"
#import "ZQResourceInfomationViewController.h"

@interface ZQResourceInfomationViewController ()<UITableViewDataSource,UITableViewDelegate>

@end

@implementation ZQResourceInfomationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
    [self.tableView setBackgroundColor:[UIColor clearColor]];
    [self.tableView setDelegate:self];
    [self.tableView setDataSource:self];
    [self.view addSubview:self.tableView];
    
    return ;
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 2;
}

-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    ZQResourceInfomationTableViewCell* cell = [tableView dequeueReusableCellWithIdentifier:@"ResourceInfomationTableViewCellIdentifier"];
    if(cell == nil)
        cell = [[ZQResourceInfomationTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"ResourceInfomationTableViewCellIdentifier"];
    [cell.logoImageView setImage:[UIImage imageNamed:@"tx"]];
    [cell.enterpriseLabel setText:@"羽凌贸易商圈"];
    [cell.dateTimeLabel setText:@"2015-05-25 18:00:00"];
    
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 200;
}

-(void)setFrame:(CGRect)frame {
    [super setFrame:frame];
    [self.tableView setFrame:self.view.bounds];
    
    return ;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
