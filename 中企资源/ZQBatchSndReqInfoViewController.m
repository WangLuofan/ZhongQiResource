//
//  ZQBatchSndReqInfoViewController.m
//  中企资源
//
//  Created by 王落凡 on 15/6/1.
//  Copyright (c) 2015年 王落凡. All rights reserved.
//

#import "ZQBatchSndReqInfoViewController.h"
#import "ZQTypeChooseAlertViewController.h"

#define kControlMargin 5
#define kControlHeight 40
#define kShadowRadius 1

@interface ZQBatchSndReqInfoViewController ()<UITextViewDelegate,ZQTypeChooseAlertViewDelegate> {
    UILabel* resourceTypeLabel;
    UILabel* resourceCategoryLabel;
    UILabel* textViewPlaceHolder;
    ZQTypeChooseAlertViewController* typeChooseAlertView;
}

@end

@implementation ZQBatchSndReqInfoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setTitle:@"发布资源信息"];

    UITapGestureRecognizer* reconizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(backgroundTapped)];
    [self.view addGestureRecognizer:reconizer];
    
    //类型选择按钮
    [self addTypeChooseButton];
    //标题输入框
    [self addTitleTextField];
    //内容输入框
    [self addContentTextView];
    //提交和取消按钮
    [self addCommitCancelButton];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyBoardShowNotification:) name:UIKeyboardWillShowNotification object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyBoardHideNotification:) name:UIKeyboardWillHideNotification object:nil];
}

-(void)backgroundTapped {
    for (UIView* subview in self.view.subviews) {
        [subview resignFirstResponder];
    }
    
    return ;
}

-(void)dealloc {
    [[NSNotificationCenter defaultCenter] removeObserver:self];
    return ;
}

-(void)keyBoardShowNotification:(NSNotification*)notification {
    return ;
}

-(void)keyBoardHideNotification:(NSNotification*)notification {
    return ;
}

-(void)addContentTextView {
    UIView* bottomShadowView = [[UIView alloc] initWithFrame:CGRectMake(kControlMargin, 3*kControlMargin + 2*kControlHeight, self.view.bounds.size.width - 2*kControlMargin, 5*kControlHeight)];
    [bottomShadowView setBackgroundColor:[UIColor colorWithRed:((CGFloat)218)/255 green:((CGFloat)218)/255 blue:((CGFloat)219)/255 alpha:1.0f]];
    [self.view addSubview:bottomShadowView];
    
    UITextView* textView = [[UITextView alloc] initWithFrame:CGRectMake(bottomShadowView.frame.origin.x + kShadowRadius, bottomShadowView.frame.origin.y + kShadowRadius, bottomShadowView.bounds.size.width - 2*kShadowRadius, bottomShadowView.bounds.size.height - 2*kShadowRadius)];
    [textView setBackgroundColor:[UIColor whiteColor]];
    [textView setDelegate:self];
    [textView setCenter:bottomShadowView.center];
    [self.view addSubview:textView];
    
    textViewPlaceHolder = [[UILabel alloc] init];
    [textViewPlaceHolder setTextColor:[UIColor lightGrayColor]];
    [textViewPlaceHolder setText:@"请输入要填写的内容"];
    [textViewPlaceHolder sizeToFit];
    [textView addSubview:textViewPlaceHolder];
    
    return ;
}

-(void)addCommitCancelButton {
    UIButton* commitButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [commitButton setImage:[UIImage imageNamed:@"submit"] forState:UIControlStateNormal];
    [commitButton setFrame:CGRectMake(0, 8*kControlHeight, commitButton.imageView.image.size.width / 2, commitButton.imageView.image.size.height / 2)];
    [commitButton setCenter:CGPointMake(self.view.bounds.size.width / 4, commitButton.center.y)];
    [commitButton addTarget:self action:@selector(commitButtonPressed:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:commitButton];
    
    UIButton* cancelButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [cancelButton setImage:[UIImage imageNamed:@"cancel"] forState:UIControlStateNormal];
    [cancelButton setFrame:CGRectMake(0, commitButton.frame.origin.y, cancelButton.imageView.image.size.width / 2, cancelButton.imageView.image.size.height / 2)];
    [cancelButton setCenter:CGPointMake(self.view.bounds.size.width * 3 / 4, commitButton.center.y)];
    [cancelButton addTarget:self action:@selector(cancelButtonPressed:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:cancelButton];
    
    return ;
}

-(void)addTitleTextField {
    //阴影视图
    UIView* bottomShadowView = [[UIView alloc] initWithFrame:CGRectMake(kControlMargin, 2*kControlMargin +kControlHeight, self.view.bounds.size.width - 2*kControlMargin, kControlHeight)];
    [bottomShadowView setBackgroundColor:[UIColor colorWithRed:((CGFloat)218)/255 green:((CGFloat)218)/255 blue:((CGFloat)219)/255 alpha:1.0f]];
    [self.view addSubview:bottomShadowView];
    
    UITextField* textField = [[UITextField alloc] initWithFrame:CGRectMake(bottomShadowView.frame.origin.x + kShadowRadius, bottomShadowView.frame.origin.y + kShadowRadius, bottomShadowView.bounds.size.width - 2*kShadowRadius, bottomShadowView.bounds.size.height - 2*kShadowRadius)];
    [textField setBackgroundColor:[UIColor whiteColor]];
    [textField setCenter:bottomShadowView.center];
    [textField setPlaceholder:@"请输入要填写的标题"];
    [self.view addSubview:textField];
    
    return ;
}

-(void)addTypeChooseButton {
    UIButton* typeSelectButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [typeSelectButton setFrame:CGRectMake(kControlMargin, kControlMargin, self.view.bounds.size.width - 2*kControlMargin, kControlHeight)];
    
    //阴影视图
    UIView* bottomShadowView = [[UIView alloc] initWithFrame:typeSelectButton.bounds];
    [bottomShadowView setBackgroundColor:[UIColor colorWithRed:((CGFloat)218)/255 green:((CGFloat)218)/255 blue:((CGFloat)219)/255 alpha:1.0f]];
    [typeSelectButton addSubview:bottomShadowView];
    
    //内容视图
    UIView* contentView = [[UIView alloc] initWithFrame:CGRectMake(bottomShadowView.frame.origin.x + kShadowRadius, bottomShadowView.frame.origin.y + kShadowRadius, bottomShadowView.frame.size.width - 2*kShadowRadius, bottomShadowView.frame.size.height - 2*kShadowRadius)];
    [contentView setCenter:bottomShadowView.center];
    [contentView setBackgroundColor:[UIColor whiteColor]];
    [typeSelectButton addSubview:contentView];
    
    //资源类型
    resourceTypeLabel = [[UILabel alloc] initWithFrame:CGRectMake(kControlMargin, 0, contentView.frame.size.width / 3, contentView.frame.size.height)];
    [resourceTypeLabel setFont:[UIFont systemFontOfSize:15.0f]];
    [resourceTypeLabel setTextColor:[UIColor blackColor]];
    [resourceTypeLabel setText:@"企业供求资源"];
    [contentView addSubview:resourceTypeLabel];
    
    //资源类别
    resourceCategoryLabel = [[UILabel alloc] initWithFrame:CGRectMake(resourceTypeLabel.frame.origin.x + resourceTypeLabel.frame.size.width + kControlMargin, 0, resourceTypeLabel.frame.size.width, resourceTypeLabel.frame.size.height)];
    [resourceCategoryLabel setFont:[UIFont systemFontOfSize:12.0f]];
    [resourceCategoryLabel setTextColor:[UIColor lightGrayColor]];
    [resourceCategoryLabel setText:@"采购资源信息"];
    [resourceCategoryLabel setUserInteractionEnabled:YES];
    [contentView addSubview:resourceCategoryLabel];
    
    //右箭头
    UIImageView* rightArrow = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"qy_arrow_left"]];
    [rightArrow setFrame:CGRectMake(contentView.bounds.size.width - rightArrow.image.size.width / 2 - kControlMargin, contentView.bounds.size.height - rightArrow.image.size.height / 2, rightArrow.image.size.width / 2 , rightArrow.image.size.height / 2)];
    [rightArrow setCenter:CGPointMake(rightArrow.center.x, contentView.bounds.size.height / 2)];
    [contentView addSubview:rightArrow];
    
    [typeSelectButton addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(typeSelectButtonPressed)]];
    [self.view addSubview:typeSelectButton];
    
    return ;
}

-(void)textViewDidChange:(UITextView *)textView {
    if(textView.text.length ==0 )
       [textViewPlaceHolder setHidden:NO];
    else
        [textViewPlaceHolder setHidden:YES];
    
    return ;
}

-(void)typeSelectButtonPressed {
    typeChooseAlertView = [[ZQTypeChooseAlertViewController alloc] init];
    [typeChooseAlertView setDelegate:self];
    [typeChooseAlertView showInView:self.view];
    return ;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)alertView:(ZQTypeChooseAlertViewController *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex ResourceType:(NSString *)ResourceType ResourceCategory:(NSString *)ResourceCategory {
    switch (buttonIndex) {
        case 0:
        {
            NSLog(@"资源类型:%@",ResourceType);
            NSLog(@"资源类别:%@",ResourceCategory);
        }
            break;
        case 1:
        {
        }
            break;
        default:
            break;
    }
    
    return ;
}

-(void)cancelButtonPressed:(UIButton*)sender {
    [self dismissViewControllerAnimated:YES completion:^{
    }];
    return ;
}

-(void)commitButtonPressed:(UIButton*)sender {
    [self dismissViewControllerAnimated:YES completion:^{
        //发布资源信息
    }];
    
    return ;
}

@end
