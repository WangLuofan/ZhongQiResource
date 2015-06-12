//
//  ZQEnterpriseIntroductionViewController.m
//  中企资源
//
//  Created by 王落凡 on 15/6/1.
//  Copyright (c) 2015年 王落凡. All rights reserved.
//

#import "ZQLoadMoreView.h"
#import "ZQNavigationViewController.h"
#import "ZQBaseRscReplyViewController.h"
#import "ZQEnterpriseEvaluateViewController.h"
#import "ZQEnterpriseIntroductionViewController.h"
#import "ZQEnterpriseIntroductionTableViewCell.h"
#import "ZQEntRscDistributeTableViewCell.h"

#define kControlMargin 10
#define kEntRscDistributeTableViewCellHeight 150

@interface ZQEnterpriseIntroductionViewController () <UITableViewDataSource,UITableViewDelegate,ZQEnterpriseIntroductionTableViewCellDelegate,ZQEntRscDistributeTableViewCellDelegate> {
}

@end

@implementation ZQEnterpriseIntroductionViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIImageView* adImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"smbanner"]];
    [adImageView setFrame:CGRectMake(0, 0, self.view.bounds.size.width, adImageView.image.size.height / 2)];
    [self.view addSubview:adImageView];
    
    self.tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, adImageView.bounds.size.height, self.view.bounds.size.width, self.view.bounds.size.height - adImageView.bounds.size.height - kNavStatusHeight) style:UITableViewStyleGrouped];
    [self.tableView setSeparatorStyle:UITableViewCellSeparatorStyleNone];
    [self.tableView setDelegate:self];
    [self.tableView setDataSource:self];
    [self.view addSubview:self.tableView];
    
    UIButton* loadMore = [UIButton buttonWithType:UIButtonTypeCustom];
    [loadMore setFrame:CGRectMake(0, 0, self.tableView.bounds.size.width, 3*kControlMargin)];
    [loadMore setTitle:@"加载更多..." forState:UIControlStateNormal];
    [loadMore setTitleColor:[UIColor lightGrayColor] forState:UIControlStateNormal];
    [loadMore setTitleColor:[UIColor blackColor] forState:UIControlStateHighlighted];
    [loadMore addTarget:self action:@selector(loadMoreButtonPressed:) forControlEvents:UIControlEventTouchUpInside];
    [self.tableView setTableFooterView:loadMore];
    
    return ;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 2;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if(section == 0)
        return 1;
    return 2;
}

-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell* cell = nil;
    if(indexPath.section == 0) {
        cell = [tableView dequeueReusableCellWithIdentifier:@"EnterpriseIntroductionCellIdentifier"];
        if(cell == nil) {
            cell = [[ZQEnterpriseIntroductionTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"EnterpriseIntroductionCellIdentifier"];
            [((ZQEnterpriseIntroductionTableViewCell*)cell) setDelegate:self];
        }
        [((ZQEnterpriseIntroductionTableViewCell*)cell) setIntroductionLabelText:@"湖南卡X电子商务有限公司成立于2008年8月，公司秉持为客户创造价值这一核心理念，为各行业企业提供专业的移动整合营销方案。公司拥有全球领先的企业APP和微信APP的开发、推广、运营、发布、管理、统计技术，汇聚行业最丰富、最优秀且最具性价比的产品，同时兼有专业的移动营销运营团队，让客房以最低的成本切入移动互联网营销，以达到最佳的宣传、推评选、促销、快速提升品牌知名度效果，为企业构建全新的营销渠道与方式。"];
        [((ZQEnterpriseIntroductionTableViewCell*)cell).logoImageView setImage:[UIImage imageNamed:@"img"]];
        [((ZQEnterpriseIntroductionTableViewCell*)cell) setEnterpriseInfoWithPhone:@"0731-88888889" Address:@"湖南省长沙市中电科技园" Score:4.8];
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

-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    UIView* headerView = [[UIView alloc] initWithFrame:CGRectMake(5, 5, self.view.bounds.size.width, 20)];
    if(section == 1) {
        UIImageView* imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"cnxh"]];
        [imageView setFrame:CGRectMake(kControlMargin, 0, imageView.image.size.width / 2, imageView.image.size.height / 2)];
        [imageView setCenter:CGPointMake(imageView.center.x, headerView.center.y)];
        [headerView addSubview:imageView];
        
        UILabel* label = [[UILabel alloc] initWithFrame:CGRectMake(kControlMargin + imageView.frame.origin.x + imageView.frame.size.width, imageView.frame.origin.y, 150, headerView.frame.size.height)];
        [label setText:@"企业资源信息发布"];
        [label setFont:[UIFont systemFontOfSize:14.0f]];
        [headerView addSubview:label];
    }else {
        UIImageView* imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"cnxh"]];
        [imageView setFrame:CGRectMake(kControlMargin, 0, imageView.image.size.width / 2, imageView.image.size.height / 2)];
        [imageView setCenter:CGPointMake(imageView.center.x, headerView.center.y)];
        [headerView addSubview:imageView];
        
        UILabel* label = [[UILabel alloc] initWithFrame:CGRectMake(kControlMargin + imageView.frame.origin.x + imageView.frame.size.width, imageView.frame.origin.y, 150, headerView.frame.size.height)];
        [label setText:@"企业简介"];
        [label setFont:[UIFont systemFontOfSize:14.0f]];
        [headerView addSubview:label];
    }
    
    return headerView;
}

-(UIView*)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section {
    return nil;
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 25;
}

-(CGFloat) tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    return 0.1;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    if(indexPath.section == 0)
        return [ZQEnterpriseIntroductionTableViewCell cellHeight];
    return kEntRscDistributeTableViewCellHeight;
}

-(void)loadMoreButtonPressed:(UIButton*)sender {
    ZQLoadMoreView* loadMore = [[ZQLoadMoreView alloc] initWithFrame:sender.bounds];
    [self.tableView setTableFooterView:loadMore];
    return ;
}

-(void)ZQEnterpriseIntroductionButtonPressed:(NSInteger)buttonIndex {
    switch (buttonIndex) {
        case 0:
        {
            ZQEnterpriseEvaluateViewController* commentViewController = [[ZQEnterpriseEvaluateViewController alloc] init];
            [self presentViewController:[[ZQNavigationViewController alloc] initWithRootViewController:commentViewController] animated:YES completion:^{
                [commentViewController commentWithUserInfoDict:@{
                                                                @"header":[UIImage imageNamed:@"tx2"],
                                                                @"enterprise":@"湖南讯德彩利科技有限公司",
                                                                @"userName":@"帅帅",
                                                                @"commentContent":@"不错的资源管理平台!!!不错的资源管理平台!!!不错的资源管理平台!!!不错的资源管理平台!!!不错的资源管理平台!!!不错的资源管理平台!!!",
                                                                @"dateTime":@"2015-05-25    18:03:29"
                                                                 }];
            }];
        }
            break;
        case 1:
            break;
        case 2:
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
        {
            ZQBaseRscReplyViewController* replyController = [[ZQBaseRscReplyViewController alloc] init];
            [replyController setTitle:[entRscDistCell offerResourceTitle] CommentContent:entRscDistCell.detailLabel.text];
            [self presentViewController:[[ZQNavigationViewController alloc] initWithRootViewController:replyController] animated:YES completion:^{
            }];
        }
            break;
        case 2:
            break;
        case 3:
            break;
        default:
            break;
    }
}

@end
