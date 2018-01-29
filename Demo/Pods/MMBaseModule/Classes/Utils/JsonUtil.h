//
//  JsonUtil.h
//
//
//  Created by MaJunliang on 15/11/11.
//  Copyright © 2015年 MaJunliang. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface NSString (DPJSONSerialization)
- (id)objectFromJSONString;
@end

@interface NSArray (DPJSONSerialization)
- (NSString *)JSONString;
@end

@interface NSDictionary (DPJSONSerialization)
- (NSString *)JSONString;
@end

@interface JsonUtil : NSObject

@end
