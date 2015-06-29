//
//  ZQServiceAgencyListViewController.m
//  中企资源
//
//  Created by 王落凡 on 15/6/16.
//  Copyright (c) 2015年 王落凡. All rights reserved.
//

#import "ZQBaseSocialShare.h"
#import "ZQMediaReportTableViewCell.h"
#import "ZQNavigationViewController.h"
#import "ZQServiceAgencySuccessExampleViewController.h"
#import "ZQEntRscDistributeTableViewCell.h"
#import "ZQServiceAgencyListViewController.h"

#define kEntRscDistributeTableViewCellHeight 150
#define kMediaReportTableViewCellHeight 350
#define kTableViewCellHeight 100
#define kTableHeaderViewHeight 25
#define kControlMargin 5

@interface ZQServiceAgencyListViewController ()<UICollectionViewDataSource,UICollectionViewDelegate,ZQEntRscDistributeTableViewCellDelegate> {
    NSArray* agencyProductArray;
    UIImageView* headerImageView;
}

@end

@implementation ZQServiceAgencyListViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setTitle:@"效果咨询"];
    [self initTableViewWithTableViewStyle:UITableViewStyleGrouped];
    [self setViewControllerNeedFilterView:NO];
    [self setTableViewNeedLoadMore:YES];
    
    [self setAgencyProductWithArray:@[
                                      @[@"绩效突破训练营",@"jxtpxly"],
                                      @[@"效果训练",@"xgxl"],
                                      @[@"效果投资管理",@"xggl"]
                                      ]];
    
    [self setHeaderImageViewImage:[UIImage imageNamed:@"xgbanner"]];
}

-(void)setHeaderImageViewImage:(UIImage *)image {
    if(headerImageView == nil)
        headerImageView = [[UIImageView alloc] initWithImage:image];
    else
        [headerImageView setImage:image];
    
    [headerImageView setFrame:CGRectMake(0, 0, self.tableView.bounds.size.width, headerImageView.image.size.height / 2)];
    
    [self.tableView beginUpdates];
    [self.tableView setTableHeaderView:headerImageView];
    [self.tableView endUpdates];
    
    return ;
}

-(void)setAgencyProductWithArray:(NSArray *)productArray {
    agencyProductArray = [NSArray arrayWithArray:productArray];
    [self.tableView reloadRowsAtIndexPaths:@[[NSIndexPath indexPathForRow:0 inSection:0]] withRowAnimation:UITableViewRowAnimationAutomatic];
    return ;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if(section == 0 || section == 2)
        return 1;
    return 2;
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 4;
}

-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell* cell = nil;
    if(indexPath.section == 0) {
        cell = [tableView dequeueReusableCellWithIdentifier:@"ServiceAgencyProductTableViewCellIdentifier"];
        if(cell == nil) {
            cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault   reuseIdentifier:@"ServiceAgencyProductTableViewCellIdentifier"];
            [cell setBackgroundColor:[UIColor clearColor]];
        }
    
        UICollectionViewFlowLayout* flowLayout = [[UICollectionViewFlowLayout alloc] init];
        [flowLayout setMinimumInteritemSpacing:kControlMargin];
        [flowLayout setSectionInset:UIEdgeInsetsMake(kControlMargin, kControlMargin, kControlMargin, kControlMargin)];
        [flowLayout setItemSize:CGSizeMake((cell.contentView.bounds.size.width - (agencyProductArray.count + 3)*kControlMargin ) / agencyProductArray.count, kTableViewCellHeight - 2*kControlMargin)];
        
        UICollectionView* collectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(0, 0, cell.contentView.bounds.size.width, kTableViewCellHeight) collectionViewLayout:flowLayout];
        [collectionView setBackgroundColor:[UIColor clearColor]];
        [collectionView registerClass:[UICollectionViewCell class]  forCellWithReuseIdentifier:@"ServiceAgencyProductCollectionViewCellIdentifier"];
        [collectionView setDelegate:self];
        [collectionView setDataSource:self];
        [cell.contentView addSubview:collectionView];
    }else if(indexPath.section == 1){
        cell = [tableView dequeueReusableCellWithIdentifier:@"ServiceAgencySuccessfulExampleTableViewCellIdentifier"];
        
        if(cell == nil) {
            cell = [[ZQServiceAgencySuccessExampleTableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"ServiceAgencySuccessfulExampleTableViewCellIdentifier"];
            
            [((ZQServiceAgencySuccessExampleTableViewCell*)cell).headerImageView setImage:[UIImage imageNamed:@"img03"]];
            [((ZQServiceAgencySuccessExampleTableViewCell*)cell).titleLabel setText:@"羽凌贸易合作商一"];
            [((ZQServiceAgencySuccessExampleTableViewCell*)cell).detailLabel setText:@"羽凌贸易，做有萍乡烙印的电商品牌!...这里是一个任由你发挥创造的平台，这里所需要的仅仅是你的热忱写才智，诚邀加入萍乡电子商务创业园"];
        }
    }else if(indexPath.section == 2){
        cell = [tableView dequeueReusableCellWithIdentifier:@"ServiceAgencyMediaReportTableViewCellIdentifier"];
        
        if(cell == nil)
            cell = [[ZQMediaReportTableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"ServiceAgencyMediaReportTableViewCellIdentifier"];
        
        [((ZQMediaReportTableViewCell*)cell).headerImageView setImage:[UIImage imageNamed:@"img03"]];
        [((ZQMediaReportTableViewCell*)cell).titleLabel setText:@"羽凌贸易合作商一"];
        [((ZQMediaReportTableViewCell*)cell).detailLabel setText:@"羽凌贸易，做有萍乡烙印的电商品牌!...这里是一个任由你发挥创造的平台，这里所需要的仅仅是你的热忱写才智，诚邀加入萍乡电子商务创业园"];
        [((ZQMediaReportTableViewCell*)cell) setReportContent:@"                                效果咨询\r\n效果咨询是谁?\r\n——以企业目标达成、行动实现、效果显着改善、利润突出放大为必达使命的中国专业咨询机构。效果咨询的切入点在哪里？\r\n    ——永远是：企业的目标！\r\n效果咨询的价值观：\r\n    ——用绩效衡量，对效果负责\r\n用绩效衡量释义：效果咨询存在的价值，不是向客户提供一大堆没有实际意义的改善建议或报告，而是通过简单有效的方法促进客户绩效改善和提升，并通过数字可以量化的绩效（销售收入、利润、现金流、QCD目标等）体现客户服务的效果，以为客户创造的价值体现效果咨询机构存在的意义。"];
        [((ZQMediaReportTableViewCell*)cell) setRatingScore:4.8];
        [((ZQMediaReportTableViewCell*)cell) setAttentionCount:889];
    }else {
        cell = [tableView dequeueReusableCellWithIdentifier:@"EnterpriseResourceInfoDistributionCellIdentifier"];
        if(cell == nil) {
            cell = [[ZQEntRscDistributeTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"EnterpriseResourceInfoDistributionCellIdentifier"];
            [((ZQEntRscDistributeTableViewCell*)cell) setDelegate:self];
        }
        [((ZQEntRscDistributeTableViewCell*)cell) setOfferResourceTitle:@"资源标题"];
        [((ZQEntRscDistributeTableViewCell*)cell).detailLabel setText:@"湖南卡X电子商务有限公司成立于2008年8月，公司秉持为客户创造价值这一核心理念，为各行业企业提供专业的移动整合营销方案。公司拥有全球领先的企业APP和微信APP的开发、推广、运营、发布、管理、统计技术，汇聚行业最丰富、最优秀且最具性价比的产品，同时兼有专业的移动营销运营团队，让客房以最低的成本切入移动互联网营销，以达到最佳的宣传、推评选、促销、快速提升品牌知名度效果，为企业构建全新的营销渠道与方式。"];
    }
    
    return cell;
}

-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return agencyProductArray.count;
}

-(UICollectionViewCell*)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    UICollectionViewCell* cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"ServiceAgencyProductCollectionViewCellIdentifier" forIndexPath:indexPath];
    [cell setBackgroundColor:[UIColor clearColor]];
    
    UIImageView* imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:((NSString *)agencyProductArray[indexPath.row][1])]];
    [imageView setFrame:CGRectMake(kControlMargin, kControlMargin, imageView.image.size.width / 2, imageView.image.size.height / 2)];
    [imageView setCenter:CGPointMake(cell.contentView.frame.size.width / 2, imageView.center.y)];
    [cell.contentView addSubview:imageView];
    
    UILabel* titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, imageView.frame.origin.y + imageView.frame.size.height + kControlMargin, 0, 0)];
    [titleLabel setText:((NSString *)agencyProductArray[indexPath.row][0])];
    [titleLabel setTextColor:[UIColor blackColor]];
    [titleLabel setFont:[UIFont systemFontOfSize:12.0f]];
    [titleLabel sizeToFit];
    [titleLabel setCenter:CGPointMake(imageView.center.x, titleLabel.center.y)];
    [cell.contentView addSubview:titleLabel];
    
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    if(indexPath.section == 2)
        return kMediaReportTableViewCellHeight;
    if(indexPath.section == 3)
        return kEntRscDistributeTableViewCellHeight;
    
    return [super tableView:tableView heightForRowAtIndexPath:indexPath];
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return kTableHeaderViewHeight;
}

-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    return 1;
}

-(UIView*)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    UIView* headerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, tableView.bounds.size.width, kTableHeaderViewHeight)];
    
    UIButton* leftIndicatorButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [leftIndicatorButton setImage:[UIImage imageNamed:@"cnxh"] forState:UIControlStateNormal];
    [leftIndicatorButton setFrame:CGRectMake(0, 0, headerView.bounds.size.width / 2, leftIndicatorButton.imageView.image.size.height / 2)];
    [leftIndicatorButton setContentHorizontalAlignment:UIControlContentHorizontalAlignmentLeft];
    [leftIndicatorButton.imageView setContentMode:UIViewContentModeScaleAspectFit];
    [leftIndicatorButton setEnabled:NO];
    [leftIndicatorButton setCenter:CGPointMake(leftIndicatorButton.center.x, headerView.bounds.size.height / 2)];
    [leftIndicatorButton.titleLabel setFont:[UIFont systemFontOfSize:12.0f]];
    [leftIndicatorButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [headerView addSubview:leftIndicatorButton];
    
    UIButton* showMoreButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [showMoreButton setImage:[UIImage imageNamed:@"ckgd"] forState:UIControlStateNormal];
    [showMoreButton setTitleColor:[UIColor lightGrayColor] forState:UIControlStateNormal];
    [showMoreButton setTitleColor:[UIColor blackColor] forState:UIControlStateHighlighted];
    [showMoreButton setTitle:@"查看更多" forState:UIControlStateNormal];
    [showMoreButton.titleLabel setFont:[UIFont systemFontOfSize:12.0f]];
    [showMoreButton setFrame:CGRectMake(leftIndicatorButton.frame.origin.x + leftIndicatorButton.frame.size.width, leftIndicatorButton.frame.origin.y, leftIndicatorButton.frame.size.width - kControlMargin, leftIndicatorButton.frame.size.height)];
    [showMoreButton addTarget:self action:@selector(showMorePressed:) forControlEvents:UIControlEventTouchUpInside];
    [showMoreButton.imageView setContentMode:UIViewContentModeScaleAspectFit];
    //        [showMoreButton setContentHorizontalAlignment:UIControlContentHorizontalAlignmentRight];
    [showMoreButton setImageEdgeInsets:UIEdgeInsetsMake(0, showMoreButton.frame.size.width - showMoreButton.imageView.image.size.width, 0, 0)];
    [showMoreButton setTitleEdgeInsets:UIEdgeInsetsMake(0, showMoreButton.imageView.image.size.width, 0, 0)];
    [headerView addSubview:showMoreButton];
    
    NSString* indicatorTitle = @"";
    if(section == 0) {
        indicatorTitle = @"机构产品";
    } else if(section == 1) {
        indicatorTitle = @"成功案例";
    }else if(section == 2) {
        indicatorTitle = @"媒体报道";
        [showMoreButton removeFromSuperview];
    }else {
        indicatorTitle = @"企业资源信息发布";
    }
    
    showMoreButton.tag = section;
    [leftIndicatorButton setTitle:indicatorTitle forState:UIControlStateNormal];
    return headerView;
}

-(void)showMorePressed:(UIButton*)sender {
    switch (sender.tag) {
        case 0:
            break;
        case 1:
        {
            ZQServiceAgencySuccessExampleViewController* serviceSuccessExampleController = [[ZQServiceAgencySuccessExampleViewController alloc] init];
            dispatch_async(dispatch_get_main_queue(), ^{
                [self presentViewController:[[ZQNavigationViewController alloc] initWithRootViewController:serviceSuccessExampleController] animated:YES completion:^{
                }];
            });
        }
            break;
        default:
            break;
    }
    return ;
}

-(void)tableViewCell:(ZQEntRscDistributeTableViewCell *)entRscDistCell buttonPressedAtIndex:(NSInteger)atIndex {
    switch (atIndex) {
        case 0:
            break;
        case 1:
            break;
        case 2:
            break;
        case 3:
        {
            [ZQBaseSocialShare consturctPublishContentWithContent:nil image:nil title:nil url:nil description:nil];
        }
            break;
        default:
            break;
    }
}

@end
