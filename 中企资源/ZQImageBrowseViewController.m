//
//  ZQImageBrowseViewController.m
//  中企资源
//
//  Created by 王落凡 on 15/6/12.
//  Copyright (c) 2015年 王落凡. All rights reserved.
//

#import "ZQImageBrowseViewController.h"

@interface ZQImageBrowseViewController () {
    UIImageView* fullScreenImageView;
}

@end

@implementation ZQImageBrowseViewController

-(instancetype)initWithImage:(UIImage *)image {
    self = [super init];
    
    if(self) {
        [self.view setBackgroundColor:[UIColor colorWithRed:((CGFloat)231)/255 green:((CGFloat)232)/255 blue:((CGFloat)234)/255 alpha:1.0f]];
        fullScreenImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, self.view.bounds.size.height)];
        [fullScreenImageView setContentMode:UIViewContentModeScaleAspectFit];
        [fullScreenImageView setImage:image];
        [fullScreenImageView setUserInteractionEnabled:YES];
        [self.view addSubview:fullScreenImageView];
        
        [fullScreenImageView addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(imageViewTapped:)]];
    }
    
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
}

-(UIStatusBarStyle)preferredStatusBarStyle {
    return UIStatusBarStyleLightContent;
}

-(void)imageViewTapped:(UIGestureRecognizer*)sender {
    [self dismissViewControllerAnimated:YES completion:^{
    }];
    return ;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
