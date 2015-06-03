//
//  ZQTypeChooseAlertViewController.h
//  中企资源
//
//  Created by 王落凡 on 15/6/1.
//  Copyright (c) 2015年 王落凡. All rights reserved.
//

#import <UIKit/UIKit.h>

@class ZQTypeChooseAlertViewController;
@protocol ZQTypeChooseAlertViewDelegate <NSObject>

@optional
-(void)alertView:(ZQTypeChooseAlertViewController*)alertView clickedButtonAtIndex:(NSInteger)buttonIndex ResourceType:(NSString*)ResourceType ResourceCategory:(NSString*)ResourceCategory;

@end

@interface ZQTypeChooseAlertViewController : UIViewController

@property(nonatomic,assign) id<ZQTypeChooseAlertViewDelegate> delegate;

-(void)setResourceType:(NSString*)resourceType ResourceCategory:(NSString*)resourceCategory;
-(void)showInView:(UIView*)superView;
-(void)dismissAlertView;

@end
