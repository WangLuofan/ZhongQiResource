//
//  ZQNotificationEvaluateViewController.m
//  中企资源
//
//  Created by 王落凡 on 15/6/11.
//  Copyright (c) 2015年 王落凡. All rights reserved.
//

#import "ZQPlatformNotificationEvaluateHeaderView.h"
#import "ZQNotificationEvaluateViewController.h"

#define kControlMargin 5
#define kShadowRadius 0.5f

@interface ZQNotificationEvaluateViewController () {
    ZQPlatformNotificationEvaluateHeaderView* evaluateView;
}

@end

@implementation ZQNotificationEvaluateViewController

- (instancetype)init
{
    self = [super init];
    if (self) {
        evaluateView = [[ZQPlatformNotificationEvaluateHeaderView alloc] initWithFrame:CGRectMake(0, kShadowRadius, [self topViewBounds].size.width, [self topViewBounds].size.height - 2*kShadowRadius)];
        [evaluateView setDelegate:self];
        [evaluateView setBackgroundColor:[UIColor colorWithRed:((CGFloat)242)/255 green:((CGFloat)242)/255 blue:((CGFloat)244)/255 alpha:1.0f]];
        [self addCustomViewToTopView:evaluateView];
    }
    
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setTitle:@"平台通告评论"];
    
    return ;
}

-(void)setEvaluateHeaderTitle:(NSString *)title CommentContent:(NSString *)content {
    [evaluateView setTitle:title Content:content];
    return ;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
