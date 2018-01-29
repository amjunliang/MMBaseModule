//
//  DPDateUtil.h
//  
//
//  Created by MaJunliang on 13-8-31.
//  Copyright (c) 2013年 MaJunliang. All rights reserved.
//

#import <Foundation/Foundation.h>

/** 时间 */
#define SECOND      (1)
#define MINUTE      (60)
#define HOUR        (60 * 60)
#define DAY         (60 * 60 * 24UL)

/** 常用工具类
 *
 *  常用工具类，包括日期转换、时间计算等
 */
@interface DateUtil : NSObject


/** 获取带有时间的日期格式
 *
 *  获取日期格式："yyyy-MM-dd HH:mm:ss"
 *  @return 日期格式
 */
+ (NSDateFormatter *)dateFormatter;

/** 获取没有时间的日期格式
 *
 *  获取日期格式："yyyy-MM-dd"
 *  @return 日期格式
 */
+ (NSDateFormatter *)dateFormatterWithoutTime;

/** 获取很早以前的时间
 *
 *  获取日期格式为："yyyy-MM-dd HH:mm:ss"的以前日期
 *  @return 日期字符串
 */
+ (NSString *)datePastString;

/** 获取当前日期
 *
 *  获取日期格式为："yyyy-MM-dd HH:mm:ss"的当前日期
 *  @return 日期字符串
 */
+ (NSString *)dateString;

/** 字符串转换成带有时间的日期
 *
 *  把字符串格式的日期转换为日期格式："yyyy-MM-dd HH:mm:ss"
 *  @param dateString 字符串格式的日期
 *  @return 日期格式
 */
+ (NSDate *)stringToDate:(NSString *)dateString;

/** 字符串转换成没有时间的日期
 *
 *  把字符串格式的日期转换为日期格式："yyyy-MM-dd"
 *  @param dateString 字符串格式的日期
 *  @return 日期格式
 */
+ (NSDate *)stringToDateWithoutTime:(NSString *)dateString;

/** 日期转换成带有时间的字符串
 *
 *  把日期转换成字符串格式："yyyy-MM-dd HH:mm:ss"
 *  @param date 日期
 *  @return 日期的字符串
 */
+ (NSString *)dateToString:(NSDate *)date;

/** 日期转换成没有时间的字符串
 *
 *  把日期转换成字符串格式："yyyy-MM-dd"
 *  @param date 日期
 *  @return 日期的字符串
 */
+ (NSString *)dateToStringWithoutTime:(NSDate *)date;

/** 日期的字符串格式之间转换
 *
 *  把格式为："yyyy-MM-dd HH:mm:ss"的字符串
 *  转换格式为："yyyy-MM-dd"的字符串
 *  @param dateString 日期的字符串
 *  @return 日期的字符串
 */
+ (NSString *)dateStringToWithoutTime:(NSString *)dateString;

/** 计算时间间隔
 *
 *  把传入的两个字符串格式的时间转换成日期格式，
 *  并计算出两个时间相差的秒数
 *  @param fromString 起始时间字符串
 *  @param toString 结束时间字符串
 *  @return 相差的秒数
 */
+ (NSTimeInterval)timeIntervalFromDateStr:(NSString *)fromString toDateStr:(NSString *)toString;

/**
 *  把时间转换成文本描述信息
 *
 *  @param time 时间数
 *
 *  @return 描述字符串
 */
+ (NSString *)descFromTime:(NSTimeInterval)time;

/**
 *  判断输入日期是否在本周
 *
 *  @param date 日期
 *
 *  @return 是否在本周内
 */
+ (BOOL)isInThisWeekTheDate:(NSDate *)date;

/**
 *  日期转换为星期
 *
 *  @param date 日期
 *
 *  @return 星期
 */
+ (NSString *)dateToWeek:(NSDate *)date;

/**
 *  获取本地当前时间
 *
 *  @return 当前时间
 */
+ (NSDate *)localCurrentDate;


@end
