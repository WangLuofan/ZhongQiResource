//
//  ZQBaseSocialShare.m
//  中企资源
//
//  Created by 王落凡 on 15/6/17.
//  Copyright (c) 2015年 王落凡. All rights reserved.
//

#import <ShareSDK/ShareSDK.h>
#import <TencentOpenAPI/QQApiInterface.h>
#import <TencentOpenAPI/TencentOAuth.h>
#import "WXApi.h"
#import "WeiboApi.h"
#import "WeiboSDK.h"
#import "ZQBaseSocialShare.h"

@implementation ZQBaseSocialShare

+(void)registApp {
    return [ShareSDK registerApp:kShareSDKSocialShareAppKey];
}

+(void)connectToSharePlatform {
    //新浪微博
    [ShareSDK connectSinaWeiboWithAppKey:kSinaWeiboAppKey appSecret:kSinaWeiboAppSecret redirectUri:kRedirectUrl weiboSDKCls:[WeiboSDK class]];
    //腾讯微博
    [ShareSDK connectTencentWeiboWithAppKey:kTencentWeiboAppkey appSecret:kTencentWeiboAppSecret redirectUri:kRedirectUrl wbApiCls:[WeiboApi class]];
    //QQ空间
    [ShareSDK connectQZoneWithAppKey:kQZoneAppKey appSecret:kQZoneAppSecret qqApiInterfaceCls:[QQApiInterface class] tencentOAuthCls:[TencentOAuth class]];
    //QQ
    [ShareSDK connectQQWithQZoneAppKey:kQZoneAppKey qqApiInterfaceCls:[QQApiInterface class] tencentOAuthCls:[TencentOAuth class]];
    //微信
    [ShareSDK connectWeChatWithAppId:kWeChatAppKey appSecret:kWeChatAppSecret wechatCls:[WXApi class]];
    //邮件
    [ShareSDK connectMail];
    //短信
    [ShareSDK connectSMS];
    
    return ;
}

+(void)consturctPublishContentWithContent:(NSString*)content image:(NSString*)imagePath title:(NSString*)title url:(NSString*)url description:(NSString*)description {
    id<ISSContent> publishContent = [ShareSDK content:content defaultContent:nil image:[ShareSDK imageWithPath:imagePath] title:title url:url description:description mediaType:SSPublishContentMediaTypeNews];
    
    [ShareSDK showShareActionSheet:nil shareList:nil content:publishContent statusBarTips:YES authOptions:nil shareOptions:nil result:^(ShareType type, SSResponseState state, id<ISSPlatformShareInfo> statusInfo, id<ICMErrorInfo> error, BOOL end) {
    }];
}

+ (BOOL)application:(UIApplication *)application
      handleOpenURL:(NSURL *)url
{
    return [ShareSDK handleOpenURL:url
                        wxDelegate:self];
}

+ (BOOL)application:(UIApplication *)application openURL:(NSURL *)url sourceApplication:(NSString*)sourceApplication annotation:(id)annotation
{
    return [ShareSDK handleOpenURL:url
                 sourceApplication:sourceApplication
                        annotation:annotation
                        wxDelegate:self];
}

@end
