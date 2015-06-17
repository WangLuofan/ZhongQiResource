//
//  ZQMediaReportTableViewCell.h
//  中企资源
//
//  Created by 王落凡 on 15/6/16.
//  Copyright (c) 2015年 王落凡. All rights reserved.
//

#import "ZQServiceAgencySuccessExampleTableViewCell.h"
#import <UIKit/UIKit.h>

@interface ZQMediaReportTableViewCell : ZQServiceAgencySuccessExampleTableViewCell

-(void)setRatingScore:(CGFloat)ratingScore;
-(void)setAttentionCount:(NSInteger)attentionCount;

@end
