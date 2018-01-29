//
//  NSDictionary+Unicode.m
//  
//
//  Created by MaJunliang on 15/10/23.
//  Copyright © 2015年 MaJunliang. All rights reserved.
//

#import "NSDictionary+Unicode.h"

@implementation NSDictionary (Unicode)

- (NSString *)my_description
{
    NSString *desc = [self my_description];
    desc = [NSString stringWithCString:[desc cStringUsingEncoding:NSUTF8StringEncoding] encoding:NSNonLossyASCIIStringEncoding];
    return desc;
}

@end
