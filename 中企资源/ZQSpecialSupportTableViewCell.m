//
//  ZQSpecialSupportTableViewCell.m
//  中企资源
//
//  Created by 王落凡 on 15/6/2.
//  Copyright (c) 2015年 王落凡. All rights reserved.
//

#import "ZQSpecialSupportTableViewCell.h"

@interface ZQSpecialSupportTableViewCell () {
    
}

@end

@implementation ZQSpecialSupportTableViewCell

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    
    if(self) {
        [self setContractButtonImage:[UIImage imageNamed:@"ptfzsb"]];
    }
    
    return self;
}

@end
