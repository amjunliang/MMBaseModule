//
//  UIButton+Custom.h
//  
//
//  Created by MaJunliang on 15/11/14.
//  Copyright © 2015年 DongPi. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIButton (Custom)

+ (instancetype)buttonWithFrame:(CGRect)frame backgroundColor:(UIColor *)backgroundColor;
+ (instancetype)buttonWithFrame:(CGRect)frame image:(UIImage *)image forState:(UIControlState)state;
+ (instancetype)buttonWithFrame:(CGRect)frame backgroundImage:(UIImage *)image forState:(UIControlState)state;

@end
