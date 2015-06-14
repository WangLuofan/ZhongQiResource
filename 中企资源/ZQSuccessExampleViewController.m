//
//  ZQSuccessExampleViewController.m
//  中企资源
//
//  Created by 王落凡 on 15/6/13.
//  Copyright (c) 2015年 王落凡. All rights reserved.
//

#import "ZQSuccessExampleViewController.h"

@interface ZQSuccessExampleViewController () {
    UILabel* exampleLabel;
}

@end

@implementation ZQSuccessExampleViewController

-(instancetype)initWithTitle:(NSString *)title {
    self = [super init];
    
    if(self) {
        [self setTitle:title];
        
        exampleLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, self.view.bounds.size.height - kNavStatusHeight)];
        [exampleLabel setFont:[UIFont systemFontOfSize:12.0f]];
        [exampleLabel setTextColor:[UIColor grayColor]];
        [exampleLabel setNumberOfLines:0];
        [exampleLabel setBackgroundColor:[UIColor clearColor]];
        [self.view addSubview:exampleLabel];
    }
    
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)setExampleContentText:(NSString *)contentText {
    [exampleLabel setText:contentText];
    return ;
}

@end
