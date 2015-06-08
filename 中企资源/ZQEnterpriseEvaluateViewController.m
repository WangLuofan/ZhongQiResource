//
//  ZQEnterpriseEvaluateViewController.m
//  中企资源
//
//  Created by 王落凡 on 15/6/3.
//  Copyright (c) 2015年 王落凡. All rights reserved.
//

#import "ZQResponseLabel.h"
#import "ZQEvaluateView.h"
#import "ZQCommentBar.h"
#import "ZQNavigationViewController.h"
#import "ZQNewestTableViewCell.h"
#import "ZQEnterpriseCommentViewController.h"
#import "ZQEnterpriseEvaluateViewController.h"

#define kTopEvaluateViewHeight 80
#define kHeaderLabelHeight 30
#define kBottomCommentBarHeight 40

@interface ZQEnterpriseEvaluateViewController () <ZQEvaluateViewDelegate,UITableViewDataSource,UITableViewDelegate,ZQNewestTableViewCellDelegate,ZQCommentBarDelegate> {
    ZQEvaluateView* evaluateView;
    ZQCommentBar* commentBar;
    NSMutableArray* commentCellArray;
    NSDictionary* commentUserDict;
    ZQNewestTableViewCell* commentTableViewCell;
}

@end

@implementation ZQEnterpriseEvaluateViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setTitle:@"企业评价"];
    
    evaluateView = [[ZQEvaluateView alloc] initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, kTopEvaluateViewHeight)];
    [evaluateView setDelegate:self];
    [evaluateView setScore:3.5f commentCount:88];
    [self.view addSubview:evaluateView];
    
    self.tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, evaluateView.frame.origin.y + evaluateView.frame.size.height, self.view.bounds.size.width, self.view.bounds.size.height - kTopEvaluateViewHeight - kNavStatusHeight) style:UITableViewStylePlain];
    [self.tableView setSeparatorStyle:UITableViewCellSeparatorStyleNone];
    [self.tableView setBackgroundColor:[UIColor clearColor]];
    [self.tableView addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tableViewTapped:)]];
    [self.tableView setDelaysContentTouches:NO];
    [self.tableView setDelegate:self];
    [self.tableView setDataSource:self];
    [self.view addSubview:self.tableView];
    
    UILabel* headerLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, self.tableView.bounds.size.width, kHeaderLabelHeight)];
    [headerLabel setText:@"    最新动态"];
    [self.tableView setTableHeaderView:headerLabel];
    
    commentBar = [[ZQCommentBar alloc] initWithFrame:CGRectMake(0, self.view.bounds.size.height - kNavStatusHeight - kBottomCommentBarHeight, self.view.bounds.size.width, kBottomCommentBarHeight)];
    [commentBar setDelegate:self];
    
    commentCellArray = [[NSMutableArray alloc] init];
    
    return ;
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

/*
 header:头像
 enterprise:企业名称
 userName:用户名
 commentContent:评论内容
 dateTime:评论时间
 */
-(void)commentWithUserInfoDict:(NSDictionary *)infoDict {
    ZQNewestTableViewCell* cell = [[ZQNewestTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"NewestTableViewCellIdentifier"];
    [cell setDelegate:self];
    [cell.headerImageView setImage:((UIImage *)infoDict[@"header"])];
    [cell.enterpriseNameLabel setText:((NSString *)infoDict[@"enterprise"])];
    [cell.userNameLabel setText:((NSString *)infoDict[@"userName"])];
    [cell setCommentContentText:((NSString *)infoDict[@"commentContent"])];
    
    NSString* dateTime = (NSString*)infoDict[@"dateTime"];
    if(dateTime == nil) {
        NSDateFormatter* formatter = [[NSDateFormatter alloc] init];
        [formatter setDateFormat:@"yyyy-MM-dd    HH:mm:ss"];
        dateTime = [formatter stringFromDate:[NSDate date]];
    }
    [cell.dateTimeLabel setText:dateTime];
    
    [commentCellArray insertObject:cell atIndex:0];
    [self.tableView insertRowsAtIndexPaths:@[[NSIndexPath indexPathForRow:0 inSection:0]] withRowAnimation:UITableViewRowAnimationAutomatic];
    
    return ;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return commentCellArray.count;
}

-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    ZQNewestTableViewCell* cell = [tableView dequeueReusableCellWithIdentifier:@"NewestTableViewCellIdentifier"];
    if(cell == nil)
        cell = (ZQNewestTableViewCell*)commentCellArray[indexPath.row];
    return cell;
}

-(void)evaluateView:(ZQEvaluateView *)evaluateView commentButtonPressed:(UIButton *)commentButton {
    ZQEnterpriseCommentViewController* commentController = [[ZQEnterpriseCommentViewController alloc] init];
    [self presentViewController:[[ZQNavigationViewController alloc] initWithRootViewController:commentController] animated:YES completion:^{
        [commentController setPushViewController:self];
    }];
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return [((ZQNewestTableViewCell*)commentCellArray[indexPath.row]) cellHeight];
}

-(void)tableViewTapped:(UIGestureRecognizer*)sender {
    [commentBar resignFirstResponder];
    return ;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)tableViewCell:(ZQNewestTableViewCell *)tableViewCell CommentInfo:(NSDictionary *)commentInfo {
    [commentBar removeFromSuperview];
    commentUserDict = commentInfo;
    
    [commentBar setTextViewPlaceHolder:[NSString stringWithFormat:@"回复:%@",commentInfo[@"userName"]]];
    
    commentTableViewCell = tableViewCell;
    [self.view addSubview:commentBar];
    [commentBar becomeFirstResponder];
    
    return ;
}

-(void)commentBar:(ZQCommentBar *)commentBar sendCommentContent:(NSString *)commentContent {
    [commentTableViewCell addReplyContentWithFrom:@"小猫" Content:commentContent];
//    NSIndexPath* indexPath = [self.tableView indexPathForCell:commentTableViewCell];
//    [self.tableView reloadRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationAutomatic];
    [self.tableView reloadData];
    return ;
}

@end
