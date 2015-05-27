//
//  MoreViewController.m
//  中企资源
//
//  Created by 王落凡 on 15/5/26.
//  Copyright (c) 2015年 王落凡. All rights reserved.
//

#import "MoreViewController.h"

@interface MoreViewController ()

@end

@implementation MoreViewController

-(instancetype)init {
    self = [super init];
    if(self) {
        [self.tabBarItem setTitleTextAttributes:@{
                                                  NSForegroundColorAttributeName:[UIColor whiteColor],
                                                  NSFontAttributeName:[UIFont systemFontOfSize:14.0f]
                                                  } forState:UIControlStateNormal];
        [self.tabBarItem setTitle:@"更多"];
        [self.tabBarItem setImage:[UIImage imageNamed:@"more"]];
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view setBackgroundColor:[UIColor orangeColor]];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
