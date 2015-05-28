//
//  UserViewController.m
//  中企资源
//
//  Created by 王落凡 on 15/5/26.
//  Copyright (c) 2015年 王落凡. All rights reserved.
//

#import "UserViewController.h"
#import "ZQTabBarViewController.h"
#import "ZQCollectionContentView.h"
#import "LoginCompleteView.h"

#define kBgImageHeight 150
#define kCollectionViewItemCount 3
#define kCollectionCellMargin 5
#define kLoginCompleteViewGap 10

@interface UserViewController ()<UICollectionViewDataSource,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout> {
    UIImageView* _contentImageView;
    UICollectionView* _contentCollectionView;
    NSArray* collectionViewContentArray;
    LoginCompleteView* loginCompleteView;
    UILabel* welcomeLabel;
    UIButton* loginButton;
}

@end

@implementation UserViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    collectionViewContentArray = @[
                      @[@"ptrz",@"平台入驻引导"],
                      @[@"fbzy",@"发布资源信息"],
                      @[@"wdtz",@"我的通知"],
                      @[@"wdfb",@"我的发布"],
                      @[@"wdgz",@"我的关注"],
                      @[@"wdlt",@"我的聊天"]
                      ];
    
    [self initHeaderView];
    [self initContentCollection];
}

#pragma mark -模块集合视图
-(void)initContentCollection {
    UICollectionViewFlowLayout* flowLayout = [[UICollectionViewFlowLayout alloc] init];
    _contentCollectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(0, _contentImageView.frame.origin.y + _contentImageView.bounds.size.height, self.view.bounds.size.width, self.view.bounds.size.height - _contentImageView.frame.origin.y - _contentImageView.bounds.size.height - self.navigationController.tabBarController.tabBar.frame.size.height - ((ZQTabBarViewController*)self.tabBarViewController).tabBarView.frame.size.height) collectionViewLayout:flowLayout];
    [_contentCollectionView setBackgroundColor:[UIColor whiteColor]];
    [_contentCollectionView setDelegate:self];
    [_contentCollectionView setDataSource:self];
    [_contentCollectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:@"ZQCollectionViewUserCellIdentifier"];
    [self.view addSubview:_contentCollectionView];
    return ;
}

#pragma mark - 增加头部图片部分
-(void)initHeaderView {
    
    _contentImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"bg"]];
    [_contentImageView setFrame:CGRectMake(0, 0, self.view.bounds.size.width, kBgImageHeight)];
    [_contentImageView setUserInteractionEnabled:YES];
    [self.view addSubview:_contentImageView];
    
    welcomeLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, _contentImageView.bounds.size.height / 4, _contentImageView.bounds.size.width, 30)];
    [welcomeLabel setTextAlignment:NSTextAlignmentCenter];
    [welcomeLabel setTextColor:[UIColor whiteColor]];
    [welcomeLabel setFont:[UIFont fontWithName:@"YuppySC-Regular" size:20.0f]];
    [welcomeLabel setText:@"欢迎来到中企资源"];
    [_contentImageView addSubview:welcomeLabel];
    
    loginButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [loginButton setImage:[UIImage imageNamed:@"dianjidenglu"] forState:UIControlStateNormal];
    [loginButton setFrame:CGRectMake(0, _contentImageView.bounds.size.height / 2, loginButton.imageView.image.size.width / 2, loginButton.imageView.image.size.height / 2)];
    [loginButton addTarget:self action:@selector(loginButtonPressed:) forControlEvents:UIControlEventTouchUpInside];
    [loginButton setCenter:CGPointMake(_contentImageView.center.x, loginButton.center.y)];
    [_contentImageView addSubview:loginButton];
    
    loginCompleteView = [[LoginCompleteView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, _contentImageView.frame.size.height - 2*kLoginCompleteViewGap)];
    [loginCompleteView setCenter:CGPointMake(loginCompleteView.center.x, _contentImageView.center.y)];
    [_contentImageView addSubview:loginCompleteView];
    return ;
}

-(void)loginButtonPressed:(UIButton*)sender {
    [welcomeLabel setHidden:YES];
    [loginButton setHidden:YES];
    [loginCompleteView showLoginCompleteViewWithImageName:@"touxiang" userName:@"帅帅" companyName:@"萍乡电子商务创业园圈"];
    return ;
}

#pragma mark - 打印系统所有字体(辅助方法)
-(void) printAllFonts
{
    NSArray *familyNames = [[NSArray alloc] initWithArray:[UIFont familyNames]];
    NSArray *fontNames;
    
    NSInteger indFamily, indFont;
    
    for(indFamily=0; indFamily<[familyNames count]; ++indFamily)
    {
        NSLog(@"Family name:%@", [familyNames objectAtIndex:indFamily]);
        
        fontNames = [[NSArray alloc] initWithArray:[UIFont fontNamesForFamilyName:[familyNames objectAtIndex:indFamily]]];
        
        for(indFont=0; indFont<[fontNames count]; ++indFont)
        {
            NSLog(@"\tFont name:%@",[fontNames objectAtIndex:indFont]);
        }
    }
}

#pragma mark - 集合视图数据源方法
-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return collectionViewContentArray.count;
}

#pragma mark - 集合视图代理方法
-(UICollectionViewCell*)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    UICollectionViewCell* cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"ZQCollectionViewUserCellIdentifier" forIndexPath:indexPath];
    ZQCollectionContentView* view = [[ZQCollectionContentView alloc] initWithFrame:cell.bounds];
    [view.imageView setImage:[UIImage imageNamed:collectionViewContentArray[indexPath.row][0]]];
    [view.titleLabel setText:collectionViewContentArray[indexPath.row][1]];
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
    return CGSizeMake(collectionView.bounds.size.width / kCollectionViewItemCount - 6*kCollectionCellMargin, collectionView.bounds.size.height / 2 - 6*kCollectionCellMargin);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
