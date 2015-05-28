//
//  StartViewController.m
//  中企资源
//
//  Created by 王落凡 on 15/5/26.
//  Copyright (c) 2015年 王落凡. All rights reserved.
//

#import "ZQPageControl.h"
#import "ZQCollectionContentView.h"
#import "StartViewController.h"

#define kTopScrollViewHeight 180
#define kFunctionModuleHeight 200
#define kLoginButtonHeight 30
#define kCollectionViewItemCount 3
#define kCollectionCellMargin 5
#define kTableViewHeigh 200

@interface StartViewController ()<UIScrollViewDelegate,UICollectionViewDataSource,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout> {
    UIScrollView* _contentScrollView;
    UIScrollView* _imageScrollView;
    ZQPageControl* _imagePageControl;
    UICollectionView* _collectionView;
    
    NSArray* contentArray;
}

@end

@implementation StartViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setTitle:@"中企资源管理平台"];
    _contentScrollView = [[UIScrollView alloc] initWithFrame:self.view.bounds];
    [_contentScrollView setBackgroundColor:[UIColor colorWithRed:((CGFloat)231)/255 green:((CGFloat)232)/255 blue:((CGFloat)234)/255 alpha:1.0f]];
    [self.view addSubview:_contentScrollView];
    
    contentArray = @[
                     @[@"企业资源",@"qyzy"],
                     @[@"商圈资源",@"sqzy"],
                     @[@"专项扶持",@"zxfc"],
                     @[@"服务机构",@"fwjg"],
                     @[@"政策解读",@"zcjd"],
                     @[@"专家讲坛",@"zjjt"]
                     ];
    
    [self initScrollViews];
    [self initLoginButton];
    [self initFunctionModule];
    
    [_contentScrollView setContentSize:CGSizeMake(_contentScrollView.bounds.size.width, _contentScrollView.bounds.size.height + kTableViewHeigh)];
}

#pragma mark - 添加功能模块
-(void)initFunctionModule {
    
    UICollectionViewFlowLayout* flowLayout = [[UICollectionViewFlowLayout alloc] init];
    [flowLayout setScrollDirection:UICollectionViewScrollDirectionVertical];
    
    _collectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(0, _imageScrollView.frame.origin.y +kTopScrollViewHeight + kLoginButtonHeight, self.view.bounds.size.width, kFunctionModuleHeight) collectionViewLayout:flowLayout];
    [_collectionView setBackgroundColor:[UIColor whiteColor]];
    [_collectionView setDataSource:self];
    [_collectionView setDelegate:self];
    [_collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:@"ZQCollectionViewCellIdentifier"];
    [_contentScrollView addSubview:_collectionView];
    
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
    
    _imageScrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, kTopScrollViewHeight)];
    [_imageScrollView setBackgroundColor:[UIColor blackColor]];
    [_imageScrollView setPagingEnabled:YES];    //设置分页
    [_imageScrollView setShowsHorizontalScrollIndicator:NO];    //设置不显示水平滚动条
    [_imageScrollView setShowsVerticalScrollIndicator:NO];      //设置不显示垂直滚动条
    [_imageScrollView setBounces:NO];                           //设置滚动视图无弹性
    [_imageScrollView setDelegate:self];                        //设置代理
    [bottomView addSubview:_imageScrollView];
    
    _imagePageControl = [[ZQPageControl alloc] initWithFrame:CGRectMake(0, bottomView.bounds.size.height - 20, bottomView.bounds.size.width, 10)];
    [bottomView addSubview:_imagePageControl];
    
    [self addNavigationImageWithName:@[@"banner01",@"banner01",@"banner01",@"banner01",@"banner01"]];
    
    return ;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - 增加顶部导航图片
-(void)addNavigationImageWithName:(NSArray *)imageNameArray {
    //设置pageControl
    [_imagePageControl setNumberOfPages:imageNameArray.count];
    
    //清空scrollView中的所有控件
    for (UIView* subView in _imageScrollView.subviews) {
        [subView removeFromSuperview];
    }
    
    //添加图片
    for (int i = 0; i != imageNameArray.count; ++i) {
        UIImageView* imageView = [[UIImageView alloc] initWithFrame:CGRectMake(i*_imageScrollView.bounds.size.width, 0, _imageScrollView.bounds.size.width, _imageScrollView.bounds.size.height)];
        [imageView setImage:[UIImage imageNamed:imageNameArray[i]]];
        [_imageScrollView addSubview:imageView];
    }
    [_imageScrollView setContentSize:CGSizeMake(imageNameArray.count*_imageScrollView.bounds.size.width, _imageScrollView.bounds.size.height)];
    
    return ;
}

#pragma mark - 滚动视图代理方法
-(void)scrollViewDidScroll:(UIScrollView *)scrollView {
    [_imagePageControl setCurrentPage:((int)scrollView.contentOffset.x/kScreenWidth+0.5)];
    return ;
}

#pragma mark - 集合视图数据代理
-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return contentArray.count;
}

#pragma mark - 集合视图代理方法
-(UICollectionViewCell*)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    UICollectionViewCell* cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"ZQCollectionViewCellIdentifier" forIndexPath:indexPath];
    ZQCollectionContentView* view = [[ZQCollectionContentView alloc] initWithFrame:cell.bounds];
    [view.imageView setImage:[UIImage imageNamed:contentArray[indexPath.row][1]]];
    [view.titleLabel setText:contentArray[indexPath.row][0]];
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
}

//返回这个UICollectionView是否可以被选择
-(BOOL)collectionView:(UICollectionView *)collectionView shouldSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    return YES;
}

@end
