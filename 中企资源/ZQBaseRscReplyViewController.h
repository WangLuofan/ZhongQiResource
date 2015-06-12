//
//  ZQBaseRscReplyViewController.h
//  中企资源
//
//  Created by 王落凡 on 15/6/12.
//  Copyright (c) 2015年 王落凡. All rights reserved.
//

#import "ZQBaseExitViewController.h"

@interface ZQBaseRscReplyViewController : ZQBaseExitViewController

@property(nonatomic,strong) UITextView* replyTextView;
@property(nonatomic,strong) UICollectionView* collectionView;

-(void)setTitle:(NSString*)title CommentContent:(NSString*)commentContent;

@end
