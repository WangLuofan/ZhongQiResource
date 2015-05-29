//
//  ZQCheckBox.h
//  中企资源
//
//  Created by 王落凡 on 15/5/29.
//  Copyright (c) 2015年 王落凡. All rights reserved.
//

#import <UIKit/UIKit.h>

@class ZQCheckBox;
@protocol ZQCheckBoxDelegate <NSObject>

@optional
-(void)checkBox:(ZQCheckBox*)checkBox isSelected:(BOOL)isSelected;

@end

@interface ZQCheckBox : UIButton

@property(nonatomic,assign) id<ZQCheckBoxDelegate> delegate;
-(instancetype)initWithFrame:(CGRect)frame shouldFixFrame:(BOOL)shouldFixFrame;

@end
