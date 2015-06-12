//
//  ZQPlatformNotificationViewController.m
//  中企资源
//
//  Created by 王落凡 on 15/5/29.
//  Copyright (c) 2015年 王落凡. All rights reserved.
//

#import "ZQNavigationViewController.h"
#import "ZQNotificationEvaluateViewController.h"
#import "ZQPlatformNotificationTableViewCell.h"
#import "ZQPlatformNotificationViewController.h"

#define kTableViewCellHeight 105

@interface ZQPlatformNotificationViewController () <UITableViewDataSource,UITableViewDelegate>

@end

@implementation ZQPlatformNotificationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setTitle:@"平台通告"];
    
    self.tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, self.view.bounds.size.height - kNavStatusHeight) style:UITableViewStylePlain];
    [self.tableView setBackgroundColor:[UIColor clearColor]];
    [self.tableView setDelegate:self];
    [self.tableView setDataSource:self];
    [self.view addSubview:self.tableView];
    
    return ;
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 4;
}

-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    ZQPlatformNotificationTableViewCell* cell = (ZQPlatformNotificationTableViewCell*)[tableView dequeueReusableCellWithIdentifier:@"PlatformNotificationTableViewCellIdentifier"];
    if(cell == nil)
        cell = [[ZQPlatformNotificationTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"PlatformNotificationTableViewCellIdentifier"];
    
    [cell.titleLabel setText:@"通告标题:关于严厉打击不良信息的通告"];
    [cell.contentLabel setText:@"萍乡电子商务创业园，做有萍乡烙印的电商品牌！！！这里是一个任由你发挥创业的平台，这里所需要的仅仅是你的热忱与才智，诚邀加入萍乡电子商务创业园。"];
    [cell setBrowseCount:59 ReplyCount:60];
        
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    ZQPlatformNotificationTableViewCell* cell = (ZQPlatformNotificationTableViewCell*)[tableView cellForRowAtIndexPath:indexPath];
    ZQNotificationEvaluateViewController* notificationController = [[ZQNotificationEvaluateViewController alloc] init];
    [notificationController setEvaluateHeaderTitle:cell.titleLabel.text CommentContent:cell.contentLabel.text];
    [self presentViewController:[[ZQNavigationViewController alloc] initWithRootViewController:notificationController] animated:YES completion:^{
    }];
    return ;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return kTableViewCellHeight;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
