//
//  UIView+frame.h
//  
//
//  Created by zhangyang on 15/8/18.
//  Copyright (c) 2015年 DongPi. All rights reserved.
//

#import <UIKit/UIKit.h>


#define PrintRect(frame) \
DDLogDebug(@"X:%f,Y:%f,W:%f,H:%f",frame.origin.x,frame.origin.y,frame.size.width,frame.size.height)

//RGB值
#define COLORRGB(r,g,b) [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:1]

#define UIColorFromRGB(rgbValue) [UIColor \
colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 \
green:((float)((rgbValue & 0xFF00) >> 8))/255.0 \
blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]

//主要页面背景颜色
#define kMasterViewBackgroundColor COLORRGB(28,36,47)

//设置状态栏状态
#define SetStatusBarLight \
[[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleLightContent];

#define SetStatusBarDefault \
[[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleDefault];


//设备宽高
#define kScreenWidth        [UIScreen mainScreen].bounds.size.width
#define kScreenHeight       [UIScreen mainScreen].bounds.size.height

//应用框架坐标
#define kAppFrameX          [UIScreen mainScreen].applicationFrame.origin.x
#define kAppFrameY          [UIScreen mainScreen].applicationFrame.origin.y
#define kAppFrameWidth      [UIScreen mainScreen].applicationFrame.size.width
#define kAppFrameHeight     [UIScreen mainScreen].applicationFrame.size.height

//status高度
#define KStatusHeight       kAppFrameY
//navBar高度
#define kNavBarHeight       44.0

//带有导航控制器时的frame
#define KCustomViewFrameY       (KStatusHeight + kNavBarHeight + 0.5)
#define KCustomViewFrameHeight  (kScreenHeight - KCustomViewFrameY)


@interface UIView (frame)
// Frame
@property (nonatomic) CGPoint viewOrigin;
@property (nonatomic) CGSize viewSize;

// Frame Origin
@property (nonatomic) CGFloat x;
@property (nonatomic) CGFloat y;

// Frame Size
@property (nonatomic) CGFloat width;
@property (nonatomic) CGFloat height;

// Frame Borders
@property (nonatomic) CGFloat top;
@property (nonatomic) CGFloat left;
@property (nonatomic) CGFloat bottom;
@property (nonatomic) CGFloat right;

// Center Point

@property (nonatomic) CGPoint center;
@property (nonatomic) CGFloat centerX;
@property (nonatomic) CGFloat centerY;

// Middle Point
@property (nonatomic, readonly) CGPoint middlePoint;
@property (nonatomic, readonly) CGFloat middleX;
@property (nonatomic, readonly) CGFloat middleY;

//调整view的显示区域,宽度放大size.width*2,高度放大size.height*2,中心位置不变
- (void)adjustSize:(CGSize)size;

/**
 * 计算一个view相对于屏幕的坐标
 */
+ (CGRect)relativeFrameForScreenWithView:(UIView *)v;

@end
