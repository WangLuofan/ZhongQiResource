//
//  CommAlgorithm.m
//  要买车
//
//  Created by 王落凡 on 15/4/27.
//  Copyright (c) 2015年 王落凡. All rights reserved.
//

#import "CommAlgorithm.h"

@implementation CommAlgorithm

+(UIImage*)createImageWithRed:(CGFloat)red Green:(CGFloat)green Blue:(CGFloat) blue Alpha:(CGFloat)alpha {
    CGRect rect=CGRectMake(0.0f, 0.0f, 1.0f, 1.0f);
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context=UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(context, [[UIColor colorWithRed:red green:green blue:blue alpha:alpha] CGColor]);
    CGContextFillRect(context, rect);
    UIImage* theImage=UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return theImage;
}

+(UIImage*)createImageWithUIColor:(UIColor *)color {
    CGRect rect = CGRectMake(0.0f, 0.0f, 1.0f, 1.0f);
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context=UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(context, [color CGColor]);
    CGContextFillRect(context, rect);
    UIImage* theImage=UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return theImage;
}

+(NSData *)encodingImageWithUIImage:(UIImage *)image {
    NSData* data = UIImageJPEGRepresentation(image,1.0f);
    return [data base64EncodedDataWithOptions:NSDataBase64Encoding64CharacterLineLength];
}

+(UIImage *)decodingImageWithData:(NSData *)imgData {
    NSData* data = [[NSData alloc] initWithBase64EncodedData:imgData options:NSDataBase64DecodingIgnoreUnknownCharacters];
    return [UIImage imageWithData:data];
}

@end
