//
//  UITextView+FitSize.h
//  
//
//  Created by MaJunliang on 15/4/2.
//  Copyright (c) 2015年 DongPi. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UITextView (FitSize)

+ (CGFloat)fitHeightWithWidth:(CGFloat)width text:(NSString *)text;

@end
