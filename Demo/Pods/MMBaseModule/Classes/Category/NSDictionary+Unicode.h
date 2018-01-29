//
//  NSDictionary+Unicode.h
//  
//
//  Created by MaJunliang on 15/10/23.
//  Copyright © 2015年 MaJunliang. All rights reserved.
//

#import <Foundation/Foundation.h>


/* 解决打印中文是十六进制编码的问题
   1.需要引入JRSwizzle.h文件
   2.调用 + (BOOL)jr_swizzleMethod:(SEL)origSel_ withMethod:(SEL)altSel_ error:(NSError**)error_;
 */
@interface NSDictionary (Unicode)

@end
