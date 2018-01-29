//
//  NSString+Custom.h
//  MMBaseModule
//
//  Created by MaJunliang on 15/12/16.
//  Copyright © 2015年 MaJunliang. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (Custom)

- (float)widthWithFont:(float)font limitHeight:(float)height;

- (float)heightWithFont:(float)font limitWidth:(float)width;

- (NSString *)stringByTrimingWhitespace;

//字符串转拼音
- (NSString *)pinyinString;

//判断是否为整型
- (BOOL)isPureInt;

@end
