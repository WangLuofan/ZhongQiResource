//
//  ZQBaseSocialShare.h
//  中企资源
//
//  Created by 王落凡 on 15/6/17.
//  Copyright (c) 2015年 王落凡. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>

@interface ZQBaseSocialShare : NSObject

+(void)registApp;
+(void)connectToSharePlatform;
+(void)consturctPublishContentWithContent:(NSString*)content image:(NSString*)imagePath title:(NSString*)title url:(NSString*)url description:(NSString*)description;
+ (BOOL)application:(UIApplication *)application handleOpenURL:(NSURL *)url;
+ (BOOL)application:(UIApplication *)application openURL:(NSURL *)url sourceApplication:(NSString*)sourceApplication annotation:(id)annotation;

@end
