//
//  ZQUserFeedbackViewController.m
//  中企资源
//
//  Created by 王落凡 on 15/5/29.
//  Copyright (c) 2015年 王落凡. All rights reserved.
//

#import "ZQUserFeedbackViewController.h"

#define kControlMargin 5
#define kDescLabelHeight 40

@interface ZQUserFeedbackViewController ()<UITextViewDelegate> {
    UILabel* placeHolderLabel;
}

@end

@implementation ZQUserFeedbackViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setTitle:@"用户反馈"];
    
    UILabel* descLabel = [[UILabel alloc] initWithFrame:CGRectMake(kControlMargin, kControlMargin, self.view.bounds.size.width - 2*kControlMargin, kDescLabelHeight)];
    [descLabel setTextAlignment:NSTextAlignmentJustified];
    [self.view addSubview:descLabel];
    [self setDescribeInfo:descLabel];
    
    self.commentTextView = [[UITextView alloc] initWithFrame:CGRectMake(descLabel.frame.origin.x, descLabel.frame.origin.y + descLabel.frame.size.height, descLabel.frame.size.width, 5*kDescLabelHeight)];
    [self.commentTextView setFont:[UIFont systemFontOfSize:14.0f]];
    [self.commentTextView setDelegate:self];
    [self.view addSubview:self.commentTextView];
    
    placeHolderLabel = [[UILabel alloc] initWithFrame:CGRectMake(5, 5, 0, 0)];
    [placeHolderLabel setText:@"请输入您的反馈信息"];
    [placeHolderLabel sizeToFit];
    [placeHolderLabel setTextColor:[UIColor lightGrayColor]];
    [placeHolderLabel setFont:[UIFont systemFontOfSize:14.0f]];
    [self.commentTextView addSubview:placeHolderLabel];
    
    UIButton* commitButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [commitButton setImage:[UIImage imageNamed:@"submit"] forState:UIControlStateNormal];
    [commitButton setFrame:CGRectMake(0, self.commentTextView.frame.origin.y + self.commentTextView.frame.size.height + 2*kControlMargin, commitButton.imageView.image.size.width / 2, commitButton.imageView.image.size.height / 2)];
    [commitButton setCenter:CGPointMake(self.view.bounds.size.width / 4, commitButton.center.y)];
    [self.view addSubview:commitButton];
    
    UIButton* cancelButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [cancelButton setImage:[UIImage imageNamed:@"cancel"] forState:UIControlStateNormal];
    [cancelButton setFrame:CGRectMake(0, commitButton.frame.origin.y, commitButton.frame.size.width, commitButton.frame.size.height)];
    [cancelButton setCenter:CGPointMake(self.view.bounds.size.width * 3 / 4, cancelButton.center.y)];
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

-(void)backgroundTapped:(UIGestureRecognizer*)sender {
    [self.commentTextView resignFirstResponder];
    return ;
}

-(void)setDescribeInfo:(UILabel*)label {
    NSMutableAttributedString* attrStr = [[NSMutableAttributedString alloc] initWithString:@"☆ 针对用户反馈的一些说明，并表示欢迎!"];
    [attrStr addAttribute:NSForegroundColorAttributeName value:[UIColor redColor] range:NSMakeRange(0, 1)];
    [attrStr addAttribute:NSFontAttributeName value:[UIFont systemFontOfSize:14.0f] range:NSMakeRange(0, attrStr.length)];
    [label setAttributedText:attrStr];
    
    return ;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)textViewDidChange:(UITextView *)textView {
    if(textView.text.length == 0)
        [placeHolderLabel setHidden:NO];
    else
        [placeHolderLabel setHidden:YES];
    
    return ;
}

@end
