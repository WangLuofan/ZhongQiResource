//
//  CommAlgorithm.h
//  要买车
//
//  Created by 王落凡 on 15/4/27.
//  Copyright (c) 2015年 王落凡. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface CommAlgorithm : NSObject

+(UIImage*)createImageWithRed:(CGFloat)red Green:(CGFloat)green Blue:(CGFloat) blue Alpha:(CGFloat)alpha;
+(UIImage*)createImageWithUIColor:(UIColor*)color;
+(NSData*)encodingImageWithUIImage:(UIImage*)image;
+(UIImage*)decodingImageWithData:(NSData*)imgData;

@end
