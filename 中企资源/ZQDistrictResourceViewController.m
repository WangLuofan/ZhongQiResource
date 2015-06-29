//
//  ZQDistrictResourceViewController.m
//  中企资源
//
//  Created by 王落凡 on 15/5/29.
//  Copyright (c) 2015年 王落凡. All rights reserved.
//

#import "ZQNewDistrictRscViewController.h"
#import "ZQNavigationViewController.h"
#import "ZQDistrictPostViewController.h"
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
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(newDistrictButtonPressed:)];
    
    [self setTableViewNeedLoadMore:NO];

    tableViewContentArray = @[
                              @[@"img",@"萍乡电子商务创业园圈",@"萍乡电子商务创业园，做有萍乡烙印的电商品牌!...这里是一个任由你发挥创造的平台，这里所需要的仅仅是你的热忱写才智，诚邀加入萍乡电子商务创业园"],
                              @[@"img02",@"重工业行业商圈:中联重科",@"阿里巴巴商业圈，为您找到766个中联重科商机、中联重科经验交流、中联重科干货分享。在这里您还可以发现专业的中联重科商友圈子。"],
                              @[@"img03",@"高新技术成果转化财政专项资金扶持",@"阿里巴巴商业圈，为您找到766个中联重科商机、中联重科经验交流、中联重科干货分享。在这里您还可以发现专业的中联重科商友圈子。"]
                              ];
    
    return ;
}

-(void)newDistrictButtonPressed:(UIBarButtonItem*)sender {
    ZQNewDistrictRscViewController* districtRscController = [[ZQNewDistrictRscViewController alloc] init];
    [self presentViewController:[[ZQNavigationViewController alloc] initWithRootViewController:districtRscController] animated:YES completion:^{
    }];
    
    return ;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    ZQRecommendTableViewCell* cell = (ZQRecommendTableViewCell*)[tableView cellForRowAtIndexPath:indexPath];
    [cell setCellBackgroundColor:[UIColor lightGrayColor]];
    
    dispatch_async(dispatch_get_main_queue(), ^{
        ZQDistrictPostViewController* postController = [[ZQDistrictPostViewController alloc] initWithTitle:tableViewContentArray[indexPath.row][1]];
        [self presentViewController:[[ZQNavigationViewController alloc] initWithRootViewController:postController] animated:YES completion:^{
        }];
    });
    return ;
}

-(void)tableView:(UITableView *)tableView didDeselectRowAtIndexPath:(NSIndexPath *)indexPath {
    ZQRecommendTableViewCell* cell = (ZQRecommendTableViewCell*)[tableView cellForRowAtIndexPath:indexPath];
    [cell setCellBackgroundColor:[UIColor whiteColor]];
}

@end
