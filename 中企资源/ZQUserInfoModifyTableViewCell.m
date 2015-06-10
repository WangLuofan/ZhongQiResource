//
//  ZQUserInfoModifyTableViewCell.m
//  中企资源
//
//  Created by 王落凡 on 15/6/9.
//  Copyright (c) 2015年 王落凡. All rights reserved.
//

#import "ZQUserInfoModifyTableViewCell.h"

#define kImageViewSize 32
#define kControlMargin 10

@interface ZQUserInfoModifyTableViewCell () <UITextFieldDelegate>

@end

@implementation ZQUserInfoModifyTableViewCell

@synthesize imageView;
@synthesize textLabel;

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    
    if(self) {
        self.imageView = [[UIImageView alloc] initWithFrame:CGRectMake(kControlMargin, 0, kImageViewSize, kImageViewSize)];
        [self.imageView setCenter:CGPointMake(self.imageView.center.x, self.bounds.size.height / 2)];
        [self.imageView setContentMode:UIViewContentModeScaleAspectFit];
        [self.imageView.layer setCornerRadius:kImageViewSize / 2];
        [self.imageView addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(imageViewTapped:)]];
        [self.contentView addSubview:self.imageView];
        
        self.textLabel = [[UILabel alloc] initWithFrame:CGRectMake(self.imageView.frame.origin.x + self.imageView.frame.size.width + kControlMargin, 0, self.bounds.size.width - self.imageView.frame.origin.x - self.imageView.frame.size.width - 2*kControlMargin, self.bounds.size.height)];
        [self.textLabel setFont:[UIFont systemFontOfSize:12.0f]];
        [self.textLabel setTextColor:[UIColor grayColor]];
        [self.textLabel setCenter:CGPointMake(self.textLabel.center.x, self.bounds.size.height / 2)];
        [self.contentView addSubview:self.textLabel];
        
        self.editTextField = [[UITextField alloc] initWithFrame:self.textLabel.frame];
        [self.editTextField setFont:[UIFont systemFontOfSize:12.0f]];
        [self.editTextField setTextColor:[UIColor grayColor]];
        [self.editTextField setCenter:self.textLabel.center];
        [self.editTextField setHidden:YES];
        [self.editTextField setReturnKeyType:UIReturnKeyDone];
        [self.editTextField setDelegate:self];
        [self.contentView addSubview:self.editTextField];
        
        [self setSeparatorInset:UIEdgeInsetsMake(0, self.textLabel.frame.origin.x, 0, 0)];
    }
    
    return self;
}

-(void)setNeedsCornerRadius:(BOOL)needs {
    if(needs)
        [self.imageView setClipsToBounds:YES];
    return ;
}

-(void)imageViewTapped:(UIGestureRecognizer*)sender {
    if([self.delegate respondsToSelector:@selector(changeImageForImageView:)])
        [self.delegate changeImageForImageView:self.imageView];
    return ;
}

-(void)setCellInfoWithImage:(UIImage *)image text:(NSString *)text {
    [self.imageView setImage:image];
    [self.textLabel setText:text];
    
    return ;
}

-(void)setEditing:(BOOL)editing indexPath:(NSIndexPath *)indexPath {
    if(editing){
        if(indexPath.section == 0 || (indexPath.section == 1 && indexPath.row == 0))
        {
            [self.editTextField setText:self.textLabel.text];
            [self.editTextField setHidden:NO];
            [self.textLabel setHidden:YES];
        }
        
        if(indexPath.section == 0) {
            [self.imageView setUserInteractionEnabled:YES];
            [self.textLabel becomeFirstResponder];
        }
    }else{
        if(indexPath.section == 0 || (indexPath.section == 1 && indexPath.row == 0)) {
            [self.textLabel setText:self.editTextField.text];
            [self.editTextField resignFirstResponder];
            [self.editTextField setHidden:YES];
            [self.textLabel setHidden:NO];
            
            [self.imageView setUserInteractionEnabled:NO];
        }
    }
    
    return ;
}

-(BOOL)textFieldShouldReturn:(UITextField *)textField {
    if(textField.returnKeyType == UIReturnKeyDone)
       [textField resignFirstResponder];
    return YES;
}

//-(void)layoutSubviews {
//    [self.imageView setBounds:CGRectMake(kControlMargin, 0, kImageViewSize, kImageViewSize)];
//    [self.imageView setFrame:self.imageView.bounds];
//    [self.imageView setCenter:CGPointMake(self.imageView.center.x, self.bounds.size.height / 2)];
//    [self.imageView setContentMode:UIViewContentModeScaleAspectFit];
//    [self.imageView.layer setCornerRadius:kImageViewSize / 2];
//    
//    [self.imageView setClipsToBounds:[self needCircleHeaderImageView]];
//    
//    [self.textLabel setFrame:CGRectMake(self.imageView.frame.origin.x + self.imageView.frame.size.width + kControlMargin, 0, self.bounds.size.width - self.imageView.frame.origin.x - self.imageView.frame.size.width - 2*kControlMargin, self.bounds.size.height)];
//    [self.textLabel setFont:[UIFont systemFontOfSize:12.0f]];
//    [self.textLabel setTextColor:[UIColor grayColor]];
//    [self.textLabel setCenter:CGPointMake(self.textLabel.center.x, self.bounds.size.height / 2)];
//    
//    return ;
//}

@end
