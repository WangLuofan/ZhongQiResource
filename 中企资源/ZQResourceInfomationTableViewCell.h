//
//  ZQResourceInfomationTableViewCell.h
//  中企资源
//
//  Created by 王落凡 on 15/6/15.
//  Copyright (c) 2015年 王落凡. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ZQResourceInfomationTableViewCell : UITableViewCell

@property(nonatomic,strong) UIImageView* logoImageView;
@property(nonatomic,strong) UILabel* enterpriseLabel;
@property(nonatomic,strong) UILabel* dateTimeLabel;
@property(nonatomic,strong) UILabel* offerLabel;
@property(nonatomic,strong) UILabel* detailLabel;

-(void)setBrowseCount:(NSInteger)browseCount AttentionCount:(NSInteger)attentionCount ReplyCount:(NSInteger)replyCount;

@end
