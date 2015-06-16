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

#import "ZQPlatformGuideViewController.h"
#import "ZQBatchSndReqInfoViewController.h"
#import "ZQMyNotificationViewController.h"
#import "ZQMyDistributionViewController.h"
#import "ZQMyAttentionViewController.h"
#import "ZQMyChatViewController.h"

#import "ZQUserInfoModifyViewController.h"

#import "ZQNavigationViewController.h"

#define kBgImageHeight 150
#define kCollectionViewItemCount 3
#define kCollectionViewHeight 240
#define kCollectionViewGapWithImage 30
#define kCollectionCellMargin 5
#define kLoginCompleteViewGap 10

@interface UserViewController () {
    UIImageView* _contentImageView;
    UICollectionView* _contentCollectionView;
    LoginCompleteView* loginCompleteView;
    UILabel* welcomeLabel;
    UIButton* loginButton;
}

@end

@implementation UserViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self initCollectionContent:@[
                      @[@"平台入驻引导",@"ptrz"],
                      @[@"发布资源信息",@"fbzy"],
                      @[@"我的通知",@"wdtz"],
                      @[@"我的发布",@"wdfb"],
                      @[@"我的关注",@"wdgz"],
                      @[@"我的聊天",@"wdlt"]
                      ]];
    
    [self initHeaderView];
    [self initCollectionViewWithFrame:CGRectMake(0, _contentImageView.frame.origin.y + _contentImageView.bounds.size.height + kCollectionViewGapWithImage, self.view.bounds.size.width, kCollectionViewHeight) cellIdentifier:@"ZQCollectionViewUserCellIdentifier" superView:self.view];
}

-(void)addAllChildViewControllers {
    
    ZQNavigationViewController* nav1 = [[ZQNavigationViewController alloc] initWithRootViewController:[[ZQPlatformGuideViewController alloc] init]];
    ZQNavigationViewController* nav2 = [[ZQNavigationViewController alloc] initWithRootViewController:[[ZQBatchSndReqInfoViewController alloc] init]];
    ZQNavigationViewController* nav3 = [[ZQNavigationViewController alloc] initWithRootViewController:[[ZQMyNotificationViewController alloc] init]];
    ZQNavigationViewController* nav4 = [[ZQNavigationViewController alloc] initWithRootViewController:[[ZQMyDistributionViewController alloc] init]];
    ZQNavigationViewController* nav5 = [[ZQNavigationViewController alloc] initWithRootViewController:[[ZQMyAttentionViewController alloc] init]];
    ZQNavigationViewController* nav6 = [[ZQNavigationViewController alloc] initWithRootViewController:[[ZQMyChatViewController alloc] init]];
    
    [self addChildViewControllersWithArray:@[nav1,nav2,nav3,nav4,nav5,nav6]];
    
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
    [loginButton setFrame:CGRectMake(0, _contentImageView.bounds.size.height / 2 , loginButton.imageView.image.size.width / 2, loginButton.imageView.image.size.height / 2)];
    [loginButton addTarget:self action:@selector(loginButtonPressed:) forControlEvents:UIControlEventTouchUpInside];
    [loginButton setCenter:CGPointMake(_contentImageView.center.x, loginButton.center.y)];
    [_contentImageView addSubview:loginButton];
    
    loginCompleteView = [[LoginCompleteView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, _contentImageView.frame.size.height - 2*kLoginCompleteViewGap)];
    [loginCompleteView.closureButton addTarget:self action:@selector(closureButtonPressed:) forControlEvents:UIControlEventTouchUpInside];
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

-(void)closureButtonPressed:(UIButton*)sender {
    dispatch_async(dispatch_get_main_queue(), ^{
        ZQUserInfoModifyViewController* userViewController = [[ZQUserInfoModifyViewController alloc] initWithHeaderImage:loginCompleteView.headerImageView.image userName:loginCompleteView.userName];
        [self.tabBarViewController presentViewController:[[ZQNavigationViewController alloc] initWithRootViewController:userViewController] animated:YES completion:^{
        }];
    });
    
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

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
