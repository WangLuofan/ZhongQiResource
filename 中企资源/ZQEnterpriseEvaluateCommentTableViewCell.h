//
//  ZQEnterpriseEvaluateCommentTableViewCell.h
//  中企资源
//
//  Created by 王落凡 on 15/6/4.
//  Copyright (c) 2015年 王落凡. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol ZQEnterpriseEvaluateCommentTableViewCellDelegate <NSObject>

@optional
-(void)tableViewCell:(UITableViewCell*)tableViewCell browseImage:(UIImage*)image;

@end

@interface ZQEnterpriseEvaluateCommentTableViewCell : UITableViewCell

@property(nonatomic,strong) UIImageView* headerImageView;       //头像
@property(nonatomic,strong) UILabel* nameLabel;                 //名称
@property(nonatomic,strong) UILabel* dateTimeLabel;             //日期
@property(nonatomic,strong) UILabel* commentContentLabel;       //评论内容
@property(nonatomic,strong) UICollectionView* collectionView;   //图片集合

@property(nonatomic,assign) id<ZQEnterpriseEvaluateCommentTableViewCellDelegate> delegate;

-(void)setNumberOfBrowseCount:(NSInteger)browseCount AttentionCount:(NSInteger)attentionCount MessageCount:(NSInteger)messageCount;
-(void)setCommentContentText:(NSString*)text;
-(void)setCommentImageContent:(NSArray*)imageArray;
+(CGFloat)cellHeight;

@end
