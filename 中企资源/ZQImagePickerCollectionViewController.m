//
//  ZQImagePickerCollectionViewController.m
//  中企资源
//
//  Created by 王落凡 on 15/6/12.
//  Copyright (c) 2015年 王落凡. All rights reserved.
//

#import "ZQImageBrowseViewController.h"
#import "ZQImagePickerCollectionViewController.h"
#import <AssetsLibrary/AssetsLibrary.h>

#define kRowCounts 4

@interface ZQImagePickerCollectionViewController ()<UICollectionViewDelegateFlowLayout> {
    NSArray* assetsArray;
}

@end

@implementation ZQImagePickerCollectionViewController

-(instancetype)initWithCollectionViewLayout:(UICollectionViewLayout *)layout AssetsArray:(NSArray *)assets {
    self = [super initWithCollectionViewLayout:layout];
    if(self) {
        [self.view setBackgroundColor:[UIColor colorWithRed:((CGFloat)231)/255 green:((CGFloat)232)/255 blue:((CGFloat)234)/255 alpha:1.0f]];
        [self.collectionView setBackgroundColor:[UIColor clearColor]];
        assetsArray = [NSArray arrayWithArray:assets];
    }
    
    return self;
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
    
//    [cell setBackgroundColor:[UIColor blackColor]];
    UIImageView* imageView = [[UIImageView alloc] initWithFrame:cell.contentView.bounds];
    [imageView setImage:[UIImage imageWithCGImage:((ALAsset*)assetsArray[indexPath.row]).thumbnail]];
    [cell.contentView addSubview:imageView];
    
    return cell;
}

-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    ALAssetRepresentation* representation = [((ALAsset*)assetsArray[indexPath.row]) defaultRepresentation];
    
    ZQImageBrowseViewController* browseController = [[ZQImageBrowseViewController alloc] initWithImage:[UIImage imageWithCGImage:[representation fullScreenImage]]];
    [self presentViewController:browseController animated:YES completion:^{
    }];
    
    return ;
}

@end
