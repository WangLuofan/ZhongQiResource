//
//  ZQTabBarViewController.m
//  中企资源
//
//  Created by 王落凡 on 15/5/27.
//  Copyright (c) 2015年 王落凡. All rights reserved.
//

#import "ZQTabBarItem.h"
#import "ZQTabBarViewController.h"
#import "ZQNavigationViewController.h"

#define kTabbarHeight 49

@interface ZQTabBarViewController () {
    NSArray* subViewControllers;
    ZQTabBarItem* selectedItem;
}

@end

@implementation ZQTabBarViewController

-(instancetype)init {
    self = [super init];
    
    if(self) {
        self.tabBarView = [[UIView alloc] initWithFrame:CGRectMake(0, self.view.bounds.size.height - kTabbarHeight, self.view.bounds.size.width, kTabbarHeight)];
        UIImageView* imageView = [[UIImageView alloc] initWithFrame:self.tabBarView.bounds];
        [imageView setImage:[UIImage imageNamed:@"nav_bottom_bg"]];
        [self.tabBarView insertSubview:imageView atIndex:0];
        [self.view addSubview:self.tabBarView];
    }
    
    return self;
}

-(void)addViewControllers:(NSArray *)viewControllers {
    subViewControllers = [NSArray arrayWithArray:viewControllers];
    return ;
}

-(void)addItemsWithTitle:(NSArray *)titles images:(NSArray *)images {
    NSAssert(titles.count == images.count, @"标签标题数目应与图片数目相等");
    for (int i = 0; i != titles.count; ++i ) {
        ZQTabBarItem* tabItem = [[ZQTabBarItem alloc] initWithFrame:CGRectMake(i*self.tabBarView.bounds.size.width/titles.count, 0, self.tabBarView.bounds.size.width/titles.count, self.tabBarView.bounds.size.height)];
//        [tabItem setFrame:CGRectMake(i*tabBarView.bounds.size.width/titles.count, 0, tabBarView.bounds.size.width/titles.count, tabBarView.bounds.size.height)];
        [tabItem setTag:i];
        [tabItem setTitle:titles[i] forState:UIControlStateNormal];
        [tabItem setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [tabItem.titleLabel setFont:[UIFont systemFontOfSize:14.0f]];
        [tabItem setImage:images[i] forState:UIControlStateNormal];
        [tabItem addTarget:self action:@selector(tabItemSelected:) forControlEvents:UIControlEventTouchDown];
        [self.tabBarView addSubview:tabItem];
        
        if(i==0) {
            [self tabItemSelected:tabItem];
        }
    }
    
    return ;
}

-(void)tabItemSelected:(ZQTabBarItem*)sender {
    if([sender isEqual:selectedItem])
        return ;
    [selectedItem setSelected:NO];
    [sender setSelected:YES];
    
    if(selectedItem != nil){
        UIViewController* oldVC = (UIViewController*)subViewControllers[selectedItem.tag];
        [oldVC.view removeFromSuperview];
    }
    
    UIViewController* newVC = (UIViewController*)subViewControllers[sender.tag];
    [newVC.view setFrame:CGRectMake(0, 0, self.view.bounds.size.width, self.view.bounds.size.height - self.tabBarView.bounds.size.height)];
    [self.view addSubview:newVC.view];
    
    selectedItem = sender;
    return ;
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
