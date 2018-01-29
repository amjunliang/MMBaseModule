//
//  NSString+Validator.h
//  MMBaseModule
//
//  Created by MaJunliang on 15/12/16.
//  Copyright © 2015年 MaJunliang. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (Validator)

//手机号码校验
- (BOOL)validateMobile:(NSError **)error;

//短信验证码校验
- (BOOL)validateAuthCode:(NSError **)error;

//用户密码校验
- (BOOL)validatePassword:(NSError **)error;

//固定电话或者手机号校验
- (BOOL)validateTelephone:(NSError **)error;
@end
