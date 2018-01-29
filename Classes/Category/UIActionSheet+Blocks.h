//
//  UIActionSheet+Blocks.h
//  
//
//  Created by MaJunliang on 14/12/10.
//  Copyright (c) 2014年 DongPi. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void (^SheetCompletionBlock)(NSInteger buttonIndex);
typedef void (^SheetCancelBlock)();

@interface UIActionSheet (Blocks) <UIActionSheetDelegate>

+ (UIActionSheet *)showDPActionSheetWithTitle:(NSString *)title
                                       inView:(UIView *)inView
                            cancelButtonTitle:(NSString *)cancelButtonTitle
                            otherButtonTitles:(NSArray *)otherButtons
                                 onCompletion:(SheetCompletionBlock)completioned
                                     onCancel:(SheetCancelBlock)cancelled;

@end
