//
//  ZQDistrictRscRecommendTableViewCell.h
//  中企资源
//
//  Created by 王落凡 on 15/6/13.
//  Copyright (c) 2015年 王落凡. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ZQDistrictRscRecommendTableViewCell : UITableViewCell

@property(nonatomic,strong) UILabel* titleLabel;
@property(nonatomic,strong) UILabel* detailLabel;
//@property(nonatomic,strong) UILabel* dateLabel;

-(void)setTitle:(NSString*)title Detail:(NSString*)detail;

@end
