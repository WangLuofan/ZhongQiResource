//
//  ZQUserInfoModifyTableViewCell.h
//  中企资源
//
//  Created by 王落凡 on 15/6/9.
//  Copyright (c) 2015年 王落凡. All rights reserved.
//

#import <UIKit/UIKit.h>

@class ZQUserInfoModifyTableViewCell;
@protocol ZQUserInfoModifyTableViewCellDelegate <NSObject>

@optional
-(void)changeImageForImageView:(UIImageView*)imageView;

@end

@interface ZQUserInfoModifyTableViewCell : UITableViewCell

@property(nonatomic,assign) id<ZQUserInfoModifyTableViewCellDelegate> delegate;
@property(nonatomic,strong) UIImageView* imageView;
@property(nonatomic,strong) UILabel* textLabel;
@property(nonatomic,strong) UITextField* editTextField;

-(void)setCellInfoWithImage:(UIImage*)image text:(NSString*)text;
-(void)setEditing:(BOOL)editing indexPath:(NSIndexPath*)indexPath;
-(void)setNeedsCornerRadius:(BOOL)needs;

@end
