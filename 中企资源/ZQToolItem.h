//
//  ZQToolItem.h
//  中企资源
//
//  Created by 王落凡 on 15/6/9.
//  Copyright (c) 2015年 王落凡. All rights reserved.
//

#import "ZQFilterView.h"
#import <UIKit/UIKit.h>

@interface ZQToolItem : UIButton

@property(nonatomic,strong) ZQFilterView* filterView;

-(instancetype)initWithFrame:(CGRect)frame Title:(NSString*)title superView:(UIView*)superView;

@end
