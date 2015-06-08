//
//  ZQNewestTableViewCell.m
//  中企资源
//
//  Created by 王落凡 on 15/6/5.
//  Copyright (c) 2015年 王落凡. All rights reserved.
//

#import "ZQResponseLabel.h"
#import "ZQNewestTableViewCell.h"

#define kShadowRadius 0.5f
#define kControlMargin 5
#define kHeaderImageSize (56 / 2)
#define kLabelHeight 15
#define kTableViewCellHeight 100

@interface ZQNewestTableViewCell () {
    UIView* grayShadowView;
    UIView* whiteShadowView;
    UIView* contentView;
    
    NSMutableArray* replyContentArray;
    ZQResponseLabel* replyLabel;
}

@end

@implementation ZQNewestTableViewCell

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    
    if(self) {
        [self setBackgroundColor:[UIColor clearColor]];
        [self setSelectionStyle:UITableViewCellSelectionStyleNone];
        
        grayShadowView = [[UIView alloc] initWithFrame:CGRectMake(0, kControlMargin, self.bounds.size.width, kTableViewCellHeight - kControlMargin)];
        [grayShadowView setBackgroundColor:[UIColor colorWithRed:((CGFloat)217)/255 green:((CGFloat)219)/255 blue:((CGFloat)216)/255 alpha:1.0f]];
        [self addSubview:grayShadowView];
        
        whiteShadowView = [[UIView alloc] initWithFrame:CGRectMake(0, kShadowRadius, grayShadowView.bounds.size.width, grayShadowView.bounds.size.height - 2*kShadowRadius)];
        [whiteShadowView setBackgroundColor:[UIColor whiteColor]];
        [grayShadowView addSubview:whiteShadowView];
        
        contentView = [[UIView alloc] initWithFrame:CGRectMake(0, kShadowRadius, whiteShadowView.bounds.size.width, whiteShadowView.bounds.size.height - 2*kShadowRadius)];
        [contentView setBackgroundColor:[UIColor colorWithRed:((CGFloat)241)/255 green:((CGFloat)242)/255 blue:((CGFloat)244)/255 alpha:1.0f]];
        [whiteShadowView addSubview:contentView];
        
        //头像
        self.headerImageView = [[UIImageView alloc] initWithFrame:CGRectMake(kControlMargin, kControlMargin, kHeaderImageSize, kHeaderImageSize)];
        [contentView addSubview:self.headerImageView];
        
        //企业名称
        self.enterpriseNameLabel = [[UILabel alloc] initWithFrame:CGRectMake(self.headerImageView.frame.origin.x + self.headerImageView.frame.size.width + kControlMargin, self.headerImageView.frame.origin.y, contentView.bounds.size.width - self.headerImageView.frame.origin.x - self.headerImageView.frame.size.width - kControlMargin, kLabelHeight)];
        [self.enterpriseNameLabel setFont:[UIFont systemFontOfSize:10.0f]];
        [self.enterpriseNameLabel setTextColor:[UIColor lightGrayColor]];
        [contentView addSubview:self.enterpriseNameLabel];
        
        //用户名称
        self.userNameLabel = [[UILabel alloc] initWithFrame:CGRectMake(self.enterpriseNameLabel.frame.origin.x, self.enterpriseNameLabel.frame.origin.y + self.enterpriseNameLabel.frame.size.height, self.enterpriseNameLabel.frame.size.width / 2, kLabelHeight)];
        [self.userNameLabel setFont:[UIFont systemFontOfSize:10.0f]];
        [self.userNameLabel setTextColor:[UIColor colorWithRed:((CGFloat)54)/255 green:((CGFloat)96)/255 blue:((CGFloat)134)/255 alpha:1.0f]];
        [contentView addSubview:self.userNameLabel];
        
        //时间
        self.dateTimeLabel = [[UILabel alloc] initWithFrame:CGRectMake(self.userNameLabel.frame.origin.x + self.userNameLabel.frame.size.width, self.userNameLabel.frame.origin.y, self.userNameLabel.frame.size.width - kControlMargin, self.userNameLabel.frame.size.height)];
        [self.dateTimeLabel setTextColor:[UIColor lightGrayColor]];
        [self.dateTimeLabel setFont:[UIFont systemFontOfSize:10.0f]];
        [self.dateTimeLabel setTextAlignment:NSTextAlignmentRight];
        [contentView addSubview:self.dateTimeLabel];
        
        //评论内容
        self.commentContentLabel = [[UILabel alloc] initWithFrame:CGRectMake(self.enterpriseNameLabel.frame.origin.x, self.userNameLabel.frame.origin.y + self.userNameLabel.frame.size.height, contentView.bounds.size.width - self.enterpriseNameLabel.frame.origin.x - kControlMargin, 0)];
        [self.commentContentLabel setNumberOfLines:0];
        [self.commentContentLabel setFont:[UIFont systemFontOfSize:12.0f]];
        [contentView addSubview:self.commentContentLabel];
        
        //回复按钮
        self.commentButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [self.commentButton setImage:[UIImage imageNamed:@"chat"] forState:UIControlStateNormal];
        [self.commentButton setFrame:CGRectMake(0, 0, self.commentButton.imageView.image.size.width / 2, self.commentButton.imageView.image.size.height / 2)];
        [self.commentButton addTarget:self action:@selector(commentButtonPressed:) forControlEvents:UIControlEventTouchUpInside];
        [contentView addSubview:self.commentButton];
        
        //回复内容
        replyContentArray = [[NSMutableArray alloc] init];
    }
    
    return self;
}

-(void)adjustControlFrame {
    
    if(replyContentArray.count == 0)
        [grayShadowView setFrame:CGRectMake(grayShadowView.frame.origin.x, grayShadowView.frame.origin.y, grayShadowView.frame.size.width, self.commentButton.frame.origin.y + self.commentButton.frame.size.height + kControlMargin)];
    else {
        ZQResponseLabel* label = (ZQResponseLabel*)[replyContentArray lastObject];
       [grayShadowView setFrame:CGRectMake(grayShadowView.frame.origin.x, grayShadowView.frame.origin.y, grayShadowView.frame.size.width, label.frame.origin.y + label.frame.size.height + kControlMargin)];
    }
    
    [whiteShadowView setFrame:CGRectMake(0, kShadowRadius, grayShadowView.bounds.size.width, grayShadowView.bounds.size.height - 2*kShadowRadius)];
    [contentView setFrame:CGRectMake(0, kShadowRadius, whiteShadowView.bounds.size.width, whiteShadowView.bounds.size.height - 2*kShadowRadius)];
    
    return ;
}

-(CGFloat)cellHeight {
    return grayShadowView.frame.size.height + kControlMargin;
}

-(void)commentButtonPressed:(UIButton*)sender {
    replyLabel = nil;
    if([self.delegate respondsToSelector:@selector(tableViewCell:CommentInfo:)])
        [self.delegate tableViewCell:self CommentInfo:@{@"userName":self.userNameLabel.text}];
    return ;
}

-(void)addReplyContentWithFrom:(NSString *)from Content:(NSString *)content {
    CGFloat yOrigin = (replyContentArray.count == 0 ? (self.commentButton.frame.origin.y + self.commentButton.frame.size.height + kControlMargin):(((ZQResponseLabel*)replyContentArray[replyContentArray.count - 1]).frame.origin.y + ((ZQResponseLabel*)replyContentArray[replyContentArray.count - 1]).frame.size.height ));
    
    ZQResponseLabel* responseLabel = [[ZQResponseLabel alloc] initWithFrame:CGRectMake(self.commentContentLabel.frame.origin.x, yOrigin, self.commentContentLabel.frame.size.width, 0)];
    [responseLabel setCommentWithFrom:from To:((replyLabel==nil)?nil:replyLabel.from) Conntent:content];
    [responseLabel addTarget:self action:@selector(responseLabelPressed:) forControlEvents:UIControlEventTouchUpInside];
    
    if(replyLabel == nil)
        [replyContentArray addObject:responseLabel];
    else {
        NSInteger atIndex = 0;
        for (NSInteger i = 0; i != replyContentArray.count; ++ i) {
            if([replyContentArray[i] isEqual:replyLabel]) {
                atIndex = i;
                break;
            }
        }
        
        [replyContentArray insertObject:responseLabel atIndex:atIndex + 1];
        for (NSInteger i = atIndex + 1; i != replyContentArray.count; ++i) {
            [((ZQResponseLabel*)replyContentArray[i]) setFrame:CGRectMake(((ZQResponseLabel*)replyContentArray[i]).frame.origin.x , ((ZQResponseLabel*)replyContentArray[i-1]).frame.origin.y + ((ZQResponseLabel*)replyContentArray[i-1]).frame.size.height , ((ZQResponseLabel*)replyContentArray[i]).frame.size.width, ((ZQResponseLabel*)replyContentArray[i]).frame.size.height)];
        }
    }
    
    [contentView addSubview:responseLabel];
    [self adjustControlFrame];
    
    return ;
}

-(void)responseLabelPressed:(ZQResponseLabel*)sender {
    replyLabel = sender;
    if([self.delegate respondsToSelector:@selector(tableViewCell:CommentInfo:)])
        [self.delegate tableViewCell:self CommentInfo:@{@"userName":sender.from}];
    return ;
}

-(void)setCommentContentText:(NSString *)contentText {
//    [self.commentButton removeFromSuperview];
    
    CGSize textSize = [contentText boundingRectWithSize:CGSizeMake(self.commentContentLabel.frame.size.width, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:12.0f]} context:nil].size;
    [self.commentContentLabel setText:contentText];
    [self.commentContentLabel setFrame:CGRectMake(self.commentContentLabel.frame.origin.x, self.commentContentLabel.frame.origin.y, self.commentContentLabel.frame.size.width, textSize.height)];
    
    [self.commentButton setFrame:CGRectMake(contentView.frame.size.width - 5*kControlMargin - self.commentButton.frame.size.width, self.commentContentLabel.frame.origin.y + textSize.height + kControlMargin, self.commentButton.frame.size.width + kControlMargin, self.commentButton.frame.size.height + kControlMargin)];
//    [contentView addSubview:self.commentButton];
    
    [self adjustControlFrame];
    return ;
}

@end
