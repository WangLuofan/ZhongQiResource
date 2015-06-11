//
//  ZQWantPostViewController.h
//  中企资源
//
//  Created by 王落凡 on 15/6/11.
//  Copyright (c) 2015年 王落凡. All rights reserved.
//

#import "ZQBaseExitViewController.h"

@interface ZQWantPostViewController : ZQBaseExitViewController

@property(nonatomic,strong) UITextField* titleTextField;
@property(nonatomic,strong) UITextView* contentTextView;

-(id)initWithTitle:(NSString*)title;

@end
