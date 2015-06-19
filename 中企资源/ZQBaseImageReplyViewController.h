//
//  ZQBaseRscReplyViewController.h
//  中企资源
//
//  Created by 王落凡 on 15/6/12.
//  Copyright (c) 2015年 王落凡. All rights reserved.
//

#import "ZQBaseExitViewController.h"

@interface ZQBaseImageReplyViewController : ZQBaseExitViewController

-(instancetype)initWithHeaderMargin:(CGFloat)headerMargin;

@property(nonatomic,strong) UITextView* replyTextView;
@property(nonatomic,strong) UICollectionView* collectionView;

-(void)setPreviousNavigationBarButtonItem:(UIBarButtonItem*)previousBarButtonItem;
-(UIView*)generateShadowViewWithHeight:(CGFloat)height yPosition:(CGFloat)yPosition;
-(void)backgroundTapped:(UIGestureRecognizer*)sender;
-(void)setPreviousRightBarButtonItem:(UIBarButtonItem*)buttonItem;
-(NSArray*)getSelectedImages;

@end
