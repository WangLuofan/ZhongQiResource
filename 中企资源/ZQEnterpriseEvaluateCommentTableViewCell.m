//
//  ZQEnterpriseEvaluateCommentTableViewCell.m
//  中企资源
//
//  Created by 王落凡 on 15/6/4.
//  Copyright (c) 2015年 王落凡. All rights reserved.
//

#import "ZQEnterpriseEvaluateCommentTableViewCell.h"

#define kControlMargin 10
#define kHeaderImageSize (56 / 2)
#define kShadowRadius 0.5f
#define kTableViewCellHeight 100
#define kLabelHeight 15
#define kImageCols 3
#define kCollectionCellMargin 5
#define kCollectionImageHeight 100

static CGFloat commentHeight = 0;

@interface ZQEnterpriseEvaluateCommentTableViewCell ()<UICollectionViewDataSource,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout> {
    UIView* grayShadowView;
    UIView* whiteShadowView;
    UIView* contentView;
    
    UIButton* browseButton;
    UIButton* attentionButton;
    UIButton* messageButton;
    
    NSArray* imageSrcArray;
}

@end

@implementation ZQEnterpriseEvaluateCommentTableViewCell

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    
    if(self) {
        
        [self setSelectionStyle:UITableViewCellSelectionStyleNone];
        [self setBackgroundColor:[UIColor clearColor]];
        
        //灰色阴影
        grayShadowView = [[UIView alloc] initWithFrame:CGRectMake(0, kControlMargin, self.frame.size.width, self.bounds.size.height - kControlMargin)];
        [grayShadowView setBackgroundColor:[UIColor colorWithRed:((CGFloat)193)/255 green:((CGFloat)194)/255 blue:((CGFloat)195)/255 alpha:1.0f]];
        [self addSubview:grayShadowView];
        
        //白色阴影
        whiteShadowView = [[UIView alloc] initWithFrame:CGRectMake(0, kShadowRadius, grayShadowView.frame.size.width, grayShadowView.frame.size.height - 2*kShadowRadius)];
        [whiteShadowView setBackgroundColor:[UIColor whiteColor]];
        [grayShadowView addSubview:whiteShadowView];
        
        //内容视图
        contentView = [[UIView alloc] initWithFrame:CGRectMake(0, kShadowRadius, whiteShadowView.frame.size.width, whiteShadowView.frame.size.height - 2*kShadowRadius)];
        [contentView setBackgroundColor:[UIColor colorWithRed:((CGFloat)242)/255 green:((CGFloat)242)/255 blue:((CGFloat)244)/255 alpha:1.0f]];
        [whiteShadowView addSubview:contentView];
        
        //头像
        self.headerImageView = [[UIImageView alloc] initWithFrame:CGRectMake(kControlMargin, kControlMargin, kHeaderImageSize, kHeaderImageSize)];
        [contentView addSubview:self.headerImageView];
        
        //名称
        self.nameLabel = [[UILabel alloc] initWithFrame:CGRectMake(self.headerImageView.frame.origin.x + self.headerImageView.frame.size.width + kControlMargin, self.headerImageView.frame.origin.y, contentView.bounds.size.width / 2 - self.headerImageView.frame.origin.x - self.headerImageView.frame.size.width - kControlMargin, kLabelHeight)];
        [self.nameLabel setTextColor:[UIColor colorWithRed:((CGFloat)21)/255 green:((CGFloat)61)/255 blue:((CGFloat)102)/155 alpha:1.0f]];
        [self.nameLabel setFont:[UIFont systemFontOfSize:12.0f]];
        [contentView addSubview:self.nameLabel];
        
        //日期
        self.dateTimeLabel = [[UILabel alloc] initWithFrame:CGRectMake(self.nameLabel.frame.origin.x, self.nameLabel.frame.origin.y + self.nameLabel.frame.size.height , self.nameLabel.frame.size.width, self.nameLabel.frame.size.height)];
        [self.dateTimeLabel setTextColor:[UIColor lightGrayColor]];
        [self.dateTimeLabel setFont:[UIFont systemFontOfSize:10.0f]];
        [contentView addSubview:self.dateTimeLabel];
        
        browseButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [browseButton setImage:[UIImage imageNamed:@"dp1"] forState:UIControlStateNormal];
        [browseButton setTitle:@"59" forState:UIControlStateNormal];
        [browseButton setTitleColor:[UIColor lightGrayColor] forState:UIControlStateNormal];
        [browseButton setTitleColor:[UIColor blackColor] forState:UIControlStateHighlighted];
        [browseButton setFrame:CGRectMake(contentView.frame.size.width / 2, self.nameLabel.frame.size.height + self.nameLabel.frame.origin.y, contentView.frame.size.width / 6, browseButton.imageView.image.size.height / 2)];
        [browseButton.titleLabel setFont:[UIFont systemFontOfSize:10.0f]];
        [browseButton.imageView setContentMode:UIViewContentModeScaleAspectFit];
        [contentView addSubview:browseButton];
        
        attentionButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [attentionButton setImage:[UIImage imageNamed:@"dp2"] forState:UIControlStateNormal];
        [attentionButton setTitle:@"12" forState:UIControlStateNormal];
        [attentionButton setTitleColor:[UIColor lightGrayColor] forState:UIControlStateNormal];
        [attentionButton setTitleColor:[UIColor blackColor] forState:UIControlStateHighlighted];
        [attentionButton setFrame:CGRectMake(contentView.frame.size.width / 2 + browseButton.frame.size.width, browseButton.frame.origin.y, contentView.frame.size.width / 6, browseButton.imageView.image.size.height / 2)];
        [attentionButton.titleLabel setFont:[UIFont systemFontOfSize:10.0f]];
        [attentionButton.imageView setContentMode:UIViewContentModeScaleAspectFit];
        [contentView addSubview:attentionButton];
        
        messageButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [messageButton setImage:[UIImage imageNamed:@"dp3"] forState:UIControlStateNormal];
        [messageButton setTitle:@"28" forState:UIControlStateNormal];
        [messageButton setTitleColor:[UIColor lightGrayColor] forState:UIControlStateNormal];
        [messageButton setTitleColor:[UIColor blackColor] forState:UIControlStateHighlighted];
        [messageButton setFrame:CGRectMake(attentionButton.frame.size.width + attentionButton.frame.origin.x, browseButton.frame.origin.y, contentView.frame.size.width / 6, browseButton.imageView.image.size.height / 2)];
        [messageButton.titleLabel setFont:[UIFont systemFontOfSize:10.0f]];
        [messageButton.imageView setContentMode:UIViewContentModeScaleAspectFit];
        [contentView addSubview:messageButton];
        
        //评论内容
        self.commentContentLabel = [[UILabel alloc] initWithFrame:CGRectMake(kControlMargin + self.headerImageView.frame.size.width / 2, self.headerImageView.frame.origin.y + self.headerImageView.frame.size.height + kControlMargin, 0, 0)];
        [self.commentContentLabel setFrame:CGRectMake(self.commentContentLabel.frame.origin.x, self.commentContentLabel.frame.origin.y, contentView.frame.size.width - 2*self.commentContentLabel.frame.origin.x, 0)];
        [self.commentContentLabel setNumberOfLines:0];
        [self.commentContentLabel setFont:[UIFont systemFontOfSize:12.0f]];
        [contentView addSubview:self.commentContentLabel];
    }
    
    return self;
}

-(void)setNumberOfBrowseCount:(NSInteger)browseCount AttentionCount:(NSInteger)attentionCount MessageCount:(NSInteger)messageCount {
    
    [browseButton setTitle:[NSString stringWithFormat:@"%ld",(long)browseCount] forState:UIControlStateNormal];
    [attentionButton setTitle:[NSString stringWithFormat:@"%ld",(long)attentionCount] forState:UIControlStateNormal];
    [messageButton setTitle:[NSString stringWithFormat:@"%ld",(long)messageCount] forState:UIControlStateNormal];
    
    return ;
}

-(void)setCommentContentText:(NSString *)text {
    [self.commentContentLabel setText:text];
    
    CGSize textsize = [text boundingRectWithSize:CGSizeMake(self.commentContentLabel.frame.size.width, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:12.0f]} context:nil].size;
    [self.commentContentLabel setFrame:CGRectMake(self.commentContentLabel.frame.origin.x, self.commentContentLabel.frame.origin.y, self.commentContentLabel.frame.size.width, textsize.height)];
    
    commentHeight = textsize.height + self.headerImageView.frame.origin.y + self.headerImageView.frame.size.height + kControlMargin;
    
    [self adjustControlFrame];
    return ;
}

-(void)adjustControlFrame {
    [grayShadowView setFrame:CGRectMake(grayShadowView.frame.origin.x, grayShadowView.frame.origin.y, grayShadowView.frame.size.width, commentHeight + 2*kShadowRadius + kControlMargin)];
    [whiteShadowView setFrame:CGRectMake(whiteShadowView.frame.origin.x, whiteShadowView.frame.origin.y, whiteShadowView.frame.size.width, commentHeight - 2*kShadowRadius + kControlMargin)];
    [contentView setFrame:CGRectMake(contentView.frame.origin.x, contentView.frame.origin.y, contentView.frame.size.width, commentHeight - kShadowRadius + kControlMargin)];
    
    return ;
}

-(void)setCommentImageContent:(NSArray *)imageArray {
    if(imageArray != nil) {
        
        CGFloat rows = (int)(imageArray.count / kImageCols) + ((imageArray.count % kImageCols)==0?0:1);
        
        UICollectionViewFlowLayout* flowLayout = [[UICollectionViewFlowLayout alloc] init];
        self.collectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(self.commentContentLabel.frame.origin.x, self.commentContentLabel.frame.origin.y + self.commentContentLabel.frame.size.height, self.commentContentLabel.frame.size.width, kCollectionImageHeight*rows + kImageCols*kControlMargin) collectionViewLayout:flowLayout];
        [self.collectionView setDelegate:self];
        [self.collectionView setDataSource:self];
        [self.collectionView setBackgroundColor:[UIColor clearColor]];
        [self.collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:@"ImageCollectionViewCellIdentifier"];
        [contentView addSubview:self.collectionView];

        imageSrcArray = [NSArray arrayWithArray:imageArray];
        commentHeight += self.collectionView.frame.size.height;
        [self adjustControlFrame];
    }
    return ;
}

-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return imageSrcArray.count;
}

-(UICollectionViewCell*)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    UICollectionViewCell* cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"ImageCollectionViewCellIdentifier" forIndexPath:indexPath];
    UIImageView* imageView = [[UIImageView alloc] initWithImage:(UIImage *)imageSrcArray[indexPath.row]];
    [imageView setFrame:cell.contentView.bounds];
    [cell.contentView setBackgroundColor:[UIColor blackColor]];
    [cell.contentView addSubview:imageView];
    
    return cell;
}

-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    return CGSizeMake((self.collectionView.frame.size.width - 6*kCollectionCellMargin) / kImageCols, kCollectionImageHeight);
}

-(UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section {
    return UIEdgeInsetsMake(kCollectionCellMargin, kCollectionCellMargin, kCollectionCellMargin, kCollectionCellMargin);
}

-(BOOL)collectionView:(UICollectionView *)collectionView shouldShowMenuForItemAtIndexPath:(NSIndexPath *)indexPath{
    return YES;
}

-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    if([self.delegate respondsToSelector:@selector(tableViewCell:browseImage:)]) {
        [self.delegate tableViewCell:self browseImage:((UIImageView*)[[collectionView cellForItemAtIndexPath:indexPath].contentView.subviews objectAtIndex:0]).image];
    }
    return ;
}

+(CGFloat)cellHeight {
    return commentHeight + 2*kControlMargin;
}

@end
