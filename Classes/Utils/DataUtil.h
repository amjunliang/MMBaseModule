//
//  DataMacro.h
//  weipiHD
//
//  Created by ZhangJunjie on 15/12/15.
//  Copyright © 2015年 ZhangJunjie. All rights reserved.
//

#ifndef DataMacro_h
#define DataMacro_h


//宏定义单例模式
#define DEFINE_SINGLETON_FOR_HEADER(className) \
\
+ (className *)shared##className;

#define DEFINE_SINGLETON_FOR_CLASS(className) \
\
static className *shared##className = nil; \
+ (className *)shared##className { \
static dispatch_once_t onceToken; \
dispatch_once(&onceToken, ^{ \
shared##className = [[self alloc] init]; \
}); \
return shared##className; \
}

//调用performSelector时去掉内存警告
#define SuppressPerformSelectorLeakWarning(Stuff) \
do { \
_Pragma("clang diagnostic push") \
_Pragma("clang diagnostic ignored \"-Warc-performSelector-leaks\"") \
Stuff; \
_Pragma("clang diagnostic pop") \
} while (0)


#define SELF            @"SELF"
#define ClassName       @"ClassName"

// block self
#define WEAKSELF        typeof(self) __weak weakSelf = self;
#define STRONGSELF      typeof(weakSelf) __strong strongSelf = weakSelf;

#endif /* DataMacro_h */
