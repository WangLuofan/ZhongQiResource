//
//  ZQEnterpriseDetailInfoTableViewCell.h
//  中企资源
//
//  Created by 王落凡 on 15/6/3.
//  Copyright (c) 2015年 王落凡. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ZQEnterpriseDetailInfoTableViewCell : UITableViewCell

@property(nonatomic,strong) UIImageView* logoImageView;
@property(nonatomic,strong) UILabel* founderLabel;
@property(nonatomic,strong) UILabel* postLabel;
@property(nonatomic,strong) UILabel* receiveLabel;
@property(nonatomic,strong) UILabel* districtLabel;
@property(nonatomic,strong) UILabel* detailLabel;

@property(nonatomic,strong) UIButton* postButton;
@property(nonatomic,strong) UIButton* shareButton;
@property(nonatomic,strong) UIButton* nameButton;
@property(nonatomic,strong) UIButton* attentionButton;

@end
