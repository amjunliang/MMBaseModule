//
//  UIViewController+AlertView.m
//  MMBaseModule
//
//  Created by MaJunliang on 15/12/29.
//  Copyright © 2015年 MaJunliang. All rights reserved.
//

#import "UIViewController+AlertView.h"
#import <AVFoundation/AVFoundation.h>

@implementation UIViewController (AlertView)

- (void)showAlertViewWithTitle:(NSString *)title
                       message:(NSString *)message
                 okButtonTitle:(NSString *)okButtonTitle
             cancelButtonTitle:(NSString *)cancelButtonTitle
                  onCompletion:(void(^)(void))completioned
                      onCancel:(void(^)(void))cancelled
{
    if ([message hasPrefix:@"The request timed out"] ||
        [message hasPrefix:@"Could not connect to the server"] ||
        [message hasPrefix:@"A connection failure occurred"]) {
        message = @"网络连接失败";
    }

    UIAlertController *alertVC = [UIAlertController alertControllerWithTitle:title
                                                                     message:message
                                                              preferredStyle:UIAlertControllerStyleAlert];
    
    if (cancelButtonTitle) {
        UIAlertAction *action = [UIAlertAction actionWithTitle:cancelButtonTitle
                                                         style:UIAlertActionStyleDefault
                                                       handler:^(UIAlertAction * _Nonnull action) {
                                                           if (cancelled) {
                                                               cancelled();
                                                           }
                                                       }];
        [alertVC addAction:action];
    }
    
    if (okButtonTitle) {
        UIAlertAction *action = [UIAlertAction actionWithTitle:okButtonTitle
                                                         style:UIAlertActionStyleDefault
                                                       handler:^(UIAlertAction * _Nonnull action) {
                                                           if (completioned) {
                                                               completioned();
                                                           }
                                                       }];
        [alertVC addAction:action];
    }
    
    [self presentViewController:alertVC animated:YES completion:nil];
}

- (void)showAlertView:(NSString *)message cancelBlock:(void(^)(void))cancelled
{
    [self showAlertViewWithTitle:@"提示"
                         message:message
                   okButtonTitle:nil
               cancelButtonTitle:@"确定"
                    onCompletion:^{}
                        onCancel:cancelled];
}

- (void)showAlertView:(NSString *)message
{
    [self showAlertView:message cancelBlock:^{}];
}

- (void)showCameraPermissionAlertView
{
    NSString *mediaType = AVMediaTypeVideo;
    AVAuthorizationStatus authStatus = [AVCaptureDevice authorizationStatusForMediaType:mediaType];
    if(authStatus == AVAuthorizationStatusRestricted || authStatus == AVAuthorizationStatusDenied){
        //无权限
        [self showAlertViewWithTitle:@"无法启动相机"
                             message:@"请为微批HD开放相机权限，设置->隐私->相机->微批HD(打开)"
                       okButtonTitle:nil
                   cancelButtonTitle:@"好"
                        onCompletion:^{}
                            onCancel:nil];
        return;
    }
}

@end
