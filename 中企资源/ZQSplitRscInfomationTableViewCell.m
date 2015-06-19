//
//  ZQSplitRscInfomationTableViewCell.m
//  中企资源
//
//  Created by 王落凡 on 15/6/19.
//  Copyright (c) 2015年 王落凡. All rights reserved.
//

#import "ZQSplitRscInfomationTableViewCell.h"

@implementation ZQSplitRscInfomationTableViewCell

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    
    if(self) {
        [self setWillShowBrowseButtons:NO];
    }
    
    return self;
}

@end
