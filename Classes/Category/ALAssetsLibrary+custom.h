//
//  ALAssetsLibrary+custom.h
//  
//
//  Created by zhangyang on 15/8/14.
//  Copyright (c) 2015年 DongPi. All rights reserved.
//

#import <AssetsLibrary/AssetsLibrary.h>
#import <UIKit/UIKit.h>

typedef void(^SaveImageCompletion)(NSError* error);

@interface ALAssetsLibrary (custom)
/**
 *  保存图片到指定相册  指定相册若不存在会自动创建相册
 *
 *  @param image           需要保存的图片
 *  @param albumName       相册名称
 *  @param completionBlock 完成后回调
 */
- (void)saveImage:(UIImage *)image toAlbum:(NSString *)albumName withCompletionBlock:(SaveImageCompletion)completionBlock;

/**
 *  将相机胶卷已有资源加入指定相册  指定相册若不存在会自动创建相册
 *
 *  @param assetURL        资源url
 *  @param albumName       相册名称
 *  @param completionBlock 完成后回调
 */
- (void)addAssetURL:(NSURL *)assetURL toAlbum:(NSString *)albumName withCompletionBlock:(SaveImageCompletion)completionBlock;

@end
