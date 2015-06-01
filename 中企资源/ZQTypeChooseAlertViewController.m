//
//  ZQTypeChooseAlertViewController.m
//  中企资源
//
//  Created by 王落凡 on 15/6/1.
//  Copyright (c) 2015年 王落凡. All rights reserved.
//

#import "ZQTypeChooseAlertViewController.h"

#define kControlViewMargin 20
#define kButtonImageEdge 10
#define kTitleHeight 40
#define kControlViewFrameWidth self.view.bounds.size.width - 2*kControlViewMargin
#define kControlViewFrameHeight 200

@interface ZQTypeChooseAlertViewController () {
    UIView* coverView;
    UIView* controlView;
    UIButton* typeButton;
    UIButton* categoryButton;
}

@end

@implementation ZQTypeChooseAlertViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    coverView = [[UIView alloc] initWithFrame:self.view.frame];
    [coverView setBackgroundColor:[UIColor blackColor]];
    [coverView setAlpha:0.5f];
    [self.view addSubview:coverView];
    
    controlView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, kControlViewFrameWidth, kControlViewFrameHeight)];
    [controlView setBackgroundColor:[UIColor colorWithRed:((CGFloat)240)/255 green:((CGFloat)241)/255 blue:((CGFloat)242)/255 alpha:1.0f]];
    [controlView setCenter:CGPointMake(self.view.bounds.size.width / 2, self.view.bounds.size.height / 2 - kNavStatusHeight)];
    [self.view addSubview:controlView];
    
    [self addControls];
    
    return ;
}

-(void)addControls {
    UILabel* title = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, controlView.bounds.size.width, kTitleHeight)];
    [title setBackgroundColor:[UIColor colorWithRed:((CGFloat)35)/255 green:((CGFloat)131)/255 blue:((CGFloat)240)/255 alpha:1.0f]];
    [title setTextColor:[UIColor whiteColor]];
    [title setText:@"    选择类型"];
    [controlView addSubview:title];
    
    //资源类型
    UILabel* typeLabel = [[UILabel alloc] initWithFrame:CGRectMake(kControlViewMargin, kControlViewMargin + kTitleHeight, 0, 0)];
    [typeLabel setText:@"资源类型:"];
    [typeLabel sizeToFit];
    [controlView addSubview:typeLabel];
    
    typeButton = [[UIButton alloc] initWithFrame:CGRectMake(typeLabel.frame.origin.x + typeLabel.frame.size.width + kControlViewMargin, typeLabel.frame.origin.y, 0, typeLabel.bounds.size.height)];
    [typeButton setFrame:CGRectMake(typeButton.frame.origin.x, typeButton.frame.origin.y, controlView.bounds.size.width - typeButton.frame.origin.x - kControlViewMargin / 2, typeButton.frame.size.height)];
    [typeButton setTitle:@"请选择类型" forState:UIControlStateNormal];
    [typeButton setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
    [typeButton setBackgroundColor:[UIColor colorWithRed:((CGFloat)229)/255 green:((CGFloat)230)/255 blue:((CGFloat)231)/255 alpha:1.0f]];
    [typeButton setTitleEdgeInsets:UIEdgeInsetsMake(0, -kControlViewMargin, 0, 0)];
    [typeButton setImage:[UIImage imageNamed:@"arrow_d_h"] forState:UIControlStateNormal];
    [typeButton setImageEdgeInsets:UIEdgeInsetsMake(0, typeButton.bounds.size.width - kButtonImageEdge - typeButton.imageView.image.size.width / 2, 0, 0)];
    [typeButton.layer setCornerRadius:1.0f];
    [typeButton.layer setMasksToBounds:YES];
    [controlView addSubview:typeButton];
    
    //资源类别
    UILabel* categoryLabel = [[UILabel alloc] initWithFrame:CGRectMake(kControlViewMargin, 3*kControlViewMargin + kTitleHeight, typeLabel.bounds.size.width, typeLabel.bounds.size.height)];
    [categoryLabel setText:@"资源类别:"];
    [controlView addSubview:categoryLabel];
    
    categoryButton = [[UIButton alloc] initWithFrame:CGRectMake(categoryLabel.frame.origin.x + categoryLabel.frame.size.width + kControlViewMargin, categoryLabel.frame.origin.y, 0, categoryLabel.bounds.size.height)];
    [categoryButton setFrame:CGRectMake(categoryButton.frame.origin.x, categoryButton.frame.origin.y, controlView.bounds.size.width - categoryButton.frame.origin.x - kControlViewMargin / 2, categoryButton.frame.size.height)];
    [categoryButton setTitle:@"请选择类别" forState:UIControlStateNormal];
    [categoryButton setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
    [categoryButton setBackgroundColor:[UIColor colorWithRed:((CGFloat)229)/255 green:((CGFloat)230)/255 blue:((CGFloat)231)/255 alpha:1.0f]];
    [categoryButton setTitleEdgeInsets:UIEdgeInsetsMake(0, -kControlViewMargin, 0, 0)];
    [categoryButton setImage:[UIImage imageNamed:@"arrow_d_h"] forState:UIControlStateNormal];
    [categoryButton setImageEdgeInsets:UIEdgeInsetsMake(0, typeButton.bounds.size.width - kButtonImageEdge - typeButton.imageView.image.size.width / 2, 0, 0)];
    [categoryButton.layer setCornerRadius:1.0f];
    [categoryButton.layer setMasksToBounds:YES];
    [controlView addSubview:categoryButton];
    
    //提交按钮
    UIButton* commitButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [commitButton setImage:[UIImage imageNamed:@"submit"] forState:UIControlStateNormal];
    [commitButton setFrame:CGRectMake(0, controlView.bounds.size.height * 3 / 4, commitButton.imageView.image.size.width / 2, commitButton.imageView.image.size.height / 2)];
    [commitButton setCenter:CGPointMake(controlView.bounds.size.width / 4, commitButton.center.y)];
    [commitButton setTag:0];
    [commitButton addTarget:self action:@selector(ButtonPressed:) forControlEvents:UIControlEventTouchUpInside];
    [controlView addSubview:commitButton];
    
    //取消按钮
    UIButton* cancelButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [cancelButton setImage:[UIImage imageNamed:@"cancel"] forState:UIControlStateNormal];
    [cancelButton setFrame:CGRectMake(0, controlView.bounds.size.height * 3 / 4, commitButton.bounds.size.width, commitButton.bounds.size.height)];
    [cancelButton setCenter:CGPointMake(controlView.bounds.size.width * 3 / 4, cancelButton.center.y)];
    [cancelButton setTag:1];
    [cancelButton addTarget:self action:@selector(ButtonPressed:) forControlEvents:UIControlEventTouchUpInside];
    [controlView addSubview:cancelButton];
    
    return ;
}

-(void)dismissAlertView {
    [self.view removeFromSuperview];
    return ;
}

-(void)ButtonPressed:(UIButton*)sender {
    [self dismissAlertView];
    if([self.delegate respondsToSelector:@selector(alertView:clickedButtonAtIndex:ResourceType:ResourceCategory:)])
        [self.delegate alertView:self clickedButtonAtIndex:sender.tag ResourceType:typeButton.titleLabel.text ResourceCategory:categoryButton.titleLabel.text];
    return ;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)showInView:(UIView *)superView {
    [superView addSubview:self.view];
    return ;
}

@end
