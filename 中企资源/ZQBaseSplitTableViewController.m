//
//  ZQBaseSplitTableViewController.m
//  中企资源
//
//  Created by 王落凡 on 15/6/15.
//  Copyright (c) 2015年 王落凡. All rights reserved.
//

#import "ZQBaseSplitViewController.h"
#import "ZQBaseSplitTableViewController.h"

#define kSplitToolViewHeight 44

@interface ZQBaseSplitTableViewController ()<ZQSplitToolViewDelegate> {
    NSArray* componentsControllerArray;
    ZQBaseSplitViewController* currentShownViewController;
}

@end

@implementation ZQBaseSplitTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.splitToolView = [[ZQSplitToolView alloc] initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, kSplitToolViewHeight)];
    [self.splitToolView setSplitToolViewDelegate:self];
    [self.view addSubview:self.splitToolView];
    
    return ;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)setComponentsViewControllerArray:(NSArray *)controllerArray {
    NSAssert(controllerArray.count == self.splitToolView.subviews.count - 1, @"The Controller count must be equal to the SplitToolView's Item count");
    componentsControllerArray = [NSArray arrayWithArray:controllerArray];
    
    if(currentShownViewController == nil)
        [self splitToolView:nil itemSelectionChangedToIndex:0];
    
    return ;
}

-(void)splitToolView:(ZQSplitToolView *)splitToolView itemSelectionChangedToIndex:(NSInteger)toIndex {
    [currentShownViewController.view removeFromSuperview];
    ZQBaseSplitViewController* viewController = (ZQBaseSplitViewController*)componentsControllerArray[toIndex];
    currentShownViewController = viewController;
    if(splitToolView == nil)
        [currentShownViewController setFrame:CGRectMake(0, kSplitToolViewHeight, self.view.bounds.size.width, self.view.bounds.size.height - kNavStatusHeight - kSplitToolViewHeight)];
    else
        [currentShownViewController setFrame:CGRectMake(0, kSplitToolViewHeight, self.view.bounds.size.width, self.view.bounds.size.height - kSplitToolViewHeight)];
    [self.view addSubview:currentShownViewController.view];
    return ;
}

@end
