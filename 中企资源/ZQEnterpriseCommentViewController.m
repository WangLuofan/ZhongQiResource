//
//  ZQEnterpriseCommentViewController.m
//  中企资源
//
//  Created by 王落凡 on 15/6/3.
//  Copyright (c) 2015年 王落凡. All rights reserved.
//

#import "ZQEnterpriseEvaluateViewController.h"
#import "ZQEnterpriseCommentViewController.h"

#define kControlMargin 20
#define kInputAccessoryViewHeight 30

@interface ZQEnterpriseCommentViewController ()<UITextViewDelegate> {
    UITextView* commentTextView;
    UILabel* placeHolderLabel;
    UIViewController* pushViewController;
}

@end

@implementation ZQEnterpriseCommentViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setTitle:@"评论"];
    
    UIToolbar * topView = [[UIToolbar alloc] initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, kInputAccessoryViewHeight)];
    [topView setBarStyle:UIBarStyleDefault];
    UIBarButtonItem * btnSpace = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:self action:nil];
    UIBarButtonItem * doneButton = [[UIBarButtonItem alloc] initWithTitle:@"Done" style:UIBarButtonItemStyleDone target:self action:@selector(dismissKeyBoard)];
    [doneButton setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor blackColor]} forState:UIControlStateNormal];
    NSArray * buttonsArray = [NSArray arrayWithObjects:btnSpace, doneButton, nil];
    [topView setItems:buttonsArray];
    
    commentTextView = [[UITextView alloc] initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, self.view.bounds.size.width)];
    [commentTextView setDelegate:self];
    [commentTextView setBackgroundColor:[UIColor colorWithRed:((CGFloat)249)/255 green:((CGFloat)246)/255 blue:((CGFloat)246)/255 alpha:1.0f]];
    [commentTextView setInputAccessoryView:topView];
    [self.view addSubview:commentTextView];
    
    placeHolderLabel = [[UILabel alloc] initWithFrame:CGRectMake(5, 5, 0, 0)];
    [placeHolderLabel setText:@"来说两句吧!!!"];
    [placeHolderLabel sizeToFit];
    [placeHolderLabel setTextColor:[UIColor lightGrayColor]];
    [placeHolderLabel setFont:[UIFont systemFontOfSize:10.0f]];
    [commentTextView addSubview:placeHolderLabel];
    
    UIButton* submitButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [submitButton setImage:[UIImage imageNamed:@"submit"] forState:UIControlStateNormal];
    [submitButton setFrame:CGRectMake(0, commentTextView.frame.origin.x + commentTextView.frame.size.height + kControlMargin, submitButton.imageView.image.size.width / 2, submitButton.imageView.image.size.height / 2)];
    [submitButton setCenter:CGPointMake(self.view.bounds.size.width / 4, submitButton.center.y)];
    [submitButton addTarget:self action:@selector(submitButtonPressed:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:submitButton];
    
    UIButton* cancelButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [cancelButton setImage:[UIImage imageNamed:@"cancel"] forState:UIControlStateNormal];
    [cancelButton setFrame:CGRectMake(0, submitButton.frame.origin.y, submitButton.frame.size.width, submitButton.frame.size.height)];
    [cancelButton setCenter:CGPointMake(self.view.bounds.size.width * 3 / 4, submitButton.center.y)];
    [cancelButton addTarget:self action:@selector(cancelButtonPressed:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:cancelButton];
    
    return ;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)setPushViewController:(UIViewController *)viewController {
    pushViewController = viewController;
}

-(void)cancelButtonPressed:(UIButton*)sender {
    [self dismissViewControllerAnimated:YES completion:^{
    }];
    return ;
}

-(void)submitButtonPressed:(UIButton*)sender {
    [self dismissViewControllerAnimated:YES completion:^{
        [((ZQEnterpriseEvaluateViewController*)pushViewController)
         commentWithUserInfoDict:@{
                                   @"header":[UIImage imageNamed:@"tx2"],
                                   @"enterprise":@"湖南讯德彩利科技有限公司",
                                   @"userName":@"王落凡",
                                   @"commentContent":commentTextView.text
                                   }];
    }];
}

-(void)dismissKeyBoard {
    [commentTextView resignFirstResponder];
}

-(void)textViewDidEndEditing:(UITextView *)textView {
    [textView resignFirstResponder];
}

-(void)textViewDidChange:(UITextView *)textView {
    if(textView.text.length == 0)
       [placeHolderLabel setHidden:NO];
    else
        [placeHolderLabel setHidden:YES];
    
    return ;
}

@end
