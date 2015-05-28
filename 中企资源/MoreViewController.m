//
//  MoreViewController.m
//  中企资源
//
//  Created by 王落凡 on 15/5/26.
//  Copyright (c) 2015年 王落凡. All rights reserved.
//

#import "ZQTabBarViewController.h"
#import "MoreViewController.h"
#import "ZQCollectionContentView.h"

#define kCollectionViewItemCount 3
#define kCollectionCellMargin 10
#define kLoginCompleteViewGap 10
#define kCollectionViewHeight 240

@interface MoreViewController ()<UICollectionViewDataSource,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout> {
    UICollectionView* _contentCollectionView;
    NSArray* _contentCollectionArray;
}

@end

@implementation MoreViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setTitle:@"更多"];
    
    UICollectionViewFlowLayout* flowLayout = [[UICollectionViewFlowLayout alloc] init];
    _contentCollectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(self.view.frame.origin.x, self.view.frame.origin.y, self.view.frame.size.width, kCollectionViewHeight) collectionViewLayout:flowLayout];
    [_contentCollectionView setBackgroundColor:[UIColor whiteColor]];
    [_contentCollectionView setDelegate:self];
    [_contentCollectionView setDataSource:self];
    [_contentCollectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:@"ZQCollectionViewMoreCellIdentifier"];
    [self.view addSubview:_contentCollectionView];
    
    _contentCollectionArray = @[
                                @[@"平台通告",@"ptgg"],
                                @[@"申请商圈奖励",@"sqsqjl"],
                                @[@"版本更新",@"bbgx"],
                                @[@"关于中企资源",@"gyzqzy"],
                                @[@"用户反馈",@"yhfg"],
                                ];
}

#pragma mark - 集合视图数据源方法
-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return _contentCollectionArray.count;
}

#pragma mark - 集合视图代理方法
-(UICollectionViewCell*)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    UICollectionViewCell* cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"ZQCollectionViewMoreCellIdentifier" forIndexPath:indexPath];
    ZQCollectionContentView* view = [[ZQCollectionContentView alloc] initWithFrame:cell.bounds];
    [view.imageView setImage:[UIImage imageNamed:_contentCollectionArray[indexPath.row][1]]];
    [view.titleLabel setText:_contentCollectionArray[indexPath.row][0]];
    [cell.contentView addSubview:view];
    
    return cell;
}

//UICollectionView被选中时调用的方法
-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
}

//返回这个UICollectionView是否可以被选择
-(BOOL)collectionView:(UICollectionView *)collectionView shouldSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    return YES;
}

-(UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section
{
    return UIEdgeInsetsMake(kCollectionCellMargin, kCollectionCellMargin, kCollectionCellMargin, kCollectionCellMargin);
}

#pragma mark - 集合视图布局代理
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    return CGSizeMake(collectionView.bounds.size.width / kCollectionViewItemCount - 2*kCollectionCellMargin, collectionView.bounds.size.height / 2 - 2*kCollectionCellMargin);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
