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
#import "ZQBaseImageReplyViewController.h"

#define kDeleteButtonSize 15
#define kImagePickerMaxmunCount 10
#define kControlMargin 5
#define kCollectionViewCellSize 49
#define kReplyTextViewHeight 100
#define kReplyContentHeight 300
#define kShadowRadius 0.5f

@interface ZQBaseImageReplyViewController ()<UITextViewDelegate,UICollectionViewDataSource,UICollectionViewDelegate> {
    UIView* replyContentView;
    UIButton* imageAddButton;
    
    UIBarButtonItem* previousRightBarButtonItem;
    
    NSMutableArray* selectedImageArray;
}

@end

@implementation ZQBaseImageReplyViewController

-(instancetype)initWithHeaderMargin:(CGFloat)headerMargin {
    self = [super init];
    
    if(self) {
        [self generateReplyContentView:headerMargin];
    }
    
    return self;
}

-(void)setPreviousRightBarButtonItem:(UIBarButtonItem *)buttonItem {
    previousRightBarButtonItem = buttonItem;
    return ;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(backgroundTapped:)]];
    
    return ;
}

//-(void)generateHeaderTitleView {
////    headerTitleView = [self generateShadowViewWithHeight:kHeaderTitleViewHeight yPosition:0];
//    NSDictionary* viewDict = [self generateShadowViewWithHeight:kHeaderTitleLabelHeight yPosition:0];
//    headerShadowView = (UIView*)viewDict[@"shadowView"];
//    headerTitleView = (UIView*)viewDict[@"contentView"];
//    [headerTitleView setBackgroundColor:[UIColor blackColor]];
//    
//    headerTitleLabel = [[UILabel alloc] initWithFrame:CGRectMake(kControlMargin, kControlMargin, headerTitleView.bounds.size.width - 2*kControlMargin, kHeaderTitleLabelHeight)];
//    [headerTitleLabel setFont:[UIFont systemFontOfSize:14.0f]];
//    [headerTitleView addSubview:headerTitleLabel];
//    
//    commentContentLabel = [[UILabel alloc] initWithFrame:CGRectMake(headerTitleLabel.frame.origin.x, headerTitleLabel.frame.origin.y + headerTitleLabel.frame.size.height, headerTitleLabel.frame.size.width, headerTitleView.bounds.size.height - headerTitleLabel.frame.origin.y - headerTitleLabel.frame.size.height)];
//    [commentContentLabel setNumberOfLines:0];
//    [commentContentLabel setTextColor:[UIColor lightGrayColor]];
//    [commentContentLabel setFont:[UIFont systemFontOfSize:12.0f]];
//    [headerTitleView addSubview:commentContentLabel];
//    return ;
//}

-(void)generateReplyContentView:(CGFloat)yPos {
    replyContentView = [self generateShadowViewWithHeight:kReplyContentHeight yPosition:yPos];
    
    self.replyTextView = [[UITextView alloc] initWithFrame:CGRectMake(kControlMargin, kControlMargin, replyContentView.bounds.size.width - 2*kControlMargin, kReplyTextViewHeight)];
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
        [imageAddButton setFrame:CGRectMake(kDeleteButtonSize / 2,kDeleteButtonSize / 2,kCollectionViewCellSize - kDeleteButtonSize / 2,kCollectionViewCellSize - kDeleteButtonSize / 2)];
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
    [imageAddButton removeFromSuperview];
    
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
    dispatch_async(dispatch_get_main_queue(), ^{
        ZQImagePickerViewController* imagePickerController = [[ZQImagePickerViewController alloc] init];
        [self presentViewController:[[ZQNavigationViewController alloc] initWithRootViewController:imagePickerController] animated:YES completion:^{
        }];
    });
                   
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
    
    for (UIView* subView in cell.contentView.subviews) {
        [subView removeFromSuperview];
    }
    
    if([selectedImageArray[indexPath.row] isKindOfClass:[UIImage class]]) {
        UIImageView* imageView = [[UIImageView alloc] initWithFrame:CGRectMake(kDeleteButtonSize / 2, kDeleteButtonSize / 2, cell.contentView.bounds.size.width - kDeleteButtonSize / 2, cell.contentView.bounds.size.height - kDeleteButtonSize / 2)];
        [imageView setImage:(UIImage*)selectedImageArray[indexPath.row]];
        [cell.contentView addSubview:imageView];
    }else {
        [cell.contentView addSubview:(UIView *)selectedImageArray[indexPath.row]];
    }
    return cell;
}

-(void)longPressedGestureHandler:(UIGestureRecognizer*)sender {
    if([((UICollectionViewCell*)sender.view).contentView.subviews[0] isKindOfClass:[UIButton class]])
        return ;
    
    for (UICollectionViewCell* cell in self.collectionView.visibleCells) {
        if(![cell.contentView.subviews[0] isKindOfClass:[UIButton class]]){
            UIButton* button = [UIButton buttonWithType:UIButtonTypeCustom];
            [button setImage:[UIImage imageNamed:@"delete"] forState:UIControlStateNormal];
            [button setFrame:CGRectMake(0, 0, kDeleteButtonSize, kDeleteButtonSize)];
            [button addTarget:self action:@selector(deleteButtonPressed:) forControlEvents:UIControlEventTouchUpInside];
            [cell.contentView addSubview:button];
        }else
            [imageAddButton setEnabled:NO];
    }
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"完成" style:UIBarButtonItemStylePlain target:self action:@selector(completeDeletePressed:)];
    return ;
}

-(void)deleteButtonPressed:(UIButton*)sender {
    NSIndexPath* indexPath = [self.collectionView indexPathForCell:(UICollectionViewCell *)sender.superview.superview];
    
    [selectedImageArray removeObjectAtIndex:indexPath.item];
    [self.collectionView deleteItemsAtIndexPaths:@[indexPath]];
    return ;
}

-(void)completeDeletePressed:(UIBarButtonItem*)sender {
    self.navigationItem.rightBarButtonItem = previousRightBarButtonItem;
    
    BOOL bImageAddButtonDeleted = YES;
    for (UIView* subView in selectedImageArray) {
        if([subView isEqual:imageAddButton]){
            bImageAddButtonDeleted = NO;
            break;
        }
    }
    [imageAddButton setEnabled:YES];
    if(bImageAddButtonDeleted)
        [selectedImageArray addObject:imageAddButton];
    
    for (UICollectionViewCell* cell in self.collectionView.visibleCells) {
        for (UIView* subView in cell.contentView.subviews) {
            if([subView isKindOfClass:[UIButton class]] && ![subView isEqual:imageAddButton])
                [subView removeFromSuperview];
        }
    }
    [self.collectionView reloadData];

    return ;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
