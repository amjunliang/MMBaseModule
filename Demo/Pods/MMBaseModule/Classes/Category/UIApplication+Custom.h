//
//  UIApplication+Custom.h
//  
//
//  Created by MaJunliang on 14/11/30.
//  Copyright (c) 2014年 DongPi. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIApplication (Custom)

+ (void)callPhone:(NSString *)phoneNumber;
+ (void)openURL:(NSString *)urlString;

@end
