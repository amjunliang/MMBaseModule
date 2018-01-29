//
//  UIColor+Create.m
//  MMBaseModule
//
//  Created by MaJunliang on 16/1/7.
//  Copyright © 2016年 MaJunliang. All rights reserved.
//

#import "UIColor+Create.h"

@implementation UIColor (Create)

+ (UIColor *)colorWithString:(NSString *)colorString
{
    unsigned int c;
    if ([colorString characterAtIndex: 0] == '#') {
        [[NSScanner scannerWithString:[colorString substringFromIndex: 1]] scanHexInt: &c];
    } else {
        [[NSScanner scannerWithString:colorString] scanHexInt: &c];
    }
    return [UIColor colorWithRed: ((c & 0xff0000) >> 16)/255.0
                           green: ((c & 0xff00) >> 8)/255.0
                            blue: (c & 0xff)/255.0
                           alpha: 1.0];
}

@end
