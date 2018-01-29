//
//  MD5Util.m
//  
//
//  Created by MaJunliang on 15/11/11.
//  Copyright © 2015年 MaJunliang. All rights reserved.
//

#import "MD5Util.h"
#import <CommonCrypto/CommonDigest.h>

@implementation MD5Util


+ (NSString *)stringWithMD5:(NSString *)source
{
    const char *cStr = [source UTF8String];
    unsigned char result[32];
    CC_MD5(cStr, (CC_LONG)strlen(cStr), result);
    return [[NSString stringWithFormat:
            @"%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X",
            result[0], result[1], result[2], result[3],
            result[4], result[5], result[6], result[7],
            result[8], result[9], result[10], result[11],
            result[12], result[13], result[14], result[15]
            ] lowercaseString];
}

+ (NSData *)dataWithMD5:(NSData *)data
{
    const void *ptrData = [data bytes];
    unsigned char result[CC_MD5_DIGEST_LENGTH];
    CC_MD5(ptrData, (CC_LONG)[data length], result);
    return [NSData dataWithBytes:result length:16];
}

+ (NSData *)dataWithStringMD5:(NSString *)source
{
    const char *cStr = [source UTF8String];
    unsigned char result[16];
    CC_MD5(cStr, (CC_LONG)strlen(cStr), result);
    return [NSData dataWithBytes:result length:16];
}


@end
