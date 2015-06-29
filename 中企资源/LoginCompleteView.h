//
//  LoginCompleteView.h
//  中企资源
//
//  Created by 王落凡 on 15/5/28.
//  Copyright (c) 2015年 王落凡. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LoginCompleteView : UIView

@property(nonatomic,strong) UIButton* headerImageView;
@property(nonatomic,strong) UILabel* userNameLabel;
@property(nonatomic,strong) UILabel* companyLabel;
@property(nonatomic,strong) UIButton* closureButton;
@property(nonatomic,copy) NSString* userName;

-(void)showLoginCompleteViewWithImageName:(NSString*)imageName userName:(NSString*)userName companyName:(NSString*)companyName;
-(void)hideLoginCompleteView;

@end
