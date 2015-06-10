//
//  ZQUserInfoModifyViewController.h
//  中企资源
//
//  Created by 王落凡 on 15/6/9.
//  Copyright (c) 2015年 王落凡. All rights reserved.
//

#import "ZQBaseExitViewController.h"

@interface ZQUserInfoModifyViewController : ZQBaseExitViewController

@property(nonatomic,strong) UITableView* tableView;

-(instancetype)initWithHeaderImage:(UIImage*)headerImage userName:(NSString*)userName;

@end
