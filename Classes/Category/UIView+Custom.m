//
//  UIView+Custom.m
//  
//
//  Created by MaJunliang on 14/12/18.
//  Copyright (c) 2014年 DongPi. All rights reserved.
//

#import "UIView+Custom.h"
#import "UIView+frame.h"

@implementation UIView (Custom)


+ (instancetype)viewWithFrame:(CGRect)frame
              backgroundColor:(UIColor *)backgroundColor
                 cornerRadius:(NSNumber *)cornerRadius
{
    UIView *view = [[UIView alloc]initWithFrame:frame];
    view.clipsToBounds = YES;
    view.layer.cornerRadius = cornerRadius.floatValue;
    view.backgroundColor = backgroundColor;
    return view;
}

+ (UIView *)horizontalLineX:(float)x y:(float)y width:(float)width
{
    UIView *line = [[UIView alloc] initWithFrame:CGRectMake(x, y - SINGLE_LINE_ADJUST_OFFSET, width, SINGLE_LINE_WIDTH)];
    line.backgroundColor = UIColorFromRGB(0xd9d9d9);
    return line;
}

+ (UIView *)verticalLineX:(float)x y:(float)y height:(float)height
{
    UIView *line = [[UIView alloc] initWithFrame:CGRectMake(x - SINGLE_LINE_ADJUST_OFFSET, y, SINGLE_LINE_WIDTH, height)];
    line.backgroundColor = UIColorFromRGB(0xd9d9d9);
    return line;
}

- (void)removeAllSubViews
{
    for (UIView *view in self.subviews) {
        [view removeFromSuperview];
    }
}

@end
