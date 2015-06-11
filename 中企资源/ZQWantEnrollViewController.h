//
//  ZQWantEnrollViewController.h
//  中企资源
//
//  Created by 王落凡 on 15/6/11.
//  Copyright (c) 2015年 王落凡. All rights reserved.
//

#import "ZQWantEnrollModel.h"
#import "ZQBaseExitViewController.h"

@interface ZQWantEnrollViewController : ZQBaseExitViewController

@property(nonatomic,retain) ZQWantEnrollModel* enrollModel;
@property(nonatomic,strong) UITableView* tableView;

@end
