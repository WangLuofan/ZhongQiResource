//
//  ZQBaseRscReplyViewController.m
//  中企资源
//
//  Created by 王落凡 on 15/6/12.
//  Copyright (c) 2015年 王落凡. All rights reserved.
//

#import <AssetsLibrary/AssetsLibrary.h>
#import "ZQImagePickerViewController.h"
#import "ZQNavigationViewController.h"
#import "ZQBaseRscReplyViewController.h"

#define kImagePickerMaxmunCount 10
#define kControlMargin 5
#define kCollectionViewCellSize 49
#define kHeaderTitleLabelHeight 15
#define kHeaderTitleViewHeight 100
#define kShadowRadius 0.5f

@interface ZQBaseRscReplyViewController ()<UITextViewDelegate,UICollectionViewDataSource,UICollectionViewDelegate> {
    UIView* headerTitleView;
    UIView* replyContentView;
    
    UILabel* headerTitleLabel;
    UILabel* commentContentLabel;
    
    UIButton* imageAddButton;
    
    NSMutableArray* selectedImageArray;
}

@end

@implementation ZQBaseRscReplyViewController

- (instancetype)init
{
    self = [super init];
    if (self) {
        [self generateHeaderTitleView];
    }
    return self;
}

-(void)setTitle:(NSString *)title CommentContent:(NSString *)commentContent {
    [headerTitleLabel setText:title];
    [commentContentLabel setText:commentContent];
    return ;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setTitle:@"资源回复"];
    [self generateReplyContentView];
    
    [self.view addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(backgroundTapped:)]];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"回复" style:UIBarButtonItemStylePlain target:self action:@selector(replyButtonPressed:)];
    
    return ;
}

-(void)replyButtonPressed:(UIBarButtonItem*)sender {
    return ;
}

-(void)generateHeaderTitleView {
    headerTitleView = [self generateShadowViewWithHeight:kHeaderTitleViewHeight yPosition:0];
    headerTitleLabel = [[UILabel alloc] initWithFrame:CGRectMake(kControlMargin, kControlMargin, headerTitleView.bounds.size.width - 2*kControlMargin, kHeaderTitleLabelHeight)];
    [headerTitleLabel setFont:[UIFont systemFontOfSize:14.0f]];
    [headerTitleView addSubview:headerTitleLabel];
    
    commentContentLabel = [[UILabel alloc] initWithFrame:CGRectMake(headerTitleLabel.frame.origin.x, headerTitleLabel.frame.origin.y + headerTitleLabel.frame.size.height, headerTitleLabel.frame.size.width, headerTitleView.bounds.size.height - headerTitleLabel.frame.origin.y - headerTitleLabel.frame.size.height)];
    [commentContentLabel setNumberOfLines:0];
    [commentContentLabel setTextColor:[UIColor lightGrayColor]];
    [commentContentLabel setFont:[UIFont systemFontOfSize:12.0f]];
    [headerTitleView addSubview:commentContentLabel];
    return ;
}

-(void)generateReplyContentView {
    replyContentView = [self generateShadowViewWithHeight:250 yPosition:kControlMargin + kHeaderTitleViewHeight];
    
    self.replyTextView = [[UITextView alloc] initWithFrame:CGRectMake(kControlMargin, kControlMargin, replyContentView.bounds.size.width - 2*kControlMargin, kHeaderTitleViewHeight)];
    [self.replyTextView setDelegate:self];
    [self.replyTextView setFont:[UIFont systemFontOfSize:12.0f]];
    
    UILabel* placeHolderLabel = [[UILabel alloc] initWithFrame:CGRectMake(2, 5, 0, 0)];
    [placeHolderLabel setFont:[UIFont systemFontOfSize:12.0f]];
    [placeHolderLabel setTextColor:[UIColor lightGrayColor]];
    [placeHolderLabel setText:@"请输入您想要回复的内容"];
    [placeHolderLabel sizeToFit];
    [self.replyTextView addSubview:placeHolderLabel];
    [replyContentView addSubview:self.replyTextView];
    
    if(selectedImageArray == nil)
        selectedImageArray = [[NSMutableArray alloc] init];
    
    if(imageAddButton == nil) {
        imageAddButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [imageAddButton setImage:[UIImage imageNamed:@"dd"] forState:UIControlStateNormal];
        [imageAddButton setFrame:CGRectMake(0,0,kCollectionViewCellSize,kCollectionViewCellSize)];
        [imageAddButton addTarget:self action:@selector(imageAddButtonPressed:) forControlEvents:UIControlEventTouchUpInside];
        [selectedImageArray addObject:imageAddButton];
    }
    
    UICollectionViewFlowLayout* flowLayout = [[UICollectionViewFlowLayout alloc] init];
    [flowLayout setItemSize:CGSizeMake(kCollectionViewCellSize, kCollectionViewCellSize)];
    [flowLayout setSectionInset:UIEdgeInsetsMake(kControlMargin, kControlMargin, 0, 0)];
    [flowLayout setScrollDirection:UICollectionViewScrollDirectionVertical];
    
    self.collectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(0, self.replyTextView.frame.origin.y + self.replyTextView.frame.size.height + kControlMargin, self.replyTextView.frame.size.width + kControlMargin, 2*(replyContentView.bounds.size.height - self.replyTextView.frame.origin.y - self.replyTextView.frame.size.height - 2*kControlMargin)) collectionViewLayout:flowLayout];
    [self.collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:@"RscReplyCollectionViewCellIdentifier"];
    [self.collectionView setDelegate:self];
    [self.collectionView setDataSource:self];
    [self.collectionView setBackgroundColor:[UIColor clearColor]];
    [replyContentView addSubview:self.collectionView];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(imagePickerChoosenCompletionNotification:) name:ZQImagePickerChoosenCompletionNotification object:nil];
    
    return ;
}

-(void)imagePickerChoosenCompletionNotification:(NSNotification*)notification {
    [selectedImageArray removeObject:imageAddButton];
    
    for (UIImage* img in (NSArray*)notification.userInfo[@"assets"]) {
        if(selectedImageArray.count != kImagePickerMaxmunCount)
            [selectedImageArray addObject:img];
    }
    
    if(selectedImageArray.count != kImagePickerMaxmunCount)
       [selectedImageArray addObject:imageAddButton];
    
    [self.collectionView reloadData];
    return ;
}

-(void)imageAddButtonPressed:(UIButton*)sender {
    ZQImagePickerViewController* imagePickerController = [[ZQImagePickerViewController alloc] init];
    [self presentViewController:[[ZQNavigationViewController alloc] initWithRootViewController:imagePickerController] animated:YES completion:^{
    }];
    return ;
}

-(UIView*)generateShadowViewWithHeight:(CGFloat)height yPosition:(CGFloat)yPosition {
    UIView* grayView = [[UIView alloc] initWithFrame:CGRectMake(kControlMargin, yPosition + kControlMargin, self.view.bounds.size.width - 2*kControlMargin, height)];
    [grayView setBackgroundColor:[UIColor colorWithRed:((CGFloat)223)/255 green:((CGFloat)223)/255 blue:((CGFloat)224)/255 alpha:1.0f]];
    [self.view addSubview:grayView];
    
    UIView* whiteView = [[UIView alloc] initWithFrame:CGRectMake(kShadowRadius, kShadowRadius, grayView.bounds.size.width - 2*kShadowRadius, grayView.bounds.size.height - 2*kShadowRadius)];
    [whiteView setBackgroundColor:[UIColor whiteColor]];
    [grayView addSubview:whiteView];
    
    [whiteView addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(backgroundTapped:)]];
    
    return whiteView;
}

-(void)textViewDidChange:(UITextView *)textView {

    for (UIView* subView in textView.subviews) {
        if([subView isKindOfClass:[UILabel class]]) {
            if(textView.text.length == 0)
                [subView setHidden:NO];
            else
                [subView setHidden:YES];
            
            break;
        }
    }
    
    return ;
}

-(void)backgroundTapped:(UIGestureRecognizer*)sender {
    [self.replyTextView resignFirstResponder];
    return ;
}

-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return selectedImageArray.count;
}

-(UICollectionViewCell*)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    UICollectionViewCell* cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"RscReplyCollectionViewCellIdentifier" forIndexPath:indexPath];
    [cell addGestureRecognizer:[[UILongPressGestureRecognizer alloc] initWithTarget:self action:@selector(longPressedGestureHandler:)]];
    
    if([selectedImageArray[indexPath.row] isKindOfClass:[UIImage class]]) {
        UIImageView* imageView = [[UIImageView alloc] initWithFrame:cell.contentView.bounds];
        [imageView setImage:(UIImage*)selectedImageArray[indexPath.row]];
        [cell.contentView addSubview:imageView];
    }else
        [cell.contentView addSubview:(UIView *)selectedImageArray[indexPath.row]];
    return cell;
}

-(void)longPressedGestureHandler:(UIGestureRecognizer*)sender {
    UICollectionViewCell* cell = (UICollectionViewCell*)sender.view;
    NSIndexPath* indexPath = [self.collectionView indexPathForCell:cell];
    [selectedImageArray removeObjectAtIndex:indexPath.row];
    [self.collectionView reloadData];
    return ;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
