//
//  ZQRecommendTableViewCell.m
//  中企资源
//
//  Created by 王落凡 on 15/5/28.
//  Copyright (c) 2015年 王落凡. All rights reserved.
//

#import "ZQRecommendTableViewCell.h"

#define kImageWidth 80.0f
#define kTextLabelHeightRatio 0.2f
#define kContentGapSize 5
#define kTableViewCellHeight 60

@interface ZQRecommendTableViewCell () {
    UIView* whiteShadowView;
}

@end

@implementation ZQRecommendTableViewCell

@synthesize imageView;
@synthesize textLabel;
@synthesize detailTextLabel;

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    
    if(self) {
        [self setSelectionStyle:UITableViewCellSelectionStyleNone];
        [self setBackgroundColor:[UIColor colorWithRed:((CGFloat)231)/255 green:((CGFloat)232)/255 blue:((CGFloat)234)/255 alpha:1.0f]];
        
        //灰色阴影
        UIView* grayShadowView = [[UIView alloc] initWithFrame:CGRectMake(kContentGapSize - 1, kContentGapSize - 1, kScreenWidth - 2* kContentGapSize + 2, kTableViewCellHeight + 2)];
        [grayShadowView setBackgroundColor:[UIColor colorWithRed:((CGFloat)223)/255 green:((CGFloat)223)/255 blue:((CGFloat)224)/255 alpha:1.0f]];
        [self addSubview:grayShadowView];
        
        //白色阴影
        whiteShadowView = [[UIView alloc] initWithFrame:CGRectMake(kContentGapSize - 0.5, kContentGapSize - 0.5, kScreenWidth - 2* kContentGapSize + 1, kTableViewCellHeight + 1)];
        [whiteShadowView setBackgroundColor:[UIColor whiteColor]];
        [self addSubview:whiteShadowView];
        
        UIView* bottomView = [[UIView alloc] initWithFrame:CGRectMake(kContentGapSize, kContentGapSize, kScreenWidth - 2* kContentGapSize, kTableViewCellHeight)];
        [bottomView setBackgroundColor:[UIColor colorWithRed:((CGFloat)242)/255 green:((CGFloat)242)/255 blue:((CGFloat)244)/255 alpha:5.0f]];
        [self addSubview:bottomView];
        
        self.imageView = [[UIImageView alloc] initWithFrame:CGRectMake(kContentGapSize, kContentGapSize, kImageWidth, kTableViewCellHeight - 2* kContentGapSize)];
        [self.imageView setContentMode:UIViewContentModeScaleAspectFit];
        
        self.textLabel = [[UILabel alloc] initWithFrame:CGRectMake(self.imageView.frame.origin.x + self.imageView.frame.size.width + kContentGapSize, kContentGapSize, bottomView.frame.size.width - self.imageView.frame.origin.x - self.imageView.frame.size.width - kContentGapSize, kTableViewCellHeight * kTextLabelHeightRatio - kContentGapSize)];
        [self.textLabel setFont:[UIFont systemFontOfSize:12.0f]];
        
        self.detailTextLabel = [[UILabel alloc] initWithFrame:CGRectMake(self.textLabel.frame.origin.x, self.textLabel.frame.origin.y + self.textLabel.frame.size.height + kContentGapSize, self.textLabel.frame.size.width, kTableViewCellHeight * (1 - kTextLabelHeightRatio) - kContentGapSize)];
        [self.detailTextLabel setFont:[UIFont systemFontOfSize:10.0f]];
        [self.detailTextLabel setTextColor:[UIColor lightGrayColor]];
        [self.detailTextLabel setNumberOfLines:0];
        
        [bottomView addSubview:self.imageView];
        [bottomView addSubview:self.textLabel];
        [bottomView addSubview:self.detailTextLabel];
    }
    
    return self;
}

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

-(void)setCellBackgroundColor:(UIColor*)backgroundColor {
    [whiteShadowView setBackgroundColor:backgroundColor];
    return ;
}

@end
