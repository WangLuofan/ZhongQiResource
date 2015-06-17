//
//  CommAlgorithm.m
//  要买车
//
//  Created by 王落凡 on 15/4/27.
//  Copyright (c) 2015年 王落凡. All rights reserved.
//

#import "CommAlgorithm.h"

@interface CommAlgorithm ()

@end

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

#pragma mark - 打印系统所有字体(辅助方法)
+(void) printAllFonts
{
    NSArray *familyNames = [[NSArray alloc] initWithArray:[UIFont familyNames]];
    NSArray *fontNames;
    
    NSInteger indFamily, indFont;
    
    for(indFamily=0; indFamily<[familyNames count]; ++indFamily)
    {
        NSLog(@"Family name:%@", [familyNames objectAtIndex:indFamily]);
        
        fontNames = [[NSArray alloc] initWithArray:[UIFont fontNamesForFamilyName:[familyNames objectAtIndex:indFamily]]];
        
        for(indFont=0; indFont<[fontNames count]; ++indFont)
        {
            NSLog(@"\tFont name:%@",[fontNames objectAtIndex:indFont]);
        }
    }
}

@end
