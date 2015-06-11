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

@interface ZQWantPostViewController ()<UITextFieldDelegate,UITextViewDelegate> {
    UILabel* placeHolderLabel;
}

@end

@implementation ZQWantPostViewController

-(id)initWithTitle:(NSString *)title {
    self = [super init];
    
    if(self) {
        [self setTitle:title];
    }
    
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.titleTextField = [[UITextField alloc] initWithFrame:CGRectMake(kControlMargin, kControlMargin, self.view.bounds.size.width - 2*kControlMargin, kTitleTextFieldHeight)];
    [self.titleTextField setDelegate:self];
    [self.titleTextField setBackgroundColor:[UIColor whiteColor]];
    [self.titleTextField setPlaceholder:@"发帖标题"];
    [self.titleTextField setReturnKeyType:UIReturnKeyDone];
    [self.view addSubview:self.titleTextField];
    
    self.contentTextView = [[UITextView alloc] initWithFrame:CGRectMake(self.titleTextField.frame.origin.x, self.titleTextField.frame.origin.y + self.titleTextField.frame.size.height + kControlMargin, self.titleTextField.frame.size.width, 5*kTitleTextFieldHeight)];
    [self.contentTextView setDelegate:self];
    [self.view addSubview:self.contentTextView];
    
    placeHolderLabel = [[UILabel alloc] initWithFrame:CGRectMake(5, 5, 0, 0)];
    [placeHolderLabel setTextColor:[UIColor lightGrayColor]];
    [placeHolderLabel setText:@"发帖内容"];
    [placeHolderLabel sizeToFit];
    [self.contentTextView addSubview:placeHolderLabel];
    
    UIButton* postButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [postButton setImage:[UIImage imageNamed:@"fxt"] forState:UIControlStateNormal];
    [postButton setFrame:CGRectMake(0, self.contentTextView.frame.origin.y + self.contentTextView.frame.size.height + kControlMargin, postButton.imageView.image.size.width / 2, postButton.imageView.image.size.height / 2)];
    [postButton setCenter:CGPointMake(self.view.bounds.size.width / 4, postButton.center.y)];
    [self.view addSubview:postButton];
    
    UIButton* cancelButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [cancelButton setImage:[UIImage imageNamed:@"cancel"] forState:UIControlStateNormal];
    [cancelButton setFrame:CGRectMake(0, postButton.frame.origin.y, postButton.frame.size.width, postButton.frame.size.height)];
    [cancelButton setCenter:CGPointMake(self.view.bounds.size.width * 3 / 4, postButton.center.y)];
    [cancelButton addTarget:self action:@selector(cancelButtonPressed:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:cancelButton];
    
    [self.view addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(backgroundTapped:)]];
    
    return ;
}

-(void)cancelButtonPressed:(UIButton*)sender {
    [self dismissViewControllerAnimated:YES completion:^{
    }];
    return ;
}

-(BOOL)textFieldShouldReturn:(UITextField *)textField {
    [textField resignFirstResponder];
    return YES;
}

-(void)textViewDidChange:(UITextView *)textView {
    if(textView.text.length == 0)
       [placeHolderLabel setHidden:NO];
    else
        [placeHolderLabel setHidden:YES];
    
    return ;
}

-(void)backgroundTapped:(UIGestureRecognizer*)sender {
    [self.titleTextField resignFirstResponder];
    [self.contentTextView resignFirstResponder];
    
    return ;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
