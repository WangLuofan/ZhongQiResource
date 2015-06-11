//
//  ZQWantEnrollModel.h
//  中企资源
//
//  Created by 王落凡 on 15/6/11.
//  Copyright (c) 2015年 王落凡. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ZQWantEnrollModel : NSObject

@property(nonatomic,copy) NSString* userName;
@property(nonatomic,copy) NSString* telephoneNumber;
@property(nonatomic,copy) NSString* enterpriseName;
@property(nonatomic,assign) NSInteger attendCount;
@property(nonatomic,copy) NSString* remarksInfo;

@end
