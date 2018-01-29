//
//  FileUtil.m
//  
//
//  Created by MaJunliang on 14/11/29.
//  Copyright (c) 2014年 DongPi. All rights reserved.
//

#import "FileUtil.h"

@implementation FileUtil

+ (NSString *)getResourceFilePath:(NSString *)fileName
{
    NSString *path = nil;
    if (fileName) {
        NSRange dotIndex = [fileName rangeOfString:@"." options:NSBackwardsSearch];
        if (dotIndex.location != NSNotFound) {
            path = [[NSBundle mainBundle] pathForResource:[fileName substringToIndex:dotIndex.location]
                                                   ofType:[fileName substringFromIndex:dotIndex.location + 1]];
        } else {
            path = [[NSBundle mainBundle] pathForResource:fileName ofType:@""];
        }
    }
    return path;
}

+ (NSData *)getDataFromResourceFile:(NSString *)fileName
{
    NSString *filePath = [self getResourceFilePath:fileName];
    return [NSData dataWithContentsOfFile:filePath];
}

+ (NSString *)getCacheFilePath:(NSString *)fileName
{
    NSString *cachePath = [NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES) objectAtIndex:0];
    return [cachePath stringByAppendingPathComponent:fileName];
}

+ (NSUInteger)fileSizeAtPath:(NSString *)filePath
{
    NSFileManager *manager = [NSFileManager defaultManager];
    if ([manager fileExistsAtPath:filePath]) {
        return [[manager attributesOfItemAtPath:filePath error:nil] fileSize];
    }
    return 0;
}

+ (NSUInteger)folderSizeAtPath:(NSString *)folderPath
{
    NSFileManager *manager = [NSFileManager defaultManager];
    if (![manager fileExistsAtPath:folderPath]) return 0;
    NSEnumerator *childFilesEnumerator = [[manager subpathsAtPath:folderPath] objectEnumerator];
    NSString *fileName;
    NSUInteger folderSize = 0;
    while ((fileName = [childFilesEnumerator nextObject]) != nil) {
        NSString *fileAbsolutePath = [folderPath stringByAppendingPathComponent:fileName];
        folderSize += [self fileSizeAtPath:fileAbsolutePath];
    }
    return folderSize;
}

+ (BOOL)saveData:(NSData *)data cacheFileName:(NSString *)fileName
{
    NSString *filePath = [self getCacheFilePath:fileName];
    return [data writeToFile:filePath atomically:YES];
}

+ (NSData *)getDataFromCacheFile:(NSString *)fileName
{
    NSString *filePath = [self getCacheFilePath:fileName];
    return [NSData dataWithContentsOfFile:filePath];
}

+ (BOOL)saveDictionary:(NSDictionary *)dict cacheFileName:(NSString *)fileName
{
    NSString *filePath = [self getCacheFilePath:fileName];
    return [dict writeToFile:filePath atomically: YES];
}

+ (NSDictionary *)getDictionaryFromCacheFile:(NSString *)fileName
{
    NSString *filePath = [self getCacheFilePath:fileName];
    return [NSDictionary dictionaryWithContentsOfFile:filePath];
}

+ (BOOL)saveArray:(NSArray *)array cacheFileName:(NSString *)fileName
{
    NSString *filePath = [self getCacheFilePath:fileName];
    return [array writeToFile:filePath atomically:YES];
}

+ (NSArray *)getArrayFromCacheFile:(NSString *)fileName
{
    NSString *filePath = [self getCacheFilePath:fileName];
    return [NSArray arrayWithContentsOfFile:filePath];
}

+ (BOOL)saveObject:(id)object cacheFileName:(NSString *)fileName
{
    NSData *objectData = [NSKeyedArchiver archivedDataWithRootObject:object];
    return [self saveData:objectData cacheFileName:fileName];
}

+ (id)getObjectFromCacheFile:(NSString *)fileName
{
    NSData *data = [self getDataFromCacheFile:fileName];
    return [NSKeyedUnarchiver unarchiveObjectWithData:data];
}

+ (NSArray *)logFilesInFolderPath:(NSString *)folderPath
{
    NSMutableArray *fileList = [[NSMutableArray alloc] init];
    NSFileManager *fileManger = [NSFileManager defaultManager];
    NSError *error = nil;
    for (NSString *fileName in [fileManger contentsOfDirectoryAtPath:folderPath error:&error]) {
        if ([fileName hasSuffix:@".log"]) {
            [fileList addObject:[folderPath stringByAppendingPathComponent:fileName]];
        }
    }
    return fileList;
}

@end
