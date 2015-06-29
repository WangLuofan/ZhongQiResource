//
//  ZQMediaReportTableViewCell.m
//  中企资源
//
//  Created by 王落凡 on 15/6/16.
//  Copyright (c) 2015年 王落凡. All rights reserved.
//

#import "ZQStarRatingView.h"
#import "ZQMediaReportTableViewCell.h"

#define kControlMargin 5
#define kBottomButtonBarHeight 30
#define kMediaReportTableViewCellHeight 350

@interface ZQMediaReportTableViewCell () {
    UILabel* scoreLabel;
    UILabel* reportContentLabel;
    ZQStarRatingView* ratingView;
    
    UIButton* attentionButton;
}

@end

@implementation ZQMediaReportTableViewCell

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    
    if(self) {
        [self setSuccessExampleTableViewCellHeight:kMediaReportTableViewCellHeight];
        
        UILabel* commentLabel = [[UILabel alloc] initWithFrame:CGRectMake(self.detailLabel.frame.origin.x, self.detailLabel.frame.origin.y + self.detailLabel.frame.size.height + kControlMargin, 0, 0)];
        [commentLabel setFont:[UIFont systemFontOfSize:12.0f]];
        [commentLabel setText:@"总体评价:"];
        [commentLabel sizeToFit];
        [self addSubViewToContentView:commentLabel];
        
        ratingView = [[ZQStarRatingView alloc] initWithFrame:CGRectMake(commentLabel.frame.origin.x + commentLabel.frame.size.width, 0, commentLabel.frame.size.width * 2, commentLabel.frame.size.height * 3 / 2) numberOfStars:5];
        [ratingView setCenter:CGPointMake(ratingView.center.x, commentLabel.center.y)];
        [self addSubViewToContentView:ratingView];
        
        scoreLabel = [[UILabel alloc] initWithFrame:CGRectMake(ratingView.frame.origin.x + ratingView.frame.size.width, 0, 0, commentLabel.frame.size.height)];
        [scoreLabel setFont:[UIFont systemFontOfSize:12.0f]];
        [scoreLabel setCenter:CGPointMake(scoreLabel.center.x, ratingView.center.y)];
        [self addSubViewToContentView:scoreLabel];
        
        UIView* seperatorLine = [[UIView alloc] initWithFrame:CGRectMake(kControlMargin, ratingView.frame.origin.y + ratingView.frame.size.height + kControlMargin, [self contentViewBounds].size.width - 2*kControlMargin, 0.5f)];
        [seperatorLine setBackgroundColor:[UIColor lightGrayColor]];
        [self addSubViewToContentView:seperatorLine];
        
        reportContentLabel = [[UILabel alloc] initWithFrame:CGRectMake(kControlMargin, seperatorLine.frame.origin.y + seperatorLine.frame.size.height + kControlMargin, [self contentViewBounds].size.width - 2*kControlMargin, [self contentViewBounds].size.height - seperatorLine.frame.origin.y - seperatorLine.frame.size.height - kControlMargin - kBottomButtonBarHeight)];
        [reportContentLabel setFont:[UIFont systemFontOfSize:12.0f]];
        [reportContentLabel setNumberOfLines:0];
        [self addSubViewToContentView:reportContentLabel];
        
        UIView* subContentView = [[UIView alloc] initWithFrame:CGRectMake(0, [self contentViewBounds].size.height - kBottomButtonBarHeight, [self contentViewBounds].size.width, kBottomButtonBarHeight)];
        [self addSubViewToContentView:subContentView];
        
        UIButton* commentButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [commentButton setImage:[UIImage imageNamed:@"pl"] forState:UIControlStateNormal];
        [commentButton setTitle:@"评价" forState:UIControlStateNormal];
        [commentButton setTitleColor:[UIColor lightGrayColor] forState:UIControlStateNormal];
        [commentButton setTitleColor:[UIColor blackColor] forState:UIControlStateHighlighted];
        [commentButton.titleLabel setFont:[UIFont systemFontOfSize:12.0f]];
        [commentButton setFrame:CGRectMake(0, 0, subContentView.bounds.size.width / 3, commentButton.imageView.image.size.height / 2)];
        [commentButton setCenter:CGPointMake(commentButton.center.x, subContentView.bounds.size.height / 2)];
        [commentButton.imageView setContentMode:UIViewContentModeScaleAspectFit];
        [subContentView addSubview:commentButton];
        
        attentionButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [attentionButton setImage:[UIImage imageNamed:@"ygz"] forState:UIControlStateNormal];
        [attentionButton setTitleColor:[UIColor lightGrayColor] forState:UIControlStateNormal];
        [attentionButton setTitleColor:[UIColor blackColor] forState:UIControlStateHighlighted];
        
        [attentionButton.titleLabel setFont:[UIFont systemFontOfSize:12.0f]];
        [attentionButton setFrame:CGRectMake(commentButton.frame.origin.x + commentButton.frame.size.width, commentButton.frame.origin.y, commentButton.frame.size.width, commentButton.frame.size.height)];
        [attentionButton setCenter:CGPointMake(attentionButton.center.x, commentButton.center.y)];
        [attentionButton.imageView setContentMode:UIViewContentModeScaleAspectFit];
        [subContentView addSubview:attentionButton];
        
        UIButton* oneCallButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [oneCallButton setImage:[UIImage imageNamed:@"telphone"] forState:UIControlStateNormal];
        [oneCallButton setTitleColor:[UIColor lightGrayColor] forState:UIControlStateNormal];
        [oneCallButton setTitleColor:[UIColor blackColor] forState:UIControlStateHighlighted];
        [oneCallButton setTitle:@"一键呼叫" forState:UIControlStateNormal];
        [oneCallButton.titleLabel setFont:[UIFont systemFontOfSize:12.0f]];
        [oneCallButton setFrame:CGRectMake(attentionButton.frame.origin.x + attentionButton.frame.size.width, commentButton.frame.origin.y, attentionButton.frame.size.width, attentionButton.frame.size.height)];
        [oneCallButton setCenter:CGPointMake(oneCallButton.center.x, attentionButton.center.y)];
        [oneCallButton.imageView setContentMode:UIViewContentModeScaleAspectFit];
        [subContentView addSubview:oneCallButton];
    }
    
    return self;
}

-(void)setAttentionCount:(NSInteger)attentionCount {
    [attentionButton setTitle:[NSString stringWithFormat:@"%ld",(long)attentionCount] forState:UIControlStateNormal];
    return ;
}

-(void)setReportContent:(NSString *)reportContent {
    [reportContentLabel setText:reportContent];
    return ;
}

-(void)setRatingScore:(CGFloat)ratingScore {
    [ratingView setRating:ratingScore];
    [scoreLabel setText:[NSString stringWithFormat:@"%0.1f 分",ratingScore]];
    [scoreLabel sizeToFit];
    
    return ;
}

@end
