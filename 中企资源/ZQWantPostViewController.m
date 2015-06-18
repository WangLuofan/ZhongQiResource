//
//  ZQWantPostViewController.m
//  中企资源
//
//  Created by 王落凡 on 15/6/11.
//  Copyright (c) 2015年 王落凡. All rights reserved.
//

#import "ZQWantPostViewController.h"

#define kControlMargin 10
#define kTitleTextFieldHeight 40

@interface ZQWantPostViewController ()<UITextFieldDelegate>

@end

@implementation ZQWantPostViewController

-(instancetype)init {
    self = [super initWithHeaderMargin:kTitleTextFieldHeight + 2*kControlMargin];
    
    if(self) {
        [self setTitle:@"我要发帖"];
    }
    
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.titleTextField = [[UITextField alloc] initWithFrame:CGRectMake(kControlMargin/2, kControlMargin, self.view.bounds.size.width - kControlMargin, kTitleTextFieldHeight)];
    [self.titleTextField setDelegate:self];
    [self.titleTextField setBackgroundColor:[UIColor whiteColor]];
    [self.titleTextField setPlaceholder:@"发帖标题"];
    [self.titleTextField setReturnKeyType:UIReturnKeyDone];
    [self.view addSubview:self.titleTextField];
    
//    self.contentTextView = [[UITextView alloc] initWithFrame:CGRectMake(self.titleTextField.frame.origin.x, self.titleTextField.frame.origin.y + self.titleTextField.frame.size.height + kControlMargin, self.titleTextField.frame.size.width, self.view.bounds.size.height - kNavStatusHeight - self.titleTextField.frame.origin.y - self.titleTextField.frame.size.height - 2*kControlMargin)];
//    [self.contentTextView setDelegate:self];
//    [self.view addSubview:self.contentTextView];
//    
//    placeHolderLabel = [[UILabel alloc] initWithFrame:CGRectMake(5, 5, 0, 0)];
//    [placeHolderLabel setTextColor:[UIColor lightGrayColor]];
//    [placeHolderLabel setText:@"发帖内容"];
//    [placeHolderLabel sizeToFit];
//    [self.contentTextView addSubview:placeHolderLabel];
//    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"发帖" style:UIBarButtonItemStylePlain target:self action:@selector(postButtonPressed:)];
    
    return ;
}

-(void)postButtonPressed:(UIBarButtonItem*)sender {
    [self dismissViewControllerAnimated:YES completion:^{
    }];
    return ;
}

-(BOOL)textFieldShouldReturn:(UITextField *)textField {
    [textField resignFirstResponder];
    return YES;
}

-(void)backgroundTapped:(UIGestureRecognizer *)sender {
    [super backgroundTapped:sender];
    [self.titleTextField resignFirstResponder];
    
    return ;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
