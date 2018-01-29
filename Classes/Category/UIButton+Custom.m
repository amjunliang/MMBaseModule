//
//  UIButton+Custom.m
//  
//
//  Created by MaJunliang on 15/11/14.
//  Copyright © 2015年 DongPi. All rights reserved.
//

#import "UIButton+Custom.h"

@implementation UIButton (Custom)

+ (instancetype)buttonWithFrame:(CGRect)frame backgroundColor:(UIColor *)backgroundColor
{
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.frame = frame;
    button.backgroundColor = backgroundColor;
    return button;
}

+ (instancetype)buttonWithFrame:(CGRect)frame image:(UIImage *)image forState:(UIControlState)state
{
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.frame = frame;
    [button setImage:image forState:state];
    return button;
}

+ (instancetype)buttonWithFrame:(CGRect)frame backgroundImage:(UIImage *)image forState:(UIControlState)state
{
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.frame = frame;
    [button setBackgroundImage:image forState:state];
    return button;
}

@end
