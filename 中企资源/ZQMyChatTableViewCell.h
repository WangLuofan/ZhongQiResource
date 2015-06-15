//
//  ZQMyChatTableViewCell.h
//  中企资源
//
//  Created by 王落凡 on 15/6/14.
//  Copyright (c) 2015年 王落凡. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ZQMyChatTableViewCell : UITableViewCell

@property(nonatomic,strong) UIImageView* headerImageView;
@property(nonatomic,strong) UILabel* enterpriseNameLabel;
@property(nonatomic,strong) UILabel* timeLabel;
@property(nonatomic,strong) UILabel* messageLabel;

-(void)setBradgeNumber:(NSInteger)bradgeNumber;

@end
