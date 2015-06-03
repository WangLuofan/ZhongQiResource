//
//  ZQTypeChooseView.h
//  中企资源
//
//  Created by 王落凡 on 15/6/3.
//  Copyright (c) 2015年 王落凡. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger, ZQTypeChooseViewType) {
    ZQTypeChooseViewType_Type,ZQTypeChooseViewType_Category
};

@protocol ZQTypeChooseViewDelegate <NSObject>

@optional
-(void)chooseViewType:(ZQTypeChooseViewType)type content:(NSString*)content;

@end

@interface ZQTypeChooseView : UIView

@property(nonatomic,assign) ZQTypeChooseViewType chooseViewType;
@property(nonatomic,assign) id<ZQTypeChooseViewDelegate> delegate;

-(void)setContentsWithArray:(NSArray*)contents type:(ZQTypeChooseViewType)type;

@end
