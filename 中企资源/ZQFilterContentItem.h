//
//  ZQFilterContentItem.h
//  中企资源
//
//  Created by 王落凡 on 15/6/18.
//  Copyright (c) 2015年 王落凡. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ZQFilterContentItem : UIButton

@property(nonatomic,assign) BOOL isLeftFilterContentItem;
@property(nonatomic,assign) BOOL isFilterContentItemHasSubMenu;

-(void)setHasSubMenu;

@end
