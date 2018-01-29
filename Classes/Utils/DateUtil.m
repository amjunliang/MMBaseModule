//
//  DPDateUtil.m
//  
//
//  Created by MaJunliang on 13-8-31.
//  Copyright (c) 2013年 MaJunliang. All rights reserved.
//

#import "DateUtil.h"

@implementation DateUtil

+ (NSDateFormatter *)dateFormatter
{
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    return dateFormatter;
}

+ (NSDateFormatter *)dateFormatterWithoutTime
{
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"yyyy-MM-dd"];
    return dateFormatter;
}

+ (NSString *)datePastString
{
    return [[self dateFormatter] stringFromDate:[NSDate distantPast]];
}

+ (NSString *)dateString
{
    return [[self dateFormatter] stringFromDate:[NSDate date]];
}

+ (NSDate *)stringToDate:(NSString *)dateString
{
    return [[self dateFormatter] dateFromString:dateString];
}

+ (NSDate *)stringToDateWithoutTime:(NSString *)dateString
{
    return [[self dateFormatterWithoutTime] dateFromString:dateString];
}

+ (NSString *)dateToString:(NSDate *)date
{
    return [[self dateFormatter] stringFromDate:date];
}

+ (NSString *)dateToStringWithoutTime:(NSDate *)date
{
    return [[self dateFormatterWithoutTime] stringFromDate:date];
}

+ (NSString *)dateStringToWithoutTime:(NSString *)dateString
{
    NSDate *date = [self stringToDate:dateString];
    return [self dateToStringWithoutTime:date];
}

+ (NSTimeInterval)timeIntervalFromDateStr:(NSString *)fromString toDateStr:(NSString *)toString
{
    NSDate *fromDate = [self stringToDate:fromString];
    NSDate *toDate = [self stringToDate:toString];
    return [toDate timeIntervalSinceDate:fromDate];
}

+ (NSString *)descFromTime:(NSTimeInterval)time
{
    if (time < 1e-7) return @"0秒";

    NSUInteger remainTime = time;
    if (remainTime >= DAY) {
        //大于1天，计算天数和小时
        NSInteger day = remainTime / DAY;
        NSInteger hour = (remainTime % DAY) / HOUR;
        return [NSString stringWithFormat:@"%ld天%ld小时", (long)day, (long)hour];
    }
    else if (remainTime >= HOUR) {
        //大于1小时，计算小时和分钟
        NSInteger hour = remainTime / HOUR;
        NSInteger minute = (remainTime % HOUR) / MINUTE;
        return [NSString stringWithFormat:@"%ld小时%ld分", (long)hour, (long)minute];
    }
    else if (remainTime >= MINUTE) {
        //大于1分钟，计算分钟和秒数
        NSInteger minute = remainTime / MINUTE;
        NSInteger second = remainTime % MINUTE;
        return [NSString stringWithFormat:@"%ld分%ld秒", (long)minute, (long)second];
    }
    else if (remainTime >= SECOND) {
        //大于1秒，计算秒数
        NSInteger second = remainTime / SECOND;
        return [NSString stringWithFormat:@"0分%ld秒", (long)second];
    }
    else
        return @"0秒";
}

+ (BOOL)isInThisWeekTheDate:(NSDate *)date
{
    NSDate *start;
    NSTimeInterval extends;
    
    NSCalendar *cal = [NSCalendar autoupdatingCurrentCalendar];
    BOOL success = [cal rangeOfUnit:NSCalendarUnitWeekOfMonth startDate:&start interval:&extends forDate:[NSDate date]];
    
    if(!success)
        return NO;
    
    NSTimeInterval dateInSecs = [date timeIntervalSinceReferenceDate];
    NSTimeInterval dayStartInSecs = [start timeIntervalSinceReferenceDate];
    
    if (dateInSecs > dayStartInSecs && dateInSecs < (dayStartInSecs+extends)) {
        return YES;
    }
    else {
        return NO;
    }
}

+ (NSString *)dateToWeek:(NSDate *)date
{
    NSCalendar *calendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
    NSInteger unitFlags = NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay | NSCalendarUnitWeekday | NSCalendarUnitHour | NSCalendarUnitMinute | NSCalendarUnitSecond;
    
    NSDateComponents *comps = [calendar components:unitFlags fromDate:date];
    NSInteger week = [comps weekday];
    return [self getweek:week];
}

+ (NSString *)getweek:(NSInteger)week
{
    switch (week) {
        case 1:
            return @"星期日";
        case 2:
            return @"星期一";
        case 3:
            return @"星期二";
        case 4:
            return @"星期三";
        case 5:
            return @"星期四";
        case 6:
            return @"星期五";
        case 7:
            return @"星期六";
        default:
            return @"";
    }
}

+ (NSDate *)localCurrentDate
{
    NSDate *date = [NSDate date];
    NSTimeZone *zone = [NSTimeZone systemTimeZone];
    NSInteger interval = [zone secondsFromGMTForDate:date];
    NSDate *localeDate = [date dateByAddingTimeInterval:interval];
    return localeDate;
}


@end
