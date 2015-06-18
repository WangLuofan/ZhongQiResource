//
//  ZQTypeChooseAlertViewController.m
//  中企资源
//
//  Created by 王落凡 on 15/6/1.
//  Copyright (c) 2015年 王落凡. All rights reserved.
//

#import "ZQTypeChooseView.h"
#import "ZQTypeChooseAlertViewController.h"

#define kControlViewMargin 20
#define kButtonImageEdge 10
#define kTitleHeight 40
#define kControlViewFrameWidth (self.view.bounds.size.width - 2*kControlViewMargin)
#define kControlViewFrameHeight 200

@interface ZQTypeChooseAlertViewController ()<ZQTypeChooseViewDelegate> {
    UIView* coverView;
    UIView* controlView;
    UIButton* typeButton;
    UIButton* categoryButton;
    ZQTypeChooseView* typeChooseView;
}

@end

@implementation ZQTypeChooseAlertViewController

-(instancetype)init {
    self = [super init];
    
    if(self) {
        coverView = [[UIView alloc] initWithFrame:self.view.frame];
        [coverView setBackgroundColor:[UIColor blackColor]];
        [coverView setAlpha:0.5f];
        [self.view addSubview:coverView];
        
        controlView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, kControlViewFrameWidth, kControlViewFrameHeight)];
        [controlView setBackgroundColor:[UIColor colorWithRed:((CGFloat)240)/255 green:((CGFloat)241)/255 blue:((CGFloat)242)/255 alpha:1.0f]];
        [controlView setCenter:CGPointMake(self.view.bounds.size.width / 2, 0)];
        [self.view addSubview:controlView];
        
        typeChooseView = [[ZQTypeChooseView alloc] initWithFrame:CGRectMake(0, 0, kControlViewFrameWidth, 2*kControlViewFrameHeight)];
        [typeChooseView setAlpha:0];
        [typeChooseView setChooseViewDelegate:self];
        [typeChooseView setCenter:CGPointMake(self.view.bounds.size.width / 2, self.view.bounds.size.height / 2 - kNavStatusHeight)];
        [self.view addSubview:typeChooseView];
        
        [self addControls];
        
        [coverView addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapGestureRecognizerHandler:)]];
    }
    
    return self;
}

-(void)tapGestureRecognizerHandler:(UIGestureRecognizer*)sender {
    [self dismissAlertView];
    return ;
}

- (void)viewDidLoad {
    [super viewDidLoad];
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
    [typeButton setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
    [typeButton setTitleColor:[UIColor blackColor] forState:UIControlStateHighlighted];
    [typeButton setBackgroundColor:[UIColor colorWithRed:((CGFloat)229)/255 green:((CGFloat)230)/255 blue:((CGFloat)231)/255 alpha:1.0f]];
    [typeButton.titleLabel setFont:[UIFont systemFontOfSize:12.0f]];
    [typeButton setTitleEdgeInsets:UIEdgeInsetsMake(0, -kControlViewMargin-kButtonImageEdge, 0, 0)];
    [typeButton setImage:[UIImage imageNamed:@"arrow_d_h"] forState:UIControlStateNormal];
    [typeButton setImageEdgeInsets:UIEdgeInsetsMake(0, typeButton.bounds.size.width - kButtonImageEdge - typeButton.imageView.image.size.width / 2, 0, 0)];
    [typeButton.layer setCornerRadius:1.0f];
    [typeButton.layer setMasksToBounds:YES];
    [typeButton addTarget:self action:@selector(typeButtonPressed:) forControlEvents:UIControlEventTouchUpInside];
    [controlView addSubview:typeButton];
    
    //资源类别
    UILabel* categoryLabel = [[UILabel alloc] initWithFrame:CGRectMake(kControlViewMargin, 3*kControlViewMargin + kTitleHeight, typeLabel.bounds.size.width, typeLabel.bounds.size.height)];
    [categoryLabel setText:@"资源类别:"];
    [controlView addSubview:categoryLabel];
    
    categoryButton = [[UIButton alloc] initWithFrame:CGRectMake(categoryLabel.frame.origin.x + categoryLabel.frame.size.width + kControlViewMargin, categoryLabel.frame.origin.y, 0, categoryLabel.bounds.size.height)];
    [categoryButton setFrame:CGRectMake(categoryButton.frame.origin.x, categoryButton.frame.origin.y, controlView.bounds.size.width - categoryButton.frame.origin.x - kControlViewMargin / 2, categoryButton.frame.size.height)];
    [categoryButton.titleLabel setFont:[UIFont systemFontOfSize:12.0f]];
    [categoryButton setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
    [categoryButton setTitleColor:[UIColor blackColor] forState:UIControlStateHighlighted];
    [categoryButton setBackgroundColor:[UIColor colorWithRed:((CGFloat)229)/255 green:((CGFloat)230)/255 blue:((CGFloat)231)/255 alpha:1.0f]];
    [categoryButton setTitleEdgeInsets:UIEdgeInsetsMake(0, -kControlViewMargin-kButtonImageEdge, 0, 0)];
    [categoryButton setImage:[UIImage imageNamed:@"arrow_d_h"] forState:UIControlStateNormal];
    [categoryButton setImageEdgeInsets:UIEdgeInsetsMake(0, categoryButton.bounds.size.width - kButtonImageEdge - categoryButton.imageView.image.size.width / 2, 0, 0)];
    [categoryButton addTarget:self action:@selector(categoryButtonPressed:) forControlEvents:UIControlEventTouchUpInside];
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
    [UIView animateWithDuration:0.5f animations:^{
        if(controlView.alpha == 1.0f)
            [controlView setCenter:CGPointMake(self.view.bounds.size.width / 2, 0)];
        else {
            [typeChooseView setAlpha:0.0f];
        }
    } completion:^(BOOL finished) {
        [typeChooseView removeFromSuperview];
        [self.view removeFromSuperview];
    }];
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
    [UIView animateWithDuration:0.5f animations:^{
        [controlView setCenter:CGPointMake(self.view.bounds.size.width / 2, self.view.bounds.size.height / 2 - kNavStatusHeight)];
    }];
    return ;
}

-(void)typeButtonPressed:(UIButton*)sender {
    [UIView animateWithDuration:0.2f animations:^{
        [typeChooseView setTitle:@"选择类型"];
        [controlView setAlpha:0.0f];
    }completion:^(BOOL finished) {
        [typeChooseView setContentsWithArray:@[@"商务合作资源"] type:ZQTypeChooseViewType_Type];
        [UIView animateWithDuration:0.2f animations:^{
            [typeChooseView setAlpha:1.0f];
        }];
    }];
    return ;
}

-(void)categoryButtonPressed:(UIButton*)sender {
    [UIView animateWithDuration:0.2f animations:^{
        [typeChooseView setTitle:@"选择类别"];
        [controlView setAlpha:0.0f];
    }completion:^(BOOL finished) {
        [typeChooseView setContentsWithArray:@[@"销售渠道合作",@"供货渠道合作",@"客户服务合作",@"法律风险合作",@"账务及税务合作",@"众筹合作",@"项目合作",@"投融资合作"] type:ZQTypeChooseViewType_Category];
        [UIView animateWithDuration:0.2f animations:^{
            [typeChooseView setAlpha:1.0f];
        }];
    }];
    return ;
}

-(void)chooseViewType:(ZQTypeChooseViewType)type content:(NSString *)content {
    switch (type) {
        case ZQTypeChooseViewType_Type:
        {
            [typeButton setTitle:content forState:UIControlStateNormal];
            [UIView animateWithDuration:0.2f animations:^{
                [controlView setAlpha:1.0f];
            }];
        }
            break;
        case ZQTypeChooseViewType_Category:
        {
            [categoryButton setTitle:content forState:UIControlStateNormal];
            [UIView animateWithDuration:0.2f animations:^{
                [controlView setAlpha:1.0f];
            }];
        }
            break;
        default:
            break;
    }
}

-(void)setResourceType:(NSString *)resourceType ResourceCategory:(NSString *)resourceCategory {
    [typeButton setTitle:resourceType forState:UIControlStateNormal];
    [categoryButton setTitle:resourceCategory forState:UIControlStateNormal];
    return ;
}

@end
