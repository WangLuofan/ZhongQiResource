//
//  ZQNewestTableViewCell.h
//  中企资源
//
//  Created by 王落凡 on 15/6/5.
//  Copyright (c) 2015年 王落凡. All rights reserved.
//

#import <UIKit/UIKit.h>

@class ZQNewestTableViewCell;
@protocol ZQNewestTableViewCellDelegate <NSObject>

@optional
-(void)tableViewCell:(ZQNewestTableViewCell*)tableViewCell CommentInfo:(NSDictionary*)commentInfo;

@end

@interface ZQNewestTableViewCell : UITableViewCell

@property(nonatomic,strong) UIImageView* headerImageView;
@property(nonatomic,strong) UILabel* enterpriseNameLabel;
@property(nonatomic,strong) UILabel* userNameLabel;
@property(nonatomic,strong) UILabel* dateTimeLabel;
@property(nonatomic,strong) UILabel* commentContentLabel;
@property(nonatomic,strong) UIButton* commentButton;

@property(nonatomic,assign) id<ZQNewestTableViewCellDelegate> delegate;

-(CGFloat)cellHeight;
-(void)setCommentContentText:(NSString*)contentText;
-(void)addReplyContentWithFrom:(NSString*)from Content:(NSString*)content;

@end
