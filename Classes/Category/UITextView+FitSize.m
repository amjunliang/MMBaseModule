//
//  UITextView+FitSize.m
//  
//
//  Created by MaJunliang on 15/4/2.
//  Copyright (c) 2015年 DongPi. All rights reserved.
//

#import "UITextView+FitSize.h"

@implementation UITextView (FitSize)

+ (CGSize)getFitSize:(CGSize)size text:(NSString *)text
{
    UITextView *textView = [[UITextView alloc] init];
    textView.text = text;
    return [textView sizeThatFits:size];
}

+ (CGFloat)fitHeightWithWidth:(CGFloat)width text:(NSString *)text
{
    CGSize size = [self getFitSize:CGSizeMake(width, MAXFLOAT) text:text];
    return size.height;
}

@end
