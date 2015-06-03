//
//  ZQLoadMoreView.m
//  中企资源
//
//  Created by 王落凡 on 15/6/2.
//  Copyright (c) 2015年 王落凡. All rights reserved.
//

#import "ZQLoadMoreView.h"

@interface ZQLoadMoreView () {
    UIActivityIndicatorView* indicatorView;
}

@end

@implementation ZQLoadMoreView

-(instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    
    if(self) {
        indicatorView = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhite];
        [indicatorView setFrame:CGRectMake(frame.size.width / 8, 0, frame.size.height / 2, frame.size.height / 2)];
        [indicatorView setCenter:CGPointMake(indicatorView.center.x, frame.size.height / 2)];
        [indicatorView setColor:[UIColor blackColor]];
        [indicatorView startAnimating];
        [self addSubview:indicatorView];
        
        UILabel* label = [[UILabel alloc] initWithFrame:CGRectMake(indicatorView.frame.origin.x + indicatorView.frame.size.width, 0, self.frame.size.width - indicatorView.frame.origin.x - indicatorView.frame.size.width, indicatorView.frame.size.height)];
        [label setFont:[UIFont systemFontOfSize:12.0f]];
        [label setTextColor:[UIColor lightGrayColor]];
        [label setText:@"正在努力为您加载..."];
        [label setTextAlignment:NSTextAlignmentCenter];
        [label setCenter:CGPointMake(label.center.x, indicatorView.center.y)];
        [self addSubview:label];
    }
    
    return self;
}


-(void)loadComplete {
    [indicatorView stopAnimating];
    return ;
}

@end
