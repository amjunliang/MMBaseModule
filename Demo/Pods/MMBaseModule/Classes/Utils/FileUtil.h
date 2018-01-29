//
//  FileUtil.h
//  
//
//  Created by MaJunliang on 14/11/29.
//  Copyright (c) 2014年 DongPi. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface FileUtil : NSObject

//获取本地资源文件路径
+ (NSString *)getResourceFilePath:(NSString *)fileName;
//读取本地资源文件内容
+ (NSData *)getDataFromResourceFile:(NSString *)fileName;

//获取cache文件夹中文件的路径
+ (NSString *)getCacheFilePath:(NSString *)fileName;

//获取文件的大小
+ (NSUInteger)fileSizeAtPath:(NSString *)filePath;

//获取文件夹的大小
+ (NSUInteger)folderSizeAtPath:(NSString *)folderPath;

/**
 *  保存数据到本地
 *
 *  @param data 文件数据
 *  @param fileName 文件名
 *
 *  @return 是否成功
 */
+ (BOOL)saveData:(NSData *)data cacheFileName:(NSString *)fileName;

/**
 *  从本地文件获取数据
 *
 *  @param fileName 文件名
 *
 *  @return 文件数据
 */
+ (NSData *)getDataFromCacheFile:(NSString *)fileName;

/** 把字典写入文件中
 *
 *  @param dict 字典内容
 *  @param fileName 文件名
 */
+ (BOOL)saveDictionary:(NSDictionary *)dict cacheFileName:(NSString *)fileName;

/** 从文件中读取字典信息
 *
 *  @param fileName 文件名
 *  @return 字典信息
 */
+ (NSDictionary *)getDictionaryFromCacheFile:(NSString *)fileName;

/** 把数组写入文件中
 *
 *  @param array 数组内容
 *  @param fileName 文件名
 */
+ (BOOL)saveArray:(NSArray *)array cacheFileName:(NSString *)fileName;

/** 从文件中读取数组信息
 *
 *  @param fileName 文件名
 *  @return 数组信息
 */
+ (NSArray *)getArrayFromCacheFile:(NSString *)fileName;

/** 把对象写入文件中
 *
 *  @param object 对象
 *  @param fileName 文件名
 */
+ (BOOL)saveObject:(id)object cacheFileName:(NSString *)fileName;

/** 从文件中读取对象信息
 *
 *  @param fileName 文件名
 *  @return 对象信息
 */
+ (id)getObjectFromCacheFile:(NSString *)fileName;

//获取文件夹下的.log文件
+ (NSArray *)logFilesInFolderPath:(NSString *)folderPath;


@end
