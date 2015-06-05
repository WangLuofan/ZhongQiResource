//
//  ZQFilterView.h
//  中企资源
//
//  Created by 王落凡 on 15/6/4.
//  Copyright (c) 2015年 王落凡. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ZQFilterView : UIView

-(void)showFilterContentView;
-(void)dismissFilterContentView;
-(void)addLeftSrouceWithArray:(NSArray*)leftSrcArray RightSourceArray:(NSArray*)rightSrcArray;;

@end
