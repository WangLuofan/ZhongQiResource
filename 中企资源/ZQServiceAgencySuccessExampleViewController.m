//
//  ZQServiceAgencySuccessExampleViewController.m
//  中企资源
//
//  Created by 王落凡 on 15/6/17.
//  Copyright (c) 2015年 王落凡. All rights reserved.
//

#import "ZQServiceAgencyTableViewCell.h"
#import "ZQServiceAgencySuccessExampleViewController.h"

@interface ZQServiceAgencySuccessExampleViewController ()

@end

@implementation ZQServiceAgencySuccessExampleViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setTitle:@"服务机构成功案例"];
//    [self setFilterViewStyles:@[ZQToolBarStyleButton,ZQToolBarStyleButton,ZQToolBarStyleButton] Text:@[@"按区域选择",@"按行业选择",@"系统推荐"]];
    
    return ;
}

-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    ZQServiceAgencyTableViewCell* cell = [tableView dequeueReusableCellWithIdentifier:@"ServiceAgencyTableViewCellIdentifier"];
    if(cell == nil) {
        cell = [[ZQServiceAgencyTableViewCell alloc] initWithStyle:(UITableViewCellStyle)ZQTableViewCellStyleNOButton reuseIdentifier:@"ServiceAgencyTableViewCellIdentifier"];
    }
    
    [cell.logoImageView setImage:[UIImage imageNamed:@"img_special"]];
    [cell.methodLabel setText:@"上海市建筑节能项目专项扶持办法"];
    [cell.detailLabel setText:@"湖南卡X电子商务有限公司成立于2008年8月，公司秉持为客户创造价值这一核心理念，为各行业企业提供专业的移动整合营销方案。公司拥有全球领先的企业APP和微信APP的开发、推广、运营、发布、管理、统计技术，汇聚行业最丰富、最优秀且最具性价比的产品，同时兼有专业的移动营销运营团队，让客房以最低的成本切入移动互联网营销，以达到最佳的宣传、推评选、促销、快速提升品牌知名度效果，为企业构建全新的营销渠道与方式。"];
    
    return cell;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    return ;
}

@end
