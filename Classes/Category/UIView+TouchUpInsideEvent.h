//
//  UIView+Hightlight.h
//  
//
//  Created by amjunliang on 2018/1/20.
//  Copyright © 2018年 amjunliang. All rights reserved.
//

#import <UIKit/UIKit.h>
@class HightliteGesture;
typedef void (^ViewTouchUpInsideBlock)(UIView *view);

@interface UIView (TouchUpInsideEvent)<UIGestureRecognizerDelegate>

- (void)addViewTouchUpInsideEventWithBlock:(ViewTouchUpInsideBlock)block;
- (void)removeViewTouchUpInsideEvent;
- (HightliteGesture *)hightliteGesture;
@end
