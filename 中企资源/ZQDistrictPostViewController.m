//
//  ZQDistrictPostViewController.m
//  中企资源
//
//  Created by 王落凡 on 15/6/3.
//  Copyright (c) 2015年 王落凡. All rights reserved.
//

#import "ZQDistrictRscRecommendTableViewCell.h"
#import "ZQEnterpriseDetailInfoTableViewCell.h"
#import "ZQEnterpriseEvaluateCommentTableViewCell.h"
#import "ZQDistrictRscRecommendViewController.h"
#import "ZQDistrictRscRecommendDetailViewController.h"
#import "ZQDistrictPostViewController.h"
#import "ZQWantPostViewController.h"
#import "ZQNavigationViewController.h"

#define kTableViewCellHeight 105
#define kTableViewHeaderHeight 30
#define kDefaultTableViewCellHeight 50

@interface ZQDistrictPostViewController ()<UITableViewDataSource,UITableViewDelegate,ZQEnterpriseEvaluateCommentTableViewCellDelegate,ZQWantPostViewControllerDelegate> {
    NSMutableArray* EvaluateCommentTableViewCellArray;
}

@end

@implementation ZQDistrictPostViewController

-(instancetype)initWithTitle:(NSString *)title {
    self = [super init];
    
    if(self) {
        [self setTitle:title];
    }
    
    return self;
}

-(void)addEnterpriseEvaluateCommentWithHeaderImage:(UIImage*)headerImage userName:(NSString*)userName commentTitle:(NSString*)commentTitle contentText:(NSString*)contentText commentImageContents:(NSArray*)commentImageContents {
    ZQEnterpriseEvaluateCommentTableViewCell* cell = [[ZQEnterpriseEvaluateCommentTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"EnterpriseEvaluateCommentTableViewCellIdentifier"];
    [cell setDelegate:self];
    
//    [((ZQEnterpriseEvaluateCommentTableViewCell*)cell) setDelegate:self];
//    [((ZQEnterpriseEvaluateCommentTableViewCell*)cell).headerImageView setImage:[UIImage imageNamed:@"tx1"]];
//    [((ZQEnterpriseEvaluateCommentTableViewCell*)cell).nameLabel setText:@"帅帅"];
//    [((ZQEnterpriseEvaluateCommentTableViewCell*)cell).titleLabel setText:@"入园企业的一些心得分享"];
//    [((ZQEnterpriseEvaluateCommentTableViewCell*)cell) setCommentContentText:@"不错的资源管理平台，不错哦！！！不错的资源管理平台，不错哦！！！不错的资源管理平台，不错哦！！！！"];
//    if(indexPath.row == 1)
//        [((ZQEnterpriseEvaluateCommentTableViewCell*)cell) setCommentImageContent:@[[UIImage imageNamed:@"test"],[UIImage imageNamed:@"test"],[UIImage imageNamed:@"test"],[UIImage imageNamed:@"test"],[UIImage imageNamed:@"test"],[UIImage imageNamed:@"test2"],[UIImage imageNamed:@"test2"],[UIImage imageNamed:@"test"],[UIImage imageNamed:@"test2"]]];
    
    [cell.headerImageView setImage:headerImage];
    [cell.nameLabel setText:userName];
    [cell.titleLabel setText:commentTitle];
    [cell setCommentContentText:contentText];
    
    if(commentImageContents != nil)
        [cell setCommentImageContent:commentImageContents];
    
    [EvaluateCommentTableViewCellArray insertObject:cell atIndex:0];
    [self.tableView insertRowsAtIndexPaths:@[[NSIndexPath indexPathForRow:0 inSection:2]] withRowAnimation:UITableViewRowAnimationAutomatic];
    return ;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, self.view.bounds.size.height - kNavStatusHeight) style:UITableViewStyleGrouped];
    [self.tableView setSeparatorStyle:UITableViewCellSeparatorStyleNone];
    [self.tableView setBackgroundColor:[UIColor clearColor]];
    [self.tableView setDelegate:self];
    [self.tableView setDataSource:self];
    [self.view addSubview:self.tableView];
    
    if(EvaluateCommentTableViewCellArray == nil)
        EvaluateCommentTableViewCellArray = [[NSMutableArray alloc] init];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 3;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if(section == 0)
        return 1;
    else if (section == 1)
        return 2;
    
    return EvaluateCommentTableViewCellArray.count;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    if(indexPath.section == 0)
        return kTableViewCellHeight;
    else if(indexPath.section == 1)
        return kDefaultTableViewCellHeight;
    return [((ZQEnterpriseEvaluateCommentTableViewCell*)EvaluateCommentTableViewCellArray[indexPath.row]) cellHeight];
}

-(void)cellButtonPressed:(UIButton*)sender {
    switch (sender.tag) {
        case 0:
            break;
        case 1:
        {
            dispatch_async(dispatch_get_main_queue(), ^{
                ZQWantPostViewController* postController = [[ZQWantPostViewController alloc] init];
                [postController setDelegate:self];
                [self presentViewController:[[ZQNavigationViewController alloc] initWithRootViewController:postController] animated:YES completion:^{
                }];
            });
        }
            break;
        case 2:
            break;
        case 3:
            break;
        default:
            break;
    }
    return ;
}

-(UIView*)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    if(section == 1) {
        UIView* headerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, tableView.frame.size.width, kTableViewHeaderHeight)];
        
        UIButton* recommendButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [recommendButton setImage:[UIImage imageNamed:@"cnxh"] forState:UIControlStateNormal];
        [recommendButton setTitle:@"商圈资源推荐" forState:UIControlStateNormal];
        [recommendButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [recommendButton setFrame:CGRectMake(0, 0, headerView.bounds.size.width / 2, recommendButton.imageView.image.size.height / 2)];
        [recommendButton setEnabled:NO];
        [recommendButton.titleLabel setFont:[UIFont systemFontOfSize:12.0f]];
        [recommendButton setContentHorizontalAlignment:UIControlContentHorizontalAlignmentLeft];
        [recommendButton.imageView setContentMode:UIViewContentModeScaleAspectFit];
        [recommendButton setCenter:CGPointMake(recommendButton.center.x, headerView.bounds.size.height / 2)];
        [headerView addSubview:recommendButton];
        
        UIButton* showMoreButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [showMoreButton setImage:[UIImage imageNamed:@"ckgd"] forState:UIControlStateNormal];
        [showMoreButton setTitleColor:[UIColor lightGrayColor] forState:UIControlStateNormal];
        [showMoreButton setTitleColor:[UIColor blackColor] forState:UIControlStateHighlighted];
        [showMoreButton setTitle:@"查看更多" forState:UIControlStateNormal];
        [showMoreButton.titleLabel setFont:[UIFont systemFontOfSize:12.0f]];
        [showMoreButton setFrame:CGRectMake(recommendButton.frame.origin.x + recommendButton.frame.size.width, recommendButton.frame.origin.y, recommendButton.frame.size.width, recommendButton.frame.size.height)];
        [showMoreButton.imageView setContentMode:UIViewContentModeScaleAspectFit];
//        [showMoreButton setContentHorizontalAlignment:UIControlContentHorizontalAlignmentRight];
        [showMoreButton setImageEdgeInsets:UIEdgeInsetsMake(0, showMoreButton.frame.size.width - showMoreButton.imageView.image.size.width, 0, 0)];
        [showMoreButton setTitleEdgeInsets:UIEdgeInsetsMake(0, showMoreButton.imageView.image.size.width, 0, 0)];
        [showMoreButton addTarget:self action:@selector(showMoreButtonPressed:) forControlEvents:UIControlEventTouchUpInside];
        [headerView addSubview:showMoreButton];
        
        return headerView ;
    }
    
    return nil;
}

-(void)showMoreButtonPressed:(UIButton*)sender {
    
    dispatch_async(dispatch_get_main_queue(), ^{
        ZQDistrictRscRecommendViewController* recommandController = [[ZQDistrictRscRecommendViewController alloc] init];
        [self presentViewController:[[ZQNavigationViewController alloc] initWithRootViewController:recommandController] animated:YES completion:^{
        }];
    });
    
    return ;
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    if(section == 0 || section == 2)
        return 1;
    return kTableViewHeaderHeight;
}

-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    if(section == 0)
        return 10;
    return 1;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    if(indexPath.section == 1) {
       dispatch_async(dispatch_get_main_queue(), ^{
           ZQDistrictRscRecommendDetailViewController* detailController = [[ZQDistrictRscRecommendDetailViewController alloc] init];
           [self presentViewController:[[ZQNavigationViewController alloc] initWithRootViewController:detailController] animated:YES completion:^{
           }];
       });
    }
    return ;
}

-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell* cell = nil;
    
    if(indexPath.section == 0) {
        cell = [tableView dequeueReusableCellWithIdentifier:@"EnterpriseDetailInfoTableViewCellIdentifier"];
        if(cell == nil) {
            cell = [[ZQEnterpriseDetailInfoTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"EnterpriseDetailInfoTableViewCellIdentifier"];
            [((ZQEnterpriseDetailInfoTableViewCell*)cell).attentionButton addTarget:self action:@selector(cellButtonPressed:) forControlEvents:UIControlEventTouchUpInside];
            [((ZQEnterpriseDetailInfoTableViewCell*)cell).shareButton addTarget:self action:@selector(cellButtonPressed:) forControlEvents:UIControlEventTouchUpInside];
            [((ZQEnterpriseDetailInfoTableViewCell*)cell).postButton addTarget:self action:@selector(cellButtonPressed:) forControlEvents:UIControlEventTouchUpInside];
            [((ZQEnterpriseDetailInfoTableViewCell*)cell).nameButton addTarget:self action:@selector(cellButtonPressed:) forControlEvents:UIControlEventTouchUpInside];
        }
        [((ZQEnterpriseDetailInfoTableViewCell*)cell).logoImageView setImage:[UIImage imageNamed:@"tx"]];
        [((ZQEnterpriseDetailInfoTableViewCell*)cell).founderLabel setText:@"创建人:帅帅"];
        [((ZQEnterpriseDetailInfoTableViewCell*)cell).postLabel setText:@"帖子:289"];
        [((ZQEnterpriseDetailInfoTableViewCell*)cell).receiveLabel setText:@"回复:4890"];
        [((ZQEnterpriseDetailInfoTableViewCell*)cell).districtLabel setText:@"萍乡电子商务创业园圈"];
        [((ZQEnterpriseDetailInfoTableViewCell*)cell).detailLabel setText:@"萍乡电子商务创业园，做有萍乡烙印的电商品牌!...这里是一个任由你发挥创造的平台，这里所需要的仅仅是你的热忱写才智，诚邀加入萍乡电子商务创业园"];
    }else if(indexPath.section == 1) {
        cell = [tableView dequeueReusableCellWithIdentifier:@"DistrictRscRecommendTableViewCellIdentifier"];
        if(cell == nil)
            cell = [[ZQDistrictRscRecommendTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"DistrictRscRecommendTableViewCellIdentifier"];
        [((ZQDistrictRscRecommendTableViewCell*)cell) setTitle:@"供求资源:中企招人事，月薪1W元" Detail:@"中企招人事，月薪1W元，一年工作以上者从优"];
    }
    else {
        return (ZQEnterpriseEvaluateCommentTableViewCell*)EvaluateCommentTableViewCellArray[indexPath.row];
    }
    
    return cell;
}

-(void)tableViewCell:(UITableViewCell *)tableViewCell browseImage:(UIImage *)image {
    [super.navigationController setToolbarHidden:YES animated:YES];
    [super.navigationController setNavigationBarHidden:YES animated:YES];
    
    UIView* contentView = [[UIView alloc] initWithFrame:self.view.bounds];
    [contentView addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(contentViewTapped:)]];
    [self.view addSubview:contentView];
    
    UIView* coverView = [[UIView alloc] initWithFrame:contentView.bounds];
    [coverView setBackgroundColor:[UIColor blackColor]];
    [coverView setAlpha:0.5f];
    [contentView addSubview:coverView];
    
    UIImageView* imageView = [[UIImageView alloc] initWithFrame:contentView.bounds];
    [imageView setImage:image];
    [imageView setContentMode:UIViewContentModeScaleAspectFit];
    [contentView addSubview:imageView];
    
    return ;
}

- (void)contentViewTapped:(UITapGestureRecognizer *)sender {
    [sender.view removeFromSuperview];
    
    [super.navigationController setToolbarHidden:NO animated:YES];
    [super.navigationController setNavigationBarHidden:NO animated:YES];
    
    return ;
}

-(void)postWithTitle:(NSString *)title PostTextContent:(NSString *)postTextContent PostImageContent:(NSArray *)postImageContent {
    [self addEnterpriseEvaluateCommentWithHeaderImage:[UIImage imageNamed:@"tx1"] userName:@"帅帅" commentTitle:title contentText:postTextContent commentImageContents:postImageContent];
    return ;
}

@end
