//
//  UIViewController+ShowHud.h
//  
//
//  Created by MaJunliang on 14/12/22.
//  Copyright (c) 2014年 DongPi. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIViewController (ShowHud)

- (void)addProgressingViewWithMessage:(NSString *)msg;

- (void)removeProgressingView;

- (void)showTextOnly:(NSString *)text;

- (void)showTextOnly:(NSString *)text andDelay:(float)delay;

- (void)showWithLabelMixed;


@end
