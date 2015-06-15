//
//  ZQBaseViewController.m
//  中企资源
//
//  Created by 王落凡 on 15/5/28.
//  Copyright (c) 2015年 王落凡. All rights reserved.
//

#import "ZQBaseViewController.h"
#import "ZQCollectionContentView.h"
#import "ZQNavigationViewController.h"

#define kCollectionViewItemCount 3
#define kCollectionCellMargin 5

@interface ZQBaseViewController ()<UICollectionViewDataSource,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout> {
    NSArray* viewControllersArray;
    NSArray* _collectionViewContentArray;
}

@end

@implementation ZQBaseViewController

-(instancetype)initWithTabBarController:(UIViewController*)tabBarController {
    self = [super init];
    
    if(self) {
        self.tabBarViewController = tabBarController;
    }
    
    return self;
}

-(void)initCollectionViewWithFrame:(CGRect)frame cellIdentifier:(NSString *)cellIdentifier superView:(UIView *)superView {
    
    UICollectionViewFlowLayout* flowLayout = [[UICollectionViewFlowLayout alloc] init];
    [flowLayout setScrollDirection:UICollectionViewScrollDirectionVertical];
    
    self._collectionView = [[UICollectionView alloc] initWithFrame:frame collectionViewLayout:flowLayout];
    [self._collectionView setBackgroundColor:[UIColor whiteColor]];
    [self._collectionView setDataSource:self];
    [self._collectionView setDelegate:self];
    [self._collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:cellIdentifier];
    [superView addSubview:self._collectionView];
    
    self.collectionViewCellIdentifier = cellIdentifier;
    [self addAllChildViewControllers];
    
    return ;
}

-(void)addChildViewControllersWithArray:(NSArray *)viewControllers {
    viewControllersArray = [NSArray arrayWithArray:viewControllers];
    return ;
}

-(void)initCollectionContent:(NSArray *)contentArray {
    _collectionViewContentArray = [NSArray arrayWithArray:contentArray];
    return ;
}

-(void)addAllChildViewControllers {
    return ;
}

#pragma mark - 集合视图数据代理
-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return _collectionViewContentArray.count;
}

#pragma mark - 集合视图代理方法
-(UICollectionViewCell*)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    UICollectionViewCell* cell = [collectionView dequeueReusableCellWithReuseIdentifier:self.collectionViewCellIdentifier forIndexPath:indexPath];
    ZQCollectionContentView* view = [[ZQCollectionContentView alloc] initWithFrame:cell.bounds];
    [view.titleLabel setText:_collectionViewContentArray[indexPath.row][0]];
    [view.imageView setImage:[UIImage imageNamed:_collectionViewContentArray[indexPath.row][1]]];
    [cell.contentView addSubview:view];
    return cell;
}

#pragma mark - 集合视图布局代理
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    return CGSizeMake(collectionView.bounds.size.width / kCollectionViewItemCount - 2*kCollectionCellMargin, collectionView.bounds.size.height / 2 - 2*kCollectionCellMargin);
}

-(UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section
{
    return UIEdgeInsetsMake(kCollectionCellMargin, kCollectionCellMargin, kCollectionCellMargin, kCollectionCellMargin);
}

//UICollectionView被选中时调用的方法
-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    dispatch_async(dispatch_get_main_queue(), ^{
        ZQNavigationViewController* nav = (ZQNavigationViewController*)[self getChildViewController:indexPath.row];
        [self.tabBarViewController presentViewController:nav animated:YES completion:^{
        }];
    });
    
    return ;
}

//返回这个UICollectionView是否可以被选择
-(BOOL)collectionView:(UICollectionView *)collectionView shouldSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    return YES;
}

-(UIViewController *)getChildViewController:(NSInteger)index {
    return (UIViewController*)viewControllersArray[index];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
