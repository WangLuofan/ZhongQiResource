//
//  ZQEnterpriseIntroductionTableViewCell.h
//  中企资源
//
//  Created by 王落凡 on 15/6/1.
//  Copyright (c) 2015年 王落凡. All rights reserved.
//

#import <UIKit/UIKit.h>

@class ZQStarRatingView;

@protocol ZQEnterpriseIntroductionTableViewCellDelegate <NSObject>

@optional
-(void)ZQEnterpriseIntroductionButtonPressed:(NSInteger)buttonIndex;

@end

@interface ZQEnterpriseIntroductionTableViewCell : UITableViewCell

@property(nonatomic,strong) UILabel* introductionLabel;
@property(nonatomic,strong) UIImageView* logoImageView;
@property(nonatomic,strong) UILabel* contractLabel;
@property(nonatomic,strong) UILabel* addressLabel;
@property(nonatomic,strong) UILabel* scoreLabel;

@property(nonatomic,assign) id<ZQEnterpriseIntroductionTableViewCellDelegate> delegate;

-(void)setIntroductionLabelText:(NSString*)text;
-(void)setEnterpriseInfoWithPhone:(NSString*)phoneNumber Address:(NSString*)address Score:(CGFloat)score;
+(CGFloat)cellHeight;

@end
