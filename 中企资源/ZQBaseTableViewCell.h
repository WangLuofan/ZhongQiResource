//
//  ZQBaseTableViewCell.h
//  中企资源
//
//  Created by 王落凡 on 15/6/3.
//  Copyright (c) 2015年 王落凡. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger, ZQTableViewCellStyle) {
    ZQTableViewCellStyleDefault,ZQTableViewCellStyleNOButton
};

@interface ZQBaseTableViewCell : UITableViewCell

@property(nonatomic,strong) UIImageView* logoImageView;
@property(nonatomic,strong) UILabel* methodLabel;
@property(nonatomic,strong) UILabel* detailLabel;
@property(nonatomic,strong) UIButton* contractButton;

-(void)setContractButtonImage:(UIImage*)image;

@end
