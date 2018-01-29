//
//  UIViewController+AlertView.h
//  MMBaseModule
//
//  Created by MaJunliang on 15/12/29.
//  Copyright © 2015年 MaJunliang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIViewController (AlertView)

- (void)showAlertViewWithTitle:(NSString *)title
                       message:(NSString *)message
                 okButtonTitle:(NSString *)okButtonTitle
             cancelButtonTitle:(NSString *)cancelButtonTitle
                  onCompletion:(void(^)(void))completioned
                      onCancel:(void(^)(void))cancelled;

- (void)showAlertView:(NSString *)message cancelBlock:(void(^)(void))cancelled;

- (void)showAlertView:(NSString *)message;

- (void)showCameraPermissionAlertView;
@end
