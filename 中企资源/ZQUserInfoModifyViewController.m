//
//  ZQUserInfoModifyViewController.m
//  中企资源
//
//  Created by 王落凡 on 15/6/9.
//  Copyright (c) 2015年 王落凡. All rights reserved.
//

#import "ZQNavigationViewController.h"
#import "ZQUserInfoModifyViewController.h"
#import "ZQUserInfoModifyTableViewCell.h"
#import "ZQPasswordViewController.h"
#import "ZQPhoneVerifyViewController.h"

@interface ZQUserInfoModifyViewController () <UITableViewDataSource,UITableViewDelegate,ZQUserInfoModifyTableViewCellDelegate,UIActionSheetDelegate,UINavigationControllerDelegate,UIImagePickerControllerDelegate> {
    UIImage* headerImage;
    NSString* userName;
}

@end

@implementation ZQUserInfoModifyViewController

-(instancetype)initWithHeaderImage:(UIImage *)headerImg userName:(NSString *)name {
    self = [super init];
    
    if(self) {
        headerImage = headerImg;
        userName = name;
    }
    
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setTitle:@"我的资料"];
    
    self.tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, self.view.bounds.size.height - kNavStatusHeight) style:UITableViewStyleGrouped];
    [self.tableView setScrollEnabled:NO];
    [self.tableView setUserInteractionEnabled:NO];
    [self.tableView setBackgroundColor:[UIColor clearColor]];
    [self.tableView setDelegate:self];
    [self.tableView setDataSource:self];
    [self.view addSubview:self.tableView];
    
//    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"编辑" style:UIBarButtonItemStylePlain target:self action:@selector(editButtonPressed:)];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemEdit target:self action:@selector(editButtonPressed:)];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 3;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (section == 0 || section == 2)
        return 1;
    return 2;
}

-(void)editButtonPressed:(UIBarButtonItem*)sender {
    [self.tableView setUserInteractionEnabled:YES];
    [self.tableView selectRowAtIndexPath:[NSIndexPath indexPathForRow:0 inSection:0] animated:YES scrollPosition:UITableViewScrollPositionTop];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemSave target:self action:@selector(saveButtonPressed:)];
    
    for (ZQUserInfoModifyTableViewCell* cell in self.tableView.visibleCells) {
        NSIndexPath* indexPath = [self.tableView indexPathForCell:cell];
        [cell setEditing:YES indexPath:indexPath];
    }
    
    return ;
}

-(void)saveButtonPressed:(UIBarButtonItem*)sender {
    [self.tableView setUserInteractionEnabled:NO];
    [self.tableView selectRowAtIndexPath:nil animated:YES scrollPosition:UITableViewScrollPositionTop];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemEdit target:self action:@selector(editButtonPressed:)];
    
    return ;
}

-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    ZQUserInfoModifyTableViewCell* cell = [tableView dequeueReusableCellWithIdentifier:@"UserInfoModifyTableViewCellIdentifier"];
    if(cell == nil) {
        cell = [[ZQUserInfoModifyTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"UserInfoModifyTableViewCellIdentifier"];
        [cell setDelegate:self];
    }
    
//    switch (indexPath.row) {
//        case 0:
//        {
//            [cell setCellInfoWithImage:headerImage text:userName];
//            [cell setNeedsCornerRadius:YES];
//        }
//            break;
//        case 1:
//        {
//           [cell setCellInfoWithImage:[UIImage imageNamed:@"fdf"] text:@"修改职位名称"];
//        }
//            break;
//        case 2:
//        {
//            [cell setCellInfoWithImage:[UIImage imageNamed:@"已绑定手机"] text:@"修改已绑定手机号码"];
//            [cell setAccessoryType:UITableViewCellAccessoryDisclosureIndicator];
//        }
//            break;
//        case 3:
//        {
//            [cell setCellInfoWithImage:[UIImage imageNamed:@"登陆密码"] text:@"修改登陆密码"];
//            [cell setAccessoryType:UITableViewCellAccessoryDisclosureIndicator];
//        }
//            break;
//        default:
//            break;
//    }
    
    switch (indexPath.section) {
        case 0:
        {
            [cell setCellInfoWithImage:headerImage text:userName];
            [cell setNeedsCornerRadius:YES];
        }
            break;
        case 1:
        {
            if(indexPath.row == 1) {
                [cell setCellInfoWithImage:[UIImage imageNamed:@"已绑定手机"] text:@"修改已绑定手机号码"];
                [cell setAccessoryType:UITableViewCellAccessoryDisclosureIndicator];
            }else{
               [cell setCellInfoWithImage:[UIImage imageNamed:@"fdf"] text:@"修改职位名称"];
            }
        }
            break;
        case 2:
        {
            [cell setCellInfoWithImage:[UIImage imageNamed:@"登陆密码"] text:@"修改登陆密码"];
            [cell setAccessoryType:UITableViewCellAccessoryDisclosureIndicator];
        }
            break;
        default:
            break;
    }
    
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    switch (indexPath.section) {
        case 1:
        {
            if(indexPath.row == 1) {
                [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(phoneNumberVerifySuccessfulNotification:) name:ZQPhoneNumberVerifySuccessfulNotification object:nil];
                dispatch_async(dispatch_get_main_queue(), ^{
                    ZQPhoneVerifyViewController* phoneController = [[ZQPhoneVerifyViewController alloc] init];
                    [self presentViewController:[[ZQNavigationViewController alloc] initWithRootViewController:phoneController] animated:YES completion:^{
                    }];
                });
                
            }
        }
            break;
        case 2:
        {
            ZQPasswordViewController* passwordController = [[ZQPasswordViewController alloc] initWithStyle:UITableViewStyleGrouped];
            [self.navigationController pushViewController:passwordController animated:YES];
        }
            break;
        default:
            break;
    }
    return ;
}

-(void)phoneNumberVerifySuccessfulNotification:(NSNotification*)notification {
    ZQUserInfoModifyTableViewCell* cell = (ZQUserInfoModifyTableViewCell*)[self.tableView cellForRowAtIndexPath:[NSIndexPath indexPathForRow:1 inSection:1]];
    NSMutableString* phoneNumber = [NSMutableString stringWithString:(NSString *)notification.userInfo[@"phoneNumber"]];
    [phoneNumber replaceCharactersInRange:NSMakeRange(3, 4) withString:@"****"];
    
    if(cell != nil) {
        [cell setCellInfoWithImage:[UIImage imageNamed:@"已绑定手机"] text:phoneNumber];
    }
    
    [[NSNotificationCenter defaultCenter] removeObserver:self name:ZQPhoneNumberVerifySuccessfulNotification object:nil];
    return ;
}

-(NSString*)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    if(section == 0)
        return @"头像和名称";
    else if (section == 1)
        return @"手机和职位";
    return @"密码修改";
}

-(NSString*)tableView:(UITableView *)tableView titleForFooterInSection:(NSInteger)section {
    if(section == 0)
        return @"进入编辑模式后，点击头像可更改用户头像，用户名称可直接修改";
    return @"";
}

-(void)changeImageForImageView:(UIImageView *)imageView {
    UIActionSheet* actionSheet = [[UIActionSheet alloc] initWithTitle:@"修改用户头像\n请选择头像图片来源" delegate:self cancelButtonTitle:@"取消" destructiveButtonTitle:nil otherButtonTitles:@"照相",@"图库", nil];
    [actionSheet showInView:self.view];
    return ;
}

-(void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex {
    UIImagePickerController* imagePickerController = [[UIImagePickerController alloc] init];
    [imagePickerController setDelegate:self];
    switch (buttonIndex) {
        case 0:
        {
            //照相
            if(![UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera]) {
                UIAlertView* alertView = [[UIAlertView alloc] initWithTitle:@"错误" message:@"照相机不可用，请检查设备" delegate:nil cancelButtonTitle:@"好的" otherButtonTitles: nil];
                [alertView show];
            }else{
                [imagePickerController setSourceType:UIImagePickerControllerSourceTypeCamera];
                [self presentViewController:imagePickerController animated:YES completion:^{
                }];
            }
        }
            break;
        case 1:
        {
            if(![UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypePhotoLibrary]) {
                UIAlertView* alertView = [[UIAlertView alloc] initWithTitle:@"错误" message:@"图库不可用，请检查设备" delegate:nil cancelButtonTitle:@"好的" otherButtonTitles: nil];
                [alertView show];
            }else{
                [imagePickerController setSourceType:UIImagePickerControllerSourceTypePhotoLibrary];
                [self presentViewController:imagePickerController animated:YES completion:^{
                }];
            }
        }
            break;
        default:
            break;
    }
    return ;
}

-(void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info {
    UIImage* originImage = (UIImage*)info[UIImagePickerControllerOriginalImage];
    [picker dismissViewControllerAnimated:YES completion:^{
        ZQUserInfoModifyTableViewCell* cell = (ZQUserInfoModifyTableViewCell*)[self.tableView cellForRowAtIndexPath:[NSIndexPath indexPathForRow:0 inSection:0]];
        [cell.imageView setImage:originImage];
    }];
    
    return ;
}

@end
