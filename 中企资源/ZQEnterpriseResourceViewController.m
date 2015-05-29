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
#import "ZQEnterpriseResourceViewController.h"

#define kFilterViewHeight 40
#define kBottomViewHeight 60
#define kBottomControlMargin 10
#define kTableViewCellHeight 90

@interface ZQEnterpriseResourceViewController ()<UITableViewDataSource,UITableViewDelegate> {
    NSArray* _tableContentArray;
}

@end

@implementation ZQEnterpriseResourceViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setTitle:@"企业资源"];
    
    //顶部工具栏
    ZQToolBar* filterView = [[ZQToolBar alloc] initWithSuperView:self.view Styles:@[ZQToolBarStyleButton,ZQToolBarStyleSearchBar,ZQToolBarStyleButton] Text:@[@"按行业搜索",@"输入产品或服务",@"按地域搜索"]];
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
    
    ZQCheckBox* checkBox = [[ZQCheckBox alloc] initWithFrame:CGRectMake(kBottomControlMargin, kBottomControlMargin, 2*kFilterViewHeight, kFilterViewHeight) shouldFixFrame:NO];
    [checkBox setTitle:@"全选" forState:UIControlStateNormal];
    [checkBox.titleLabel setFont:[UIFont systemFontOfSize:15.0f]];
    [checkBox setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [checkBox setImageEdgeInsets:UIEdgeInsetsMake(0, -kBottomControlMargin, 0, 0)];
    [bottomView addSubview:checkBox];
    
//    //批量发送需求信息
    UIImage* btnImage = [UIImage imageNamed:@"plfsxqxx"];
    UIButton* sendOfferBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [sendOfferBtn setImage:btnImage forState:UIControlStateNormal];
    [sendOfferBtn setFrame:CGRectMake(bottomView.frame.size.width - kBottomControlMargin - btnImage.size.width / 2, (bottomView.bounds.size.height - btnImage.size.height / 2) / 2, btnImage.size.width / 2, btnImage.size.height / 2)];
//    [sendOfferBtn setCenter:CGPointMake(sendOfferBtn.center.x, bottomView.center.y)];
    [bottomView addSubview:sendOfferBtn];
    
    return bottomView.frame;
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
    
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return kTableViewCellHeight;
}

@end
