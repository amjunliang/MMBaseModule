//
//  MD5Util.h
//  
//
//  Created by MaJunliang on 15/11/11.
//  Copyright © 2015年 MaJunliang. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MD5Util : NSObject


/** 将字符串进行MD5加密
 *
 *  @param source 要进行MD5的源
 *  @return 加密后的字符串
 */
+ (NSString *)stringWithMD5:(NSString *)source;

/** 将NSData进行MD5加密
 *
 *  @param data 要进行MD5的源
 *  @return 加密后的NSData
 */
+ (NSData *)dataWithMD5:(NSData *)data;

/** 将字符串进行MD5加密后转成NSData
 *
 *  @param source 要进行MD5的源
 *  @return 加密后的NSData
 */
+ (NSData *)dataWithStringMD5:(NSString *)source;


@end
