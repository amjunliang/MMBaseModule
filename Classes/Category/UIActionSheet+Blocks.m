//
//  UIActionSheet+Blocks.m
//  
//
//  Created by MaJunliang on 14/12/10.
//  Copyright (c) 2014年 DongPi. All rights reserved.
//

#import "UIActionSheet+Blocks.h"

static SheetCompletionBlock _completionBlock;
static SheetCancelBlock _cancelBlock;

@implementation UIActionSheet (Blocks)

+ (UIActionSheet *)showDPActionSheetWithTitle:(NSString *)title
                                       inView:(UIView *)inView
                            cancelButtonTitle:(NSString *)cancelButtonTitle
                            otherButtonTitles:(NSArray *)otherButtons
                                 onCompletion:(SheetCompletionBlock)completioned
                                     onCancel:(SheetCancelBlock)cancelled
{
    _cancelBlock  = [cancelled copy];
    _completionBlock  = [completioned copy];
    
    UIActionSheet *actionSheet = [[UIActionSheet alloc] initWithTitle:title
                                                             delegate:[self self]
                                                    cancelButtonTitle:cancelButtonTitle
                                               destructiveButtonTitle:nil
                                                    otherButtonTitles:nil];
    
    
    for (NSString *buttonTitle in otherButtons)
        [actionSheet addButtonWithTitle:buttonTitle];
    
    [actionSheet showInView:inView];
    return actionSheet;
}

+ (void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if (buttonIndex == [actionSheet cancelButtonIndex]) {
        if (_cancelBlock) {
            _cancelBlock();
        }
    }
    else {
        if (_completionBlock) {
            _completionBlock(buttonIndex); // cancel button is button 0
        }
    }
}

@end
