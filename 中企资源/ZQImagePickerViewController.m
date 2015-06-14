//
//  ZQImagePickerViewController.m
//  中企资源
//
//  Created by 王落凡 on 15/6/12.
//  Copyright (c) 2015年 王落凡. All rights reserved.
//

#import <AssetsLibrary/AssetsLibrary.h>
#import "ZQImagePickerViewController.h"
#import "ZQImagePickerCollectionViewController.h"

@interface ZQImagePickerViewController () {
    ALAssetsLibrary* assetsLibrary;
    __block NSMutableArray* assetsGroupArray;
}

@end

@implementation ZQImagePickerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setTitle:@"相簿"];
    
    [self.view setBackgroundColor:[UIColor colorWithRed:((CGFloat)231)/255 green:((CGFloat)232)/255 blue:((CGFloat)234)/255 alpha:1.0f]];
    [self.tableView setSeparatorStyle:UITableViewCellSeparatorStyleNone];
    
    if(assetsLibrary == nil)
        assetsLibrary = [[ALAssetsLibrary alloc] init];
    assetsGroupArray = [[NSMutableArray alloc] init];
    
    [assetsLibrary enumerateGroupsWithTypes:ALAssetsGroupAll usingBlock:^(ALAssetsGroup *group, BOOL *stop) {
        if(group) {
            if([group numberOfAssets] > 0)
                [assetsGroupArray addObject:group];
        }else
            [[NSNotificationCenter defaultCenter] postNotificationName:ZQImagePickerGroupEnumerateCompletionNotification object:nil];
    } failureBlock:^(NSError *error) {
        UIAlertView* alertView = [[UIAlertView alloc] initWithTitle:@"错误" message:@"访问系统相册出错" delegate:nil cancelButtonTitle:@"好的" otherButtonTitles: nil];
        [alertView show];
    }];
    
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemCancel target:self action:@selector(cancelButtonPressed:)];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(groupEnumerateCompletionNotification:) name:ZQImagePickerGroupEnumerateCompletionNotification object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(assetsEnumerateComplitionNotification:) name:ZQImagePickerAssetsEnumerateCompletionNotification object:nil];
    return ;
}

-(void)cancelButtonPressed:(UIBarButtonItem*)sender {
    [self dismissViewControllerAnimated:YES completion:^{
    }];
    
    return ;
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

-(void)groupEnumerateCompletionNotification:(NSNotification*)notification {
    [self.tableView reloadData];
    return ;
}

-(void)assetsEnumerateComplitionNotification:(NSNotification*)notification {
    NSIndexPath* indexPath = (NSIndexPath*)notification.userInfo[@"indexPath"];
    NSArray* assetsArray = (NSArray*)notification.userInfo[@"assets"];
    
    ZQImagePickerCollectionViewController* pickerController = [[ZQImagePickerCollectionViewController alloc] initWithCollectionViewLayout:[[UICollectionViewFlowLayout alloc] init] AssetsArray:assetsArray];
    [pickerController setTitle:(NSString *)[assetsGroupArray[indexPath.row] valueForProperty:ALAssetsGroupPropertyName]];
    [self.navigationController pushViewController:pickerController animated:YES];
    
    [self.tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    return ;
}

- (void)dealloc
{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
    return ;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return assetsGroupArray.count;
}

-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell* cell = [tableView dequeueReusableCellWithIdentifier:@"ImagePickerViewCellIdentifier"];
    
    if(cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"ImagePickerViewCellIdentifier"];
        [cell setBackgroundColor:[UIColor clearColor]];
    }
    
    ALAssetsGroup* group = (ALAssetsGroup*)assetsGroupArray[indexPath.row];
    
    UIImageView* imageView = [[UIImageView alloc] initWithFrame:CGRectMake(2, 2, cell.frame.size.height - 4, cell.frame.size.height - 4)];
    [imageView setImage:[UIImage imageWithCGImage:[group posterImage]]];
    [cell.contentView addSubview:imageView];
    
    UILabel* textLabel = [[UILabel alloc] initWithFrame:CGRectMake(imageView.frame.origin.x + imageView.frame.size.width + 10, imageView.frame.origin.y, cell.contentView.bounds.size.width / 2, cell.contentView.bounds.size.height / 2)];
    [textLabel setText:[group valueForProperty:ALAssetsGroupPropertyName]];
    [cell.contentView addSubview:textLabel];
    
    UILabel* detailTextLabel = [[UILabel alloc] initWithFrame:CGRectMake(textLabel.frame.origin.x, textLabel.frame.origin.y + textLabel.frame.size.height, textLabel.frame.size.width, textLabel.frame.size.height)];
    [detailTextLabel setFont:[UIFont systemFontOfSize:10.0f]];
    [detailTextLabel setTextColor:[UIColor grayColor]];
    [detailTextLabel setText:[NSString stringWithFormat:@"%ld",(long)[group numberOfAssets]]];
    [cell.contentView addSubview:detailTextLabel];
    
    [cell setAccessoryType:UITableViewCellAccessoryDisclosureIndicator];
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    ALAssetsGroup* group = (ALAssetsGroup*)assetsGroupArray[indexPath.row];
    NSMutableArray* assetsArray = [[NSMutableArray alloc] init];
    [group enumerateAssetsUsingBlock:^(ALAsset *result, NSUInteger index, BOOL *stop) {
        if(result)
           [assetsArray addObject:result];
        else
            [[NSNotificationCenter defaultCenter] postNotificationName:ZQImagePickerAssetsEnumerateCompletionNotification object:nil userInfo:@{@"assets":assetsArray,@"indexPath":indexPath}];
    }];
    return ;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
