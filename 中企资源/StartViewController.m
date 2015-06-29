//
//  StartViewController.m
//  中企资源
//
//  Created by 王落凡 on 15/5/26.
//  Copyright (c) 2015年 王落凡. All rights reserved.
//

#import "ZQCollectionContentView.h"
#import "ZQInfiniteScrollView.h"
#import "StartViewController.h"
#import "ZQRecommendTableViewCell.h"
#import "ZQServiceAgencyViewController.h"
#import "ZQEnterpriseResourceViewController.h"
#import "ZQDistrictResourceViewController.h"
#import "ZQTenderResViewController.h"
#import "ZQSpecialSupportViewController.h"
#import "ZQPolicyInterpretViewController.h"
#import "ZQDistrictPostViewController.h"
#import "ZQNavigationViewController.h"

#define kTopScrollViewHeight 180
#define kFunctionModuleHeight 200
#define kLoginButtonHeight 30
#define kTableViewCellHeight 70
#define kRecommendTableViewHeight kTableViewCellHeight * 3 + kLoginButtonHeight

@interface StartViewController ()<UIScrollViewDelegate,UITableViewDataSource,UITableViewDelegate> {
    UIScrollView* _contentScrollView;
    ZQInfiniteScrollView* _imageScrollView;
    UITableView* _recommendTableView;
    NSArray* tableViewContentArray;
}

@end

@implementation StartViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setTitle:@"中企资源管理平台"];
    
    _contentScrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, self.navigationController.view.frame.size.height)];
    [_contentScrollView setBackgroundColor:[UIColor colorWithRed:((CGFloat)231)/255 green:((CGFloat)232)/255 blue:((CGFloat)234)/255 alpha:1.0f]];
    [_contentScrollView setShowsHorizontalScrollIndicator:NO];
    [_contentScrollView setShowsVerticalScrollIndicator:NO];
    [self.view addSubview:_contentScrollView];
    
    [self initCollectionContent:@[
                     @[@"企业资源",@"qyzy"],
                     @[@"商圈资源",@"sqzy"],
                     @[@"专项扶持",@"zxfc"],
                     @[@"服务机构",@"fwjg"],
                     @[@"政策解读",@"zcjd"],
                     @[@"招投标资源",@"ztbzy"]
                     ]];
    
    tableViewContentArray = @[
                              @[@"img01",@"供求资源:整合联盟网",@"整合联盟网是中国资源整合第一官网,是资源整合嵘老师话茬下盛世纵横面向中国民营企业开展的资源整合五大平台之一。"],
                              @[@"img02",@"重工业行业商圈:中联重科",@"阿里巴巴商业圈，为您找到766个中联重科商机、中联重科经验交流、中联重科干货分享。在这里您还可以发现专业的中联重科商友圈子。"],
                              @[@"img03",@"高新技术成果转化财政专项资金扶持",@"阿里巴巴商业圈，为您找到766个中联重科商机、中联重科经验交流、中联重科干货分享。在这里您还可以发现专业的中联重科商友圈子。"]
                              ];
    [self initScrollViews];
    
    [self initCollectionViewWithFrame:CGRectMake(0, _imageScrollView.frame.origin.y +kTopScrollViewHeight + kLoginButtonHeight, self.view.bounds.size.width, kFunctionModuleHeight) cellIdentifier:@"ZQCollectionViewIndexCellIdentifier" superView:_contentScrollView];
    
    [self initLoginButton];
    [self initRecommendModule];
    
    [_contentScrollView setContentSize:CGSizeMake(0, _recommendTableView.frame.origin.y + _recommendTableView.frame.size.height + kNavStatusHeight)];
    return ;
}

-(void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [_imageScrollView resumeScrollViewAutoScroll];
    
    return ;
}

-(void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    [_imageScrollView setScrollViewNeedsAutoScrollWithTimeInterval:0.0f];
    
    return ;
}

#pragma mark - 添加全部的子控制器
-(void)addAllChildViewControllers {
    
    ZQNavigationViewController* nav1 = [[ZQNavigationViewController alloc] initWithRootViewController:[[ZQEnterpriseResourceViewController alloc] init]];
    ZQNavigationViewController* nav2 = [[ZQNavigationViewController alloc] initWithRootViewController:[[ZQDistrictResourceViewController alloc] init]];
    ZQNavigationViewController* nav3 = [[ZQNavigationViewController alloc] initWithRootViewController:[[ZQSpecialSupportViewController alloc] init]];
    ZQNavigationViewController* nav4 = [[ZQNavigationViewController alloc] initWithRootViewController:[[ZQServiceAgencyViewController alloc] init]];
    ZQNavigationViewController* nav5 = [[ZQNavigationViewController alloc] initWithRootViewController:[[ZQPolicyInterpretViewController alloc] init]];
    ZQNavigationViewController* nav6 = [[ZQNavigationViewController alloc] initWithRootViewController:[[ZQTenderResViewController alloc] init]];
    [self addChildViewControllersWithArray:@[nav1,nav2,nav3,nav4,nav5,nav6]];
    
    return ;
}

#pragma mark - 添加功能模块
-(void)initFunctionModule {
    
//    UICollectionViewFlowLayout* flowLayout = [[UICollectionViewFlowLayout alloc] init];
//    [flowLayout setScrollDirection:UICollectionViewScrollDirectionVertical];
//    
//    _collectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(0, _imageScrollView.frame.origin.y +kTopScrollViewHeight + kLoginButtonHeight, self.view.bounds.size.width, kFunctionModuleHeight) collectionViewLayout:flowLayout];
//    [_collectionView setBackgroundColor:[UIColor whiteColor]];
//    [_collectionView setDataSource:self];
//    [_collectionView setDelegate:self];
//    [_collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:@"ZQCollectionViewIndexCellIdentifier"];
//    [_contentScrollView addSubview:_collectionView];
    
    return ;
}

#pragma mark - 添加智能推荐列表
-(void)initRecommendModule {
    _recommendTableView = [[UITableView alloc] initWithFrame:CGRectMake(0, self._collectionView.frame.origin.y + self._collectionView.frame.size.height, self.view.bounds.size.width, kRecommendTableViewHeight) style:UITableViewStylePlain];
    [_recommendTableView setSeparatorStyle:UITableViewCellSeparatorStyleNone];
    [_recommendTableView setBackgroundColor:[UIColor clearColor]];
    [_recommendTableView setDelegate:self];
    [_recommendTableView setDataSource:self];
    [_contentScrollView addSubview:_recommendTableView];
    
    UIView* headerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, _recommendTableView.frame.size.width, kLoginButtonHeight)];
    [headerView setBackgroundColor:[UIColor colorWithRed:((CGFloat)231)/255 green:((CGFloat)232)/255 blue:((CGFloat)234)/255 alpha:1.0f]];
    
    //猜你喜欢 按钮
    UIButton* guessButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [guessButton setFrame:CGRectMake(-30, 5, headerView.frame.size.width / 2, kLoginButtonHeight - 10)];
    [guessButton setTitle:@"猜你喜欢" forState:UIControlStateNormal];
    [guessButton setEnabled:NO];
    [guessButton.imageView setContentMode:UIViewContentModeScaleAspectFit];
    [guessButton setImage:[UIImage imageNamed:@"cnxh"] forState:UIControlStateNormal];
    [guessButton.titleLabel setFont:[UIFont systemFontOfSize:12.0f]];
    [guessButton setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
    [guessButton setTitleColor:[UIColor blackColor] forState:UIControlStateHighlighted];
    [headerView addSubview:guessButton];
    
    //查看更多 按钮
    UIButton* moreButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [moreButton setFrame:CGRectMake(guessButton.frame.size.width, 5, guessButton.frame.size.width, guessButton.frame.size.height)];
    [moreButton setTitle:@"查看更多" forState:UIControlStateNormal];
    [moreButton.imageView setContentMode:UIViewContentModeScaleAspectFit];
    [moreButton setImage:[UIImage imageNamed:@"ckgd"] forState:UIControlStateNormal];
    [moreButton.titleLabel setFont:[UIFont systemFontOfSize:12.0f]];
    [moreButton setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
    [moreButton setTitleColor:[UIColor blackColor] forState:UIControlStateHighlighted];
    [moreButton setImageEdgeInsets:UIEdgeInsetsMake(0, moreButton.bounds.size.width * 4 / 5, 0, 0)];
    [moreButton addTarget:self action:@selector(moreButtonPressed:) forControlEvents:UIControlEventTouchUpInside];
    [headerView addSubview:moreButton];
    
    [_recommendTableView setTableHeaderView:headerView];
    
    return ;
}

#pragma mark - 添加登陆/注册按钮
-(void)initLoginButton {
    UIView* bottomView = [[UIView alloc] initWithFrame:CGRectMake(0, _imageScrollView.frame.origin.y+_imageScrollView.frame.size.height, self.view.bounds.size.width, kLoginButtonHeight)];
    [bottomView setBackgroundColor:[UIColor colorWithRed:((CGFloat)241)/255 green:((CGFloat)239)/255 blue:((CGFloat)239)/255 alpha:1.0f]];
    [_contentScrollView addSubview:bottomView];
    
    //登陆按钮
    UIButton* loginButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [loginButton setFrame:CGRectMake(-20, 5, 150, kLoginButtonHeight - 10)];
    [loginButton setTitle:@"登陆/注册" forState:UIControlStateNormal];
    [loginButton.titleLabel setFont:[UIFont systemFontOfSize:12.0f]];
    [loginButton setTitleColor:[UIColor lightGrayColor] forState:UIControlStateNormal];
    [loginButton setTitleColor:[UIColor grayColor] forState:UIControlStateHighlighted];
    [loginButton setImage:[UIImage imageNamed:@"login"] forState:UIControlStateNormal];
    [loginButton.imageView setContentMode:UIViewContentModeScaleAspectFit];
    [bottomView addSubview:loginButton];
}

#pragma mark - 添加滚动条和分页控件
-(void)initScrollViews {
    UIView* bottomView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, kTopScrollViewHeight)];
    [_contentScrollView addSubview:bottomView];
    
    _imageScrollView = [[ZQInfiniteScrollView alloc] initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, kTopScrollViewHeight)];
    [_imageScrollView setScrollViewNeedsAutoScrollWithTimeInterval:2.0f];
    [bottomView addSubview:_imageScrollView];
    
    [self addNavigationImageWithName:@[@"1",@"2",@"3",@"4",@"5"]];
    
    return ;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)moreButtonPressed:(UIButton*)sender {
    ZQDistrictResourceViewController* distController = [[ZQDistrictResourceViewController alloc] init];
    dispatch_async(dispatch_get_main_queue(), ^{
        [self.tabBarViewController presentViewController:[[ZQNavigationViewController alloc] initWithRootViewController:distController] animated:YES completion:^{
        }];
    });
    return ;
}

#pragma mark - 增加顶部导航图片
-(void)addNavigationImageWithName:(NSArray *)imageNameArray {
    [_imageScrollView reloadImageForScrollViewWithImageNameArray:imageNameArray];
    return ;
}

#pragma mark - 列表项相关代理方法
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return tableViewContentArray.count;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return kTableViewCellHeight;
}

-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    ZQRecommendTableViewCell* cell = [tableView dequeueReusableCellWithIdentifier:@"ZQRecommendTableViewCellIdentifier"];
    if(cell == nil) {
        cell = [[ZQRecommendTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"ZQRecommendTableViewCellIdentifier"];
    }
    
    [cell.imageView setImage:[UIImage imageNamed:tableViewContentArray[indexPath.row][0]]];
    [cell.textLabel setText:tableViewContentArray[indexPath.row][1]];
    [cell.detailTextLabel setText:tableViewContentArray[indexPath.row][2]];
    
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    ZQRecommendTableViewCell* cell = (ZQRecommendTableViewCell*)[tableView cellForRowAtIndexPath:indexPath];
    [cell setCellBackgroundColor:[UIColor lightGrayColor]];
    
    dispatch_async(dispatch_get_main_queue(), ^{
        ZQDistrictPostViewController* postController = [[ZQDistrictPostViewController alloc] initWithTitle:tableViewContentArray[indexPath.row][1]];
        [self.tabBarViewController presentViewController:[[ZQNavigationViewController alloc] initWithRootViewController:postController] animated:YES completion:^{
        }];
    });
    
    
    return ;
}

-(void)tableView:(UITableView *)tableView didDeselectRowAtIndexPath:(NSIndexPath *)indexPath {
    ZQRecommendTableViewCell* cell = (ZQRecommendTableViewCell*)[tableView cellForRowAtIndexPath:indexPath];
    [cell setCellBackgroundColor:[UIColor whiteColor]];
}

@end
