//
//  ZQResponseLabel.h
//  中企资源
//
//  Created by 王落凡 on 15/6/5.
//  Copyright (c) 2015年 王落凡. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ZQResponseLabel : UIButton

@property(nonatomic,copy) NSString* from;
@property(nonatomic,copy) NSString* to;

-(void)setCommentWithFrom:(NSString*)from To:(NSString*)to Conntent:(NSString*)content;

@end
