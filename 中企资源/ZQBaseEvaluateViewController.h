//
//  ZQBaseEvaluateViewController.h
//  中企资源
//
//  Created by 王落凡 on 15/6/11.
//  Copyright (c) 2015年 王落凡. All rights reserved.
//

#import "ZQBaseCommentHeader.h"
#import "ZQBaseExitViewController.h"

@interface ZQBaseEvaluateViewController : ZQBaseExitViewController <ZQBaseCommentHeaderDelegate>

@property(nonatomic,strong) UITableView* tableView;
-(void)commentWithUserInfoDict:(NSDictionary*)infoDict;
-(void)addCustomViewToTopView:(UIView*)customView;
-(CGRect)topViewBounds;

@end
