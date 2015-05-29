//
//  ZQToolBar.h
//  中企资源
//
//  Created by 王落凡 on 15/5/29.
//  Copyright (c) 2015年 王落凡. All rights reserved.
//

#import <UIKit/UIKit.h>

#define ZQToolBarStyleButton @"ZQToolBarStyleButton"
#define ZQToolBarStyleSearchBar @"ZQToolBarStylesearchBar"

@interface ZQToolBar : UIView

-(instancetype)initWithSuperView:(UIView*)superView Styles:(NSArray*)styles Text:(NSArray*)text;

@end
