//
//  ZQPolicyInterpretViewController.m
//  中企资源
//
//  Created by 王落凡 on 15/6/15.
//  Copyright (c) 2015年 王落凡. All rights reserved.
//

#import "ZQSpecialSupportTableViewCell.h"
#import "ZQNavigationViewController.h"
#import "ZQPolicyDetailViewController.h"
#import "ZQPolicyInterpretViewController.h"

@interface ZQPolicyInterpretViewController ()

@end

@implementation ZQPolicyInterpretViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setTitle:@"政策解读"];
    [self setTableViewNeedLoadMore:YES];
    [self setViewControllerNeedFilterView:NO];
    
    UIImageView* imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"banner03"]];
    [imageView setFrame:CGRectMake(0, 0, self.tableView.bounds.size.width, imageView.image.size.height / 2)];
    [self.tableView setTableHeaderView:imageView];
    
    return ;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    ZQSpecialSupportTableViewCell* cell = [tableView dequeueReusableCellWithIdentifier:@"PolicyInterpretTableViewCellIdentifier"];
    if(cell == nil) {
        cell = [[ZQSpecialSupportTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"PolicyInterpretTableViewCellIdentifier"];
    }
    
    [cell.logoImageView setImage:[UIImage imageNamed:@"img_special"]];
    [cell.methodLabel setText:@"上海市建筑节能项目专项扶持办法"];
    [cell.detailLabel setText:@"湖南卡X电子商务有限公司成立于2008年8月，公司秉持为客户创造价值这一核心理念，为各行业企业提供专业的移动整合营销方案。公司拥有全球领先的企业APP和微信APP的开发、推广、运营、发布、管理、统计技术，汇聚行业最丰富、最优秀且最具性价比的产品，同时兼有专业的移动营销运营团队，让客房以最低的成本切入移动互联网营销，以达到最佳的宣传、推评选、促销、快速提升品牌知名度效果，为企业构建全新的营销渠道与方式。"];
    
    return cell;
}

-(void)tableView:(UITableView*)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    ZQPolicyDetailViewController* detailController = [[ZQPolicyDetailViewController alloc] init];
    dispatch_async(dispatch_get_main_queue(), ^{
        [self presentViewController:[[ZQNavigationViewController alloc] initWithRootViewController:detailController] animated:YES completion:^{
        }];
    });
    return ;
}

@end
