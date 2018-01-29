//
//  UIImagePickerController+Orientation.m
//  MMBaseModule
//
//  Created by zhangyang on 16/3/4.
//  Copyright © 2016年 MaJunliang. All rights reserved.
//

#import "UIImagePickerController+Orientation.h"

@implementation UIImagePickerController (Orientation)
-(UIInterfaceOrientation)preferredInterfaceOrientationForPresentation {
    
    return UIInterfaceOrientationLandscapeLeft;
    
}

- (NSUInteger)supportedInterfaceOrientations{
    
    return UIInterfaceOrientationMaskLandscape;
    
}

- (BOOL)shouldAutorotate {
    
    return YES;
    
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    
    if(UIInterfaceOrientationIsLandscape(interfaceOrientation)) {
        
        return YES;
        
    } else {
        
        return NO;
        
    }
    
}
@end
