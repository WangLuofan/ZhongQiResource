//
//  ZQPlatformNotificationTableViewCell.h
//  中企资源
//
//  Created by 王落凡 on 15/6/11.
//  Copyright (c) 2015年 王落凡. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ZQPlatformNotificationTableViewCell : UITableViewCell

@property(nonatomic,strong) UILabel* titleLabel;
@property(nonatomic,strong) UILabel* contentLabel;

-(void)setBrowseCount:(NSInteger)browseCount ReplyCount:(NSInteger)replyCount;

@end
