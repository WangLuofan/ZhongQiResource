//
//  ZQServiceAgencyViewController.m
//  中企资源
//
//  Created by 王落凡 on 15/5/28.
//  Copyright (c) 2015年 王落凡. All rights reserved.
//

#import "ZQServiceAgencyListViewController.h"
#import "ZQWantEnrollViewController.h"
#import "ZQServiceAgencyTableViewCell.h"
#import "ZQServiceAgencyViewController.h"
#import "ZQNavigationViewController.h"

#define kControlMargin 5
#define kShadowRadius 0.5f

@interface ZQServiceAgencyViewController ()<UICollectionViewDataSource,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout> {
    NSArray* imageSourceArray;
}

@end

@implementation ZQServiceAgencyViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setTitle:@"服务机构"];
    [self setTableViewNeedLoadMore:NO];
    
    imageSourceArray = @[
                         [UIImage imageNamed:@"img_special"],[UIImage imageNamed:@"img_special"],[UIImage imageNamed:@"img_special"]
                         ];
    [self.tableView setTableHeaderView:[self createHeaderCollectionView]];
    return ;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    ZQServiceAgencyTableViewCell* cell = [tableView dequeueReusableCellWithIdentifier:@"ServiceAgencyTableViewCellIdentifier"];
    if(cell == nil) {
        cell = [[ZQServiceAgencyTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"ServiceAgencyTableViewCellIdentifier"];
    }
    
    [cell.logoImageView setImage:[UIImage imageNamed:@"img_special"]];
    [cell.methodLabel setText:@"上海市建筑节能项目专项扶持办法"];
    [cell.detailLabel setText:@"湖南卡X电子商务有限公司成立于2008年8月，公司秉持为客户创造价值这一核心理念，为各行业企业提供专业的移动整合营销方案。公司拥有全球领先的企业APP和微信APP的开发、推广、运营、发布、管理、统计技术，汇聚行业最丰富、最优秀且最具性价比的产品，同时兼有专业的移动营销运营团队，让客房以最低的成本切入移动互联网营销，以达到最佳的宣传、推评选、促销、快速提升品牌知名度效果，为企业构建全新的营销渠道与方式。"];
    
    return cell;
}

-(UIView*)createHeaderCollectionView {
    UIView* headerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.tableView.bounds.size.width, 60)];     //再调整
    
    UICollectionView* collectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(0, kControlMargin, headerView.bounds.size.width - kControlMargin, headerView.bounds.size.height - kControlMargin) collectionViewLayout:[[UICollectionViewFlowLayout alloc] init]];
    [collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:@"ServiceAgencyCollectionViewCellIdentifier"];
    [collectionView setBackgroundColor:[UIColor clearColor]];
    [headerView addSubview:collectionView];
    [collectionView setDelegate:self];
    [collectionView setDataSource:self];
    
    return headerView;
}

-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return imageSourceArray.count;
}

-(UICollectionViewCell*)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    UICollectionViewCell* cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"ServiceAgencyCollectionViewCellIdentifier" forIndexPath:indexPath];
    
    UIView* shadowView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, (collectionView.frame.size.width - (imageSourceArray.count + 1)) / imageSourceArray.count, collectionView.frame.size.height - 2*kControlMargin)];
    [shadowView setBackgroundColor:[UIColor colorWithRed:((CGFloat)226)/255 green:((CGFloat)227)/255 blue:((CGFloat)223)/255 alpha:1.0f]];
    
    UIImageView* imageView = [[UIImageView alloc] initWithFrame:CGRectMake(kShadowRadius,kShadowRadius,shadowView.bounds.size.width - 2*kShadowRadius,shadowView.bounds.size.height - 2*kShadowRadius)];
    [imageView setContentMode:UIViewContentModeScaleAspectFill];
    [imageView setImage:(UIImage *)imageSourceArray[indexPath.row]];
    [shadowView addSubview:imageView];
    
    [cell.contentView addSubview:shadowView];
    
    return cell;
}

-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    dispatch_async(dispatch_get_main_queue(), ^{
        ZQWantEnrollViewController* enrollController = [[ZQWantEnrollViewController alloc] init];
        [self presentViewController:[[ZQNavigationViewController alloc] initWithRootViewController:enrollController] animated:YES completion:^{
        }];
    });
    return ;
}

-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    return CGSizeMake((collectionView.frame.size.width - (imageSourceArray.count + 2) * kControlMargin) / imageSourceArray.count, collectionView.frame.size.height - 2*kControlMargin);
}

-(UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section {
    return UIEdgeInsetsMake(kControlMargin, kControlMargin, kControlMargin, 0);
}

-(void)toolBar:(ZQToolBar *)toolBar dataSourceForItem:(ZQToolItem *)toolItem itemIndex:(NSInteger)itemIndex {
    
    NSArray* leftSrc;
    switch (itemIndex) {
        case 0:
            break;
        case 1:
        {
            leftSrc = @[@"投融资服务",@"管理咨询",@"营销突破",@"供应链优化",@"人力资源及猎头规划",@"财务及税务筹划",
                        @"劳务派遣",@"企业战略及目标设计",@"研发创新",@"采购管理",@"上市辅导",@"项目资料申报",
                        @"法律服务",@"项目规划"];
        }
            break;
        case 2:
            break;
        default:
            break;
    }
    [toolItem.filterView addLeftSrouceWithArray:leftSrc RightSourceArray:nil];
    
    return ;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    ZQServiceAgencyListViewController* listController = [[ZQServiceAgencyListViewController alloc] init];
    dispatch_async(dispatch_get_main_queue(), ^{
        [self presentViewController:[[ZQNavigationViewController alloc] initWithRootViewController:listController] animated:YES completion:^{
        }];
    });
    return ;
}

@end
