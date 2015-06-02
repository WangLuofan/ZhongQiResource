//
//  ZQToolBarContentView.m
//  中企资源
//
//  Created by 王落凡 on 15/6/1.
//  Copyright (c) 2015年 王落凡. All rights reserved.
//

#import "ZQToolBar.h"
#import "ZQToolBarContentView.h"
#import "CommAlgorithm.h"

@interface ZQToolBarContentView ()<UITableViewDataSource,UITableViewDelegate> {
    UIView* toolBarContentView;
    UITableView* leftPartTableView;
    UITableView* rightPartTableView;
    NSArray* leftDatasourceArray;
    NSArray* rightDatasourceArray;
}

@end

@implementation ZQToolBarContentView

-(instancetype)initWithStyle:(ZQToolBarContentViewStyle)style toolBar:(ZQToolBar *)toolBar superView:(UIView *)superView {
    self = [super initWithFrame:CGRectMake(0, toolBar.bounds.size.height, superView.bounds.size.width, superView.bounds.size.height - toolBar.bounds.size.height)];
    
    if(self) {
        UIView* coverView = [[UIView alloc] initWithFrame:self.bounds];
        [coverView setBackgroundColor:[UIColor blackColor]];
        [coverView setAlpha:0.5f];
        [self addSubview:coverView];
        
        toolBarContentView = [[UIView alloc] initWithFrame:CGRectMake(0, 0.5, toolBar.bounds.size.width, 200)];
        [self addSubview:toolBarContentView];
        
        leftPartTableView = [[UITableView alloc] initWithFrame:toolBarContentView.bounds style:UITableViewStylePlain];
        [leftPartTableView setSeparatorStyle:UITableViewCellSeparatorStyleNone];
        [leftPartTableView setTag:0];
        [leftPartTableView setDelegate:self];
        [leftPartTableView setDataSource:self];
        [leftPartTableView setBounces:NO];
        [toolBarContentView addSubview:leftPartTableView];
    }
    
    return self;
}

-(BOOL)compareStringArray:(NSArray*)array1 Array:(NSArray*)array2 {
    BOOL bEqual = (array1.count == array2.count);
    if(!bEqual)
        return bEqual;
    
    for (int i = 0; i != array1.count; ++i) {
        if(![array1[i] isEqualToString:array2[i]]) {
            bEqual = NO;
            break;
        }
    }
 
    return bEqual;
}

-(void)setDataSourceArray:(NSArray *)leftSource rightSource:(NSArray *)rightSource {
    if(![self compareStringArray:leftDatasourceArray Array:leftSource]) {
        leftDatasourceArray = leftSource;
        [leftPartTableView reloadData];
    }
    if(![self compareStringArray:rightDatasourceArray Array:rightSource]) {
        rightDatasourceArray = rightSource;
        [rightPartTableView reloadData];
    }
    return ;
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if(tableView.tag == 0)
        return leftDatasourceArray.count;
    return rightDatasourceArray.count;
}

-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell* cell = nil;
    if(tableView.tag == 0) {
        cell = [tableView dequeueReusableCellWithIdentifier:@"LeftTableViewCellIdentifier"];
        if(cell == nil)
            cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"LeftTableViewCellIdentifier"];
        [cell setBackgroundColor:[UIColor colorWithRed:((CGFloat)242)/255 green:((CGFloat)240)/255 blue:((CGFloat)240)/255 alpha:1.0f]];
        [cell.imageView setHighlightedImage:[CommAlgorithm createImageWithRed:((CGFloat)231)/255 Green:((CGFloat)232)/255 Blue:((CGFloat)234)/255 Alpha:1.0f]];
        [cell.textLabel setText:(NSString *)leftDatasourceArray[indexPath.row]];
    }
    return cell;
}

@end
