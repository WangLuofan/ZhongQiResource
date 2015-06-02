//
//  ZQEnterpriseTableViewCell.h
//  中企资源
//
//  Created by 王落凡 on 15/5/29.
//  Copyright (c) 2015年 王落凡. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ZQEnterpriseTableViewCell : UITableViewCell

@property(nonatomic,strong) UIButton* checkButton;
@property(nonatomic,strong) UIImageView* logoImageView;
@property(nonatomic,strong) UILabel* companyNameLabel;

-(void)setsubInfoLabelTextWithDiscription:(NSString*)discription ContentText:(NSString*)contentText;
-(void)setChecked:(BOOL)checked;
-(BOOL)checked;
-(void)setSelectedColor:(BOOL)bSelected;

@end
