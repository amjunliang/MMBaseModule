//
//  NSString+Validator.m
//  MMBaseModule
//
//  Created by MaJunliang on 15/12/16.
//  Copyright © 2015年 MaJunliang. All rights reserved.
//

#import "NSString+Validator.h"

@implementation NSString (Validator)

//手机号码校验
- (BOOL)validateMobile:(NSError **)error
{
    NSString *regex = @"^1[0-9]{10}$";
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", regex];
    if (![predicate evaluateWithObject:self]) {
        if (error != nil) {
            *error = [NSError errorWithDomain:@"" code:0 userInfo:@{NSLocalizedDescriptionKey : @"请输入正确的手机号码"}];
        }
        return NO;
    }
    return YES;
}

//固定电话或者手机号校验
- (BOOL)validateTelephone:(NSError **)error
{
    NSString *regex = @"^1[0-9]{10}$|^([0-9]{4}-|[0-9]{3}-)?([0-9]{8}|[0-9]{7})$";
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", regex];
    if (![predicate evaluateWithObject:self]) {
        if (error != nil) {
            *error = [NSError errorWithDomain:@"" code:0 userInfo:@{NSLocalizedDescriptionKey : @"请输入正确的电话"}];
        }
        return NO;
    }
    return YES;
}

//短信验证码校验
- (BOOL)validateAuthCode:(NSError **)error
{
    NSString *regex = @"^[0-9]{6}$";
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", regex];
    if (![predicate evaluateWithObject:self]) {
        if (error != nil) {
            *error = [NSError errorWithDomain:@"" code:0 userInfo:@{NSLocalizedDescriptionKey : @"验证码格式不正确"}];
        }
        return NO;
    }
    return YES;
}

//密码校验
- (BOOL)validatePassword:(NSError **)error
{
    NSString *regex = @"^[a-zA-Z0-9]{6,12}$";
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", regex];
    if (![predicate evaluateWithObject:self]) {
        if (error != nil) {
            *error = [NSError errorWithDomain:@"" code:0 userInfo:@{NSLocalizedDescriptionKey : @"请输入6~12位字母或数字"}];
        }
        return NO;
    }
    return YES;
}

@end
