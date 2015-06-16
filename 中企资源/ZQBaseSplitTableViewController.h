//
//  ZQBaseSplitTableViewController.h
//  中企资源
//
//  Created by 王落凡 on 15/6/15.
//  Copyright (c) 2015年 王落凡. All rights reserved.
//

#import "ZQSplitToolView.h"
#import "ZQBaseExitViewController.h"

@interface ZQBaseSplitTableViewController : ZQBaseExitViewController

@property(nonatomic,strong) ZQSplitToolView* splitToolView;
-(void)setComponentsViewControllerArray:(NSArray*)controllerArray;

@end
