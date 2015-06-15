//
//  ZQImagePickerCollectionViewController.m
//  中企资源
//
//  Created by 王落凡 on 15/6/12.
//  Copyright (c) 2015年 王落凡. All rights reserved.
//

#import "ZQImageBrowseView.h"
#import "ZQImageBrowseViewController.h"
#import "ZQImagePickerCollectionViewController.h"
#import <AssetsLibrary/AssetsLibrary.h>

#define kRowCounts 4

@interface ZQImagePickerCollectionViewController ()<UICollectionViewDelegateFlowLayout> {
    NSArray* assetsArray;
    NSMutableArray* fullScreenImageArray;
    NSMutableArray* selectedAsssetsArray;
    BOOL isEnterSelectMode;
}

@end

@implementation ZQImagePickerCollectionViewController

-(instancetype)initWithCollectionViewLayout:(UICollectionViewLayout *)layout AssetsArray:(NSArray *)assets {
    self = [super initWithCollectionViewLayout:layout];
    if(self) {
        [self.view setBackgroundColor:[UIColor colorWithRed:((CGFloat)231)/255 green:((CGFloat)232)/255 blue:((CGFloat)234)/255 alpha:1.0f]];
        [self.collectionView setBackgroundColor:[UIColor clearColor]];
        
        assetsArray = [NSArray arrayWithArray:assets];
        fullScreenImageArray = [[NSMutableArray alloc] init];
        selectedAsssetsArray = [[NSMutableArray alloc] init];
        isEnterSelectMode = NO;
        
        for (ALAsset* asset in assets) {
            ALAssetRepresentation* representation = [asset defaultRepresentation];
            UIImage* image = [UIImage imageWithCGImage:[representation fullScreenImage]];
            [fullScreenImageArray addObject:image];
        }
        
        self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"选择" style:UIBarButtonItemStylePlain target:self action:@selector(selectButtonPressed:)];
    }
    
    return self;
}

-(void)selectButtonPressed:(UIBarButtonItem*)sender {
    isEnterSelectMode = YES;
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"完成" style:UIBarButtonItemStylePlain target:self action:@selector(completeButtonPressed:)];
    return ;
}

-(void)completeButtonPressed:(UIBarButtonItem*)sender {
    isEnterSelectMode = NO;
    
    for (UICollectionViewCell* cell in self.collectionView.visibleCells) {
        for (UIView* subView in cell.contentView.subviews) {
            if([subView isKindOfClass:[ZQImageBrowseView class]])
                [((ZQImageBrowseView*)subView) setSelected:NO];
        }
    }
    
    [self dismissViewControllerAnimated:YES completion:^{
        [[NSNotificationCenter defaultCenter] postNotificationName:ZQImagePickerChoosenCompletionNotification object:nil userInfo:@{@"assets":selectedAsssetsArray}];
    }];
    return ;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:@"ImagePickerCollectionViewCellIdentifier"];
    
    return ;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return assetsArray.count;
}

-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    return CGSizeMake((collectionView.bounds.size.width - (kRowCounts + 6)*5) / kRowCounts, (collectionView.bounds.size.width - (kRowCounts + 6)*5) / kRowCounts);
}

-(UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section {
    return UIEdgeInsetsMake(5, 5, 5, 5);
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"ImagePickerCollectionViewCellIdentifier" forIndexPath:indexPath];
    
    ZQImageBrowseView* imageView = [[ZQImageBrowseView alloc] initWithFrame:cell.contentView.bounds];
    [imageView setImage:[UIImage imageWithCGImage:((ALAsset*)assetsArray[indexPath.row]).thumbnail]];
    [cell.contentView addSubview:imageView];
    
    return cell;
}

-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    if(!isEnterSelectMode) {
        dispatch_async(dispatch_get_main_queue(), ^{
            ALAssetRepresentation* representation = [((ALAsset*)assetsArray[indexPath.row]) defaultRepresentation];
            ZQImageBrowseViewController* browseController = [[ZQImageBrowseViewController alloc] initWithImage:[UIImage imageWithCGImage:[representation fullScreenImage]]];
            [self presentViewController:browseController animated:YES completion:^{
            }];
        });
    }else {
        UICollectionViewCell* cell = [collectionView cellForItemAtIndexPath:indexPath];
        for (UIView* subView in cell.contentView.subviews) {
            if([subView isKindOfClass:[ZQImageBrowseView class]]) {
                if([((ZQImageBrowseView*)subView) imageViewSelected]) {
                    [((ZQImageBrowseView*)subView) setSelected:NO];
                    [selectedAsssetsArray removeObject:fullScreenImageArray[indexPath.row]];
                }
                else {
                    [((ZQImageBrowseView*)subView) setSelected:YES];
                    [selectedAsssetsArray addObject:fullScreenImageArray[indexPath.row]];
                }
            }
        }
    }
    
    return ;
}

@end
