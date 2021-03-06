//
//  ZQTenderResViewController.m
//  中企资源
//
//  Created by 王落凡 on 15/6/11.
//  Copyright (c) 2015年 王落凡. All rights reserved.
//

#import "ZQTenderResViewController.h"

#import "ZQNavigationViewController.h"
#import "ZQSpecialSupportTableViewCell.h"

#define kControlMargin 5
#define kShadowRadius 0.5f

@interface ZQTenderResViewController ()<UICollectionViewDelegate,UICollectionViewDataSource> {
    NSArray* imageSourceArray;
}

@end

@implementation ZQTenderResViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setTitle:@"招投标资源"];
    [self setTableViewNeedLoadMore:YES];
    
    imageSourceArray = @[
                         [UIImage imageNamed:@"special_1"],
                         [UIImage imageNamed:@"special_2"],
                         [UIImage imageNamed:@"special_3"]
                         ];
    [self.tableView setTableHeaderView:[self createHeaderCollectionView]];
    
    return ;
}

-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    ZQSpecialSupportTableViewCell* cell = [tableView dequeueReusableCellWithIdentifier:@"SpecialSupportTableViewCellIdentifier"];
    if(cell == nil) {
        cell = [[ZQSpecialSupportTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"SpecialSupportTableViewCellIdentifier"];
    }
    
    [cell.logoImageView setImage:[UIImage imageNamed:@"img_special"]];
    [cell.methodLabel setText:@"上海市建筑节能项目专项扶持办法"];
    [cell.detailLabel setText:@"湖南卡X电子商务有限公司成立于2008年8月，公司秉持为客户创造价值这一核心理念，为各行业企业提供专业的移动整合营销方案。公司拥有全球领先的企业APP和微信APP的开发、推广、运营、发布、管理、统计技术，汇聚行业最丰富、最优秀且最具性价比的产品，同时兼有专业的移动营销运营团队，让客房以最低的成本切入移动互联网营销，以达到最佳的宣传、推评选、促销、快速提升品牌知名度效果，为企业构建全新的营销渠道与方式。"];
    
    return cell;
}

-(void)tableView:(UITableView*)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    return ;
}

-(UIView*)createHeaderCollectionView {
    UIView* headerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.tableView.bounds.size.width, 60)];     //再调整
    UICollectionViewFlowLayout* flowLayout = [[UICollectionViewFlowLayout alloc] init];
    UICollectionView* collectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(0, kControlMargin, headerView.bounds.size.width - kControlMargin, headerView.bounds.size.height - kControlMargin) collectionViewLayout:flowLayout];
    
    [flowLayout setItemSize:CGSizeMake((collectionView.bounds.size.width - 4*kControlMargin) / 3, collectionView.bounds.size.height - 2*kControlMargin)];
    [flowLayout setMinimumInteritemSpacing:kControlMargin];
    [flowLayout setSectionInset:UIEdgeInsetsMake(0, kControlMargin, 0, 0)];
    
    [collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:@"PolicyInterpretTableViewCellIdentifier"];
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
    UICollectionViewCell* cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"PolicyInterpretTableViewCellIdentifier" forIndexPath:indexPath];
    
    UIView* shadowView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, (collectionView.frame.size.width - (imageSourceArray.count + 1)) / imageSourceArray.count, collectionView.frame.size.height - 2*kControlMargin)];
    [shadowView setBackgroundColor:[UIColor colorWithRed:((CGFloat)226)/255 green:((CGFloat)227)/255 blue:((CGFloat)223)/255 alpha:1.0f]];
    
    UIImageView* imageView = [[UIImageView alloc] initWithFrame:CGRectMake(kShadowRadius,kShadowRadius,shadowView.bounds.size.width - 2*kShadowRadius,shadowView.bounds.size.height - 2*kShadowRadius)];
    [imageView setContentMode:UIViewContentModeScaleAspectFill];
    [imageView setImage:(UIImage *)imageSourceArray[indexPath.row]];
    [shadowView addSubview:imageView];
    
    [cell.contentView addSubview:shadowView];
    
    return cell;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
