//
//  ZQServiceAgencySuccessExampleTableViewCell.h
//  中企资源
//
//  Created by 王落凡 on 15/6/16.
//  Copyright (c) 2015年 王落凡. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ZQServiceAgencySuccessExampleTableViewCell : UITableViewCell

@property(nonatomic,strong) UIImageView* headerImageView;
@property(nonatomic,strong) UILabel* titleLabel;
@property(nonatomic,strong) UILabel* detailLabel;

-(void)setSuccessExampleTableViewCellHeight:(CGFloat)cellHeight;
-(void)addSubViewToContentView:(UIView*)subView;
-(CGRect)contentViewBounds;

@end
