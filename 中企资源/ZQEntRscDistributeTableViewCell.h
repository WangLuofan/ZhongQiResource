//
//  ZQEntRscDistributeTableViewCell.h
//  中企资源
//
//  Created by 王落凡 on 15/6/2.
//  Copyright (c) 2015年 王落凡. All rights reserved.
//

#import <UIKit/UIKit.h>

@class ZQEntRscDistributeTableViewCell;
@protocol ZQEntRscDistributeTableViewCellDelegate <NSObject>

@optional
-(void)tableViewCell:(ZQEntRscDistributeTableViewCell*)entRscDistCell buttonPressedAtIndex:(NSInteger)atIndex;

@end

@interface ZQEntRscDistributeTableViewCell : UITableViewCell

@property(nonatomic,strong) UILabel* detailLabel;
@property(nonatomic,assign) id<ZQEntRscDistributeTableViewCellDelegate> delegate;

-(void)setOfferResourceTitle:(NSString*)title;
-(NSString*)offerResourceTitle;

@end
