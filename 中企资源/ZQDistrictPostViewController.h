//
//  ZQDistrictPostViewController.h
//  中企资源
//
//  Created by 王落凡 on 15/6/3.
//  Copyright (c) 2015年 王落凡. All rights reserved.
//

#import "ZQBaseExitViewController.h"

@interface ZQDistrictPostViewController : ZQBaseExitViewController

-(instancetype)initWithTitle:(NSString*)title;

@property(nonatomic,strong) UITableView* tableView;

@end
