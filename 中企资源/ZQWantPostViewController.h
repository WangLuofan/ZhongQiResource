//
//  ZQWantPostViewController.h
//  中企资源
//
//  Created by 王落凡 on 15/6/11.
//  Copyright (c) 2015年 王落凡. All rights reserved.
//

#import "ZQBaseImageReplyViewController.h"

@protocol ZQWantPostViewControllerDelegate <NSObject>

@optional
-(void)postWithTitle:(NSString*)title PostTextContent:(NSString*)postTextContent PostImageContent:(NSArray*)postImageContent;

@end

@interface ZQWantPostViewController : ZQBaseImageReplyViewController

@property(nonatomic,assign) id<ZQWantPostViewControllerDelegate> delegate;
@property(nonatomic,strong) UITextField* titleTextField;

@end
