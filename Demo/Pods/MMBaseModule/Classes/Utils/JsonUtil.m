//
//  JsonUtil.m
//  
//
//  Created by MaJunliang on 15/11/11.
//  Copyright © 2015年 MaJunliang. All rights reserved.
//

#import "JsonUtil.h"


@implementation NSString (DPJSONSerialization)

- (id)objectFromJSONString
{
    NSData *data = [self dataUsingEncoding:NSUTF8StringEncoding];
    id dic = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
    return dic;
}

@end


@implementation NSArray (DPJSONSerialization)

- (NSString *)JSONString
{
    NSData *data = [NSJSONSerialization dataWithJSONObject:self options:NSJSONWritingPrettyPrinted error:nil];
    NSString *string = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
    return string;
}

@end


@implementation NSDictionary (DPJSONSerialization)

- (NSString *)JSONString
{
    NSData *data = [NSJSONSerialization dataWithJSONObject:self options:NSJSONWritingPrettyPrinted error:nil];
    NSString *string = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
    return string;
}

@end

@implementation JsonUtil

@end
