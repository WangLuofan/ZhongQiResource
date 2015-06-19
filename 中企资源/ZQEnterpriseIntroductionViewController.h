//
//  ZQEnterpriseIntroductionViewController.h
//  中企资源
//
//  Created by 王落凡 on 15/6/1.
//  Copyright (c) 2015年 王落凡. All rights reserved.
//

#import "ZQBaseExitViewController.h"
#import <UIKit/UIKit.h>

@interface ZQEnterpriseIntroductionViewController : ZQBaseExitViewController

@property(nonatomic,strong) UITableView* tableView;

-(void)setEnterpriseIntroductionWithString:(NSString*)introductionStr LogoImage:(UIImage*)image phoneNumber:(NSString*)phoneNumber AddressString:(NSString*)addressString fScore:(CGFloat)fScore;

@end
