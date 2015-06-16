//
//  ZQSupportDetailViewController.m
//  中企资源
//
//  Created by 王落凡 on 15/6/13.
//  Copyright (c) 2015年 王落凡. All rights reserved.
//

#import "ZQSupportDetailViewController.h"

#define kBottomHeight 60
#define kControlMargin 20

@interface ZQSupportDetailViewController () {
    UILabel* descLabel;
    UIButton* attentionCountButton;
}

@end

@implementation ZQSupportDetailViewController

-(instancetype)initWithTitle:(NSString *)title {
    self = [super init];
    
    if(self) {
        [self setTitle:title];
    }
    
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    descLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, self.view.bounds.size.height - kNavStatusHeight - kBottomHeight)];
    [descLabel setBackgroundColor:[UIColor clearColor]];
    [descLabel setFont:[UIFont systemFontOfSize:12.0f]];
    [descLabel setTextColor:[UIColor grayColor]];
    [descLabel setNumberOfLines:0];
    [self.view addSubview:descLabel];
    
    attentionCountButton = [[UIButton alloc] initWithFrame:CGRectMake(0, descLabel.frame.origin.y + descLabel.frame.size.height + kControlMargin / 4, self.view.bounds.size.width - kControlMargin, kControlMargin)];
    [attentionCountButton setContentHorizontalAlignment:UIControlContentHorizontalAlignmentRight];
    [attentionCountButton setBackgroundColor:[UIColor clearColor]];
    [attentionCountButton setTitleColor:[UIColor lightGrayColor] forState:UIControlStateNormal];
    [attentionCountButton.imageView setContentMode:UIViewContentModeScaleAspectFit];
    [attentionCountButton setImage:[UIImage imageNamed:@"dp2"] forState:UIControlStateNormal];
    [attentionCountButton.titleLabel setFont:[UIFont systemFontOfSize:12.0f]];
    [attentionCountButton setEnabled:NO];
    [self.view addSubview:attentionCountButton];
    
    //关注
    
    
    return ;
}

-(void)setAttentionCount:(NSInteger)attentionCount {
    [attentionCountButton setTitle:[NSString stringWithFormat:@"已有%ld人关注",(long)attentionCount] forState:UIControlStateNormal];
    return ;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
