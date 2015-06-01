//
//  ZQEnterpriseResourceViewController.m
//  中企资源
//
//  Created by 王落凡 on 15/5/28.
//  Copyright (c) 2015年 王落凡. All rights reserved.
//

#import "ZQToolBar.h"
#import "ZQCheckBox.h"
#import "ZQEnterpriseTableViewCell.h"
#import "ZQNavigationViewController.h"
#import "ZQEnterpriseResourceViewController.h"
#import "ZQBatchSndReqInfoViewController.h"

#define kFilterViewHeight 40
#define kBottomViewHeight 60
#define kBottomControlMargin 10
#define kTableViewCellHeight 90

@interface ZQEnterpriseResourceViewController ()<UITableViewDataSource,UITableViewDelegate,ZQCheckBoxDelegate> {
    NSArray* _tableContentArray;
    ZQToolBar* filterView;
}

@end

@implementation ZQEnterpriseResourceViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setTitle:@"企业资源"];
    
    //顶部工具栏
    filterView = [[ZQToolBar alloc] initWithSuperView:self.view Styles:@[ZQToolBarStyleButton,ZQToolBarStyleSearchBar,ZQToolBarStyleButton] Text:@[@"按行业搜索",@"输入产品或服务",@"按地域搜索"]];
    [self.view addSubview:filterView];
    CGRect bottomViewFrame = [self addBottomToolBar];
    
    self.tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, kFilterViewHeight, self.view.frame.size.width, bottomViewFrame.origin.y - kFilterViewHeight) style:UITableViewStylePlain];
    [self.tableView setSeparatorStyle:UITableViewCellSeparatorStyleNone];
    [self.tableView setBackgroundColor:[UIColor clearColor]];
    [self.tableView setDelegate:self];
    [self.tableView setDataSource:self];
    [self.view addSubview:self.tableView];
    
    _tableContentArray = @[
                           @[@"img",@"湖南长沙卡X电子商务有限公司",@"供求资源",@"诚招各区域代理"],
                           @[@"img",@"广州方丈网络科技有限公司",@"商务合作资源",@"标题"],
                           @[@"img",@"湖南长沙卡X电子商务有限公司",@"供求资源",@"诚招各区域代理"],
                           @[@"img",@"湖南长沙卡X电子商务有限公司",@"供求资源",@"诚招各区域代理"],
                           ];
    
    return ;
}

-(CGRect)addBottomToolBar {

    //底部工具栏
    UIView* bottomView = [[UIView alloc] initWithFrame:CGRectMake(0, self.view.bounds.size.height - kBottomViewHeight - self.navigationController.navigationBar.bounds.size.height - [[UIApplication sharedApplication] statusBarFrame].size.height, self.view.frame.size.width, kBottomViewHeight)];
    [bottomView setBackgroundColor:[UIColor whiteColor]];
    [self.view addSubview:bottomView];
    
    //全选框
//    ZQNonHighlightedButton* selectedAll = [[ZQNonHighlightedButton alloc] initWithFrame:CGRectMake(kBottomControlMargin, kBottomControlMargin, 2*kFilterViewHeight, kFilterViewHeight)];
//    [selectedAll setTitle:@"全选" forState:UIControlStateNormal];
//    [selectedAll.titleLabel setFont:[UIFont systemFontOfSize:15.0f]];
//    [selectedAll setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
//    [selectedAll setImage:[UIImage imageNamed:@"fuxuank"] forState:UIControlStateNormal];
//    [selectedAll setImage:[UIImage imageNamed:@"fxk_gou"] forState:UIControlStateSelected];
//    [selectedAll.imageView setContentMode:UIViewContentModeScaleAspectFit];
//    [selectedAll addTarget:self action:@selector(selectedAllButtonPressed:) forControlEvents:UIControlEventTouchDown];
//    [selectedAll setImageEdgeInsets:UIEdgeInsetsMake(0, -kBottomControlMargin, 0, 0)];
////    [selectedAll setCenter:CGPointMake(selectedAll.center.x, bottomView.center.y)];
//    [bottomView addSubview:selectedAll];
    
    self.allCheckButton = [[ZQCheckBox alloc] initWithFrame:CGRectMake(kBottomControlMargin, kBottomControlMargin, 2*kFilterViewHeight, kFilterViewHeight) shouldFixFrame:NO];
    [self.allCheckButton setTitle:@"全选" forState:UIControlStateNormal];
    [self.allCheckButton.titleLabel setFont:[UIFont systemFontOfSize:15.0f]];
    [self.allCheckButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [self.allCheckButton setImageEdgeInsets:UIEdgeInsetsMake(0, -kBottomControlMargin, 0, 0)];
    [self.allCheckButton addTarget:self action:@selector(checkBoxChecked:) forControlEvents:UIControlEventTouchDown];
    [bottomView addSubview:self.allCheckButton];
    
//    //批量发送需求信息
    UIImage* btnImage = [UIImage imageNamed:@"plfsxqxx"];
    UIButton* sendOfferBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [sendOfferBtn setImage:btnImage forState:UIControlStateNormal];
    [sendOfferBtn setFrame:CGRectMake(bottomView.frame.size.width - kBottomControlMargin - btnImage.size.width / 2, (bottomView.bounds.size.height - btnImage.size.height / 2) / 2, btnImage.size.width / 2, btnImage.size.height / 2)];
    [sendOfferBtn addTarget:self action:@selector(sendOfferBtnPressed:) forControlEvents:UIControlEventTouchUpInside];
    [bottomView addSubview:sendOfferBtn];
    
    return bottomView.frame;
}

-(void)sendOfferBtnPressed:(UIButton*)sender {
    ZQBatchSndReqInfoViewController* batchViewController = [[ZQBatchSndReqInfoViewController alloc] init];
    [self presentViewController:[[ZQNavigationViewController alloc] initWithRootViewController:batchViewController] animated:YES completion:^{
    }];
    return ;
}

-(void)checkBoxChecked:(ZQCheckBox*)sender {
    for (NSIndexPath* indexPath in self.tableView.indexPathsForVisibleRows) {
        ZQEnterpriseTableViewCell* cell = (ZQEnterpriseTableViewCell*)[self.tableView cellForRowAtIndexPath:indexPath];
        [cell setChecked:sender.isSelected];
    }
    return ;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _tableContentArray.count;
}

-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    ZQEnterpriseTableViewCell* cell = [tableView dequeueReusableCellWithIdentifier:@"ZQEnterpriseTableViewCellIdentifier"];
    if(cell == nil)
        cell = [[ZQEnterpriseTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"ZQEnterpriseTableViewCellIdentifier"];
    
    [cell.logoImageView setImage:[UIImage imageNamed:_tableContentArray[indexPath.row][0]]];
    [cell.companyNameLabel setText:_tableContentArray[indexPath.row][1]];
    [cell setsubInfoLabelTextWithDiscription:_tableContentArray[indexPath.row][2] ContentText:_tableContentArray[indexPath.row][3]];
    [((ZQCheckBox*)cell.checkButton) setDelegate:self];
    
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return kTableViewCellHeight;
}

-(void)checkBox:(ZQCheckBox *)checkBox isSelected:(BOOL)isSelected {
    BOOL bAllChecked = YES;
    
    if(isSelected) {
        for (NSIndexPath* indexPath in self.tableView.indexPathsForVisibleRows) {
            ZQEnterpriseTableViewCell* cell = (ZQEnterpriseTableViewCell*)[self.tableView cellForRowAtIndexPath:indexPath];
            if(![cell checked])
                bAllChecked = NO;
        }
        
        [self.allCheckButton setSelected:bAllChecked];
    }else {
        for (NSIndexPath* indexPath in self.tableView.indexPathsForVisibleRows) {
            ZQEnterpriseTableViewCell* cell = (ZQEnterpriseTableViewCell*)[self.tableView cellForRowAtIndexPath:indexPath];
            if([cell checked])
                bAllChecked = NO;
        }
        
        [self.allCheckButton setSelected:bAllChecked];
    }
    

        return ;
}

@end
