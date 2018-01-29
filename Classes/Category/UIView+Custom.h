//
//  UIView+Custom.h
//  
//
//  Created by MaJunliang on 14/12/18.
//  Copyright (c) 2014年 DongPi. All rights reserved.
//

#import <UIKit/UIKit.h>

//画一像素线的宏
#define SINGLE_LINE_WIDTH           (1 / [UIScreen mainScreen].scale)
#define SINGLE_LINE_ADJUST_OFFSET   ((1 / [UIScreen mainScreen].scale) / 2)

@interface UIView (Custom)

//一条横线
+ (UIView *)horizontalLineX:(float)x y:(float)y width:(float)width;

//一条竖线
+ (UIView *)verticalLineX:(float)x y:(float)y height:(float)height;

///创建view的快捷方式
+ (instancetype)viewWithFrame:(CGRect)frame
              backgroundColor:(UIColor *)backgroundColor
                 cornerRadius:(NSNumber *)cornerRadius;

///清空视图内容
- (void)removeAllSubViews;

@end
