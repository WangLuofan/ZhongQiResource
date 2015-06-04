//
//  ZQDistrictPostViewController.m
//  中企资源
//
//  Created by 王落凡 on 15/6/3.
//  Copyright (c) 2015年 王落凡. All rights reserved.
//

#import "ZQEnterpriseDetailInfoTableViewCell.h"
#import "ZQEnterpriseEvaluateCommentTableViewCell.h"
#import "ZQDistrictPostViewController.h"

#define kTableViewCellHeight 105

@interface ZQDistrictPostViewController ()<UITableViewDataSource,UITableViewDelegate,ZQEnterpriseEvaluateCommentTableViewCellDelegate>

@end

@implementation ZQDistrictPostViewController

-(instancetype)initWithTitle:(NSString *)title {
    self = [super init];
    
    if(self) {
        [self setTitle:title];
    }
    
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, self.view.bounds.size.height - kNavStatusHeight) style:UITableViewStylePlain];
    [self.tableView setSeparatorStyle:UITableViewCellSeparatorStyleNone];
    [self.tableView setBackgroundColor:[UIColor clearColor]];
    [self.tableView setDelegate:self];
    [self.tableView setDataSource:self];
    [self.view addSubview:self.tableView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 5;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    if(indexPath.row == 0)
        return kTableViewCellHeight;
    return [ZQEnterpriseEvaluateCommentTableViewCell cellHeight];
}

-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell* cell = nil;
    
    if(indexPath.row == 0) {
        cell = [tableView dequeueReusableCellWithIdentifier:@"EnterpriseDetailInfoTableViewCellIdentifier"];
        if(cell == nil)
            cell = [[ZQEnterpriseDetailInfoTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"EnterpriseDetailInfoTableViewCellIdentifier"];
        [((ZQEnterpriseDetailInfoTableViewCell*)cell).logoImageView setImage:[UIImage imageNamed:@"tx"]];
        [((ZQEnterpriseDetailInfoTableViewCell*)cell).founderLabel setText:@"创建人:帅帅"];
        [((ZQEnterpriseDetailInfoTableViewCell*)cell).postLabel setText:@"帖子:289"];
        [((ZQEnterpriseDetailInfoTableViewCell*)cell).receiveLabel setText:@"回复:4890"];
        [((ZQEnterpriseDetailInfoTableViewCell*)cell).districtLabel setText:@"萍乡电子商务创业园圈"];
        [((ZQEnterpriseDetailInfoTableViewCell*)cell).detailLabel setText:@"萍乡电子商务创业园，做有萍乡烙印的电商品牌!...这里是一个任由你发挥创造的平台，这里所需要的仅仅是你的热忱写才智，诚邀加入萍乡电子商务创业园"];
        
    }else {
        cell = [tableView dequeueReusableCellWithIdentifier:@"EnterpriseEvaluateCommentTableViewCellIdentifier"];
        if(cell == nil) {
            cell = [[ZQEnterpriseEvaluateCommentTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"EnterpriseEvaluateCommentTableViewCellIdentifier"];
        }
        [((ZQEnterpriseEvaluateCommentTableViewCell*)cell) setDelegate:self];
        [((ZQEnterpriseEvaluateCommentTableViewCell*)cell).headerImageView setImage:[UIImage imageNamed:@"tx1"]];
        [((ZQEnterpriseEvaluateCommentTableViewCell*)cell).nameLabel setText:@"帅帅"];
        [((ZQEnterpriseEvaluateCommentTableViewCell*)cell).dateTimeLabel setText:@"2015-05-25  18:03:29"];
        [((ZQEnterpriseEvaluateCommentTableViewCell*)cell) setCommentContentText:@"不错的资源管理平台，不错哦！！！不错的资源管理平台，不错哦！！！不错的资源管理平台，不错哦！！！！"];
        if(indexPath.row == 1)
            [((ZQEnterpriseEvaluateCommentTableViewCell*)cell) setCommentImageContent:@[[UIImage imageNamed:@"test"],[UIImage imageNamed:@"test"],[UIImage imageNamed:@"test"],[UIImage imageNamed:@"test"],[UIImage imageNamed:@"test"],[UIImage imageNamed:@"test2"],[UIImage imageNamed:@"test2"],[UIImage imageNamed:@"test"],[UIImage imageNamed:@"test2"]]];
    }
    
    return cell;
}

-(void)tableViewCell:(UITableViewCell *)tableViewCell browseImage:(UIImage *)image {
    UIView* contentView = [[UIView alloc] initWithFrame:self.view.bounds];
    [contentView addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(contentViewTapped:)]];
    [self.view addSubview:contentView];
    
    UIView* coverView = [[UIView alloc] initWithFrame:contentView.bounds];
    [coverView setBackgroundColor:[UIColor blackColor]];
    [coverView setAlpha:0.5f];
    [contentView addSubview:coverView];
    
    UIImageView* imageView = [[UIImageView alloc] initWithFrame:contentView.bounds];
    [imageView setImage:image];
    [imageView setContentMode:UIViewContentModeScaleAspectFit];
    [contentView addSubview:imageView];
    
    return ;
}

- (void)contentViewTapped:(UITapGestureRecognizer *)sender {
    [sender.view removeFromSuperview];
}

@end
