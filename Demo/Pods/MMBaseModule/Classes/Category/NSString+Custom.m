//
//  NSString+Custom.m
//  MMBaseModule
//
//  Created by MaJunliang on 15/12/16.
//  Copyright © 2015年 MaJunliang. All rights reserved.
//

#import "NSString+Custom.h"
#import <UIKit/UIKit.h>

@implementation NSString (Custom)

- (float)widthWithFont:(float)font limitHeight:(float)height
{
    NSDictionary *attribute = @{NSFontAttributeName : [UIFont systemFontOfSize:font]};
    CGSize size = [self boundingRectWithSize:CGSizeMake(CGFLOAT_MAX, height) options:NSStringDrawingUsesLineFragmentOrigin attributes:attribute context:nil].size;
    return size.width;
}

- (float)heightWithFont:(float)font limitWidth:(float)width
{
    NSDictionary *attribute = @{NSFontAttributeName : [UIFont systemFontOfSize:font]};
    CGSize size = [self boundingRectWithSize:CGSizeMake(width, CGFLOAT_MAX) options:NSStringDrawingUsesLineFragmentOrigin attributes:attribute context:nil].size;
    return size.height;
}

- (NSString *)stringByTrimingWhitespace
{
    return [self stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
}

- (NSString *)pinyinString
{
    NSMutableString *source = [self mutableCopy];
    CFStringTransform((__bridge CFMutableStringRef)source, NULL, kCFStringTransformMandarinLatin, NO);
    CFStringTransform((__bridge CFMutableStringRef)source, NULL, kCFStringTransformStripDiacritics, NO);
    return source;
}

- (BOOL)isPureInt
{
    NSScanner *scan = [NSScanner scannerWithString:self];
    int val;
    return [scan scanInt:&val] && [scan isAtEnd];
}

@end
