//
//  ZQServiceAgencyTableViewCell.m
//  中企资源
//
//  Created by 王落凡 on 15/6/3.
//  Copyright (c) 2015年 王落凡. All rights reserved.
//

#import "ZQServiceAgencyTableViewCell.h"

@interface ZQServiceAgencyTableViewCell ()

@end

@implementation ZQServiceAgencyTableViewCell

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    
    if(self) {
        [self setContractButtonImage:[UIImage imageNamed:@"lxwm"]];
    }
    
    return self;
}

@end
