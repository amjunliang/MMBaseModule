//
//  UIApplication+Custom.m
//  
//
//  Created by MaJunliang on 14/11/30.
//  Copyright (c) 2014年 DongPi. All rights reserved.
//

#import "UIApplication+Custom.h"

@implementation UIApplication (Custom)

+ (void)callPhone:(NSString *)phoneNumber
{
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:[NSString stringWithFormat:@"tel://%@",phoneNumber]]];
}

+ (void)openURL:(NSString *)urlString
{
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:urlString]];
}

@end
