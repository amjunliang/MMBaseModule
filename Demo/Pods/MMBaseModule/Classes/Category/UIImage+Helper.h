//
//  UIImage+Helper.h
//  fleamarket
//
//  Created by  on 11-12-3.
//  Copyright (c) 2011年 Taobao. All rights reserved.
//

#import <UIKit/UIKit.h>

/** UIImage帮助类
 *
 *  UIImage帮助类，通过size、rect、alpha等方式设置图片
 */
@interface UIImage(Helper)

- (UIImage *)rescaleImageToSize:(CGSize)size;
- (UIImage *)cropImageToRect:(CGRect)cropRect;
- (UIImage *)rescaleAndcropImageWithRescaleSize:(CGSize)size andcropRect:(CGRect)rect;
- (CGSize)calculateNewSizeForCroppingBox:(CGSize)croppingBox;
- (UIImage *)cropCenterAndScaleImageToSize:(CGSize)cropSize;
- (UIImage *)roundedCornerImage:(NSInteger)cornerSize borderSize:(NSInteger)borderSize;
- (UIImage*)imageWithRadius:(float) radius 
					  width:(float)width
					 height:(float)height;
- (UIImage *)imageWithAlpha;
- (UIImage*)mirrorImage;
- (BOOL)hasAlpha;
- (UIImage *)resizeImageWithCapInsets:(UIEdgeInsets)capInsets;
+ (UIImage *)leftRightFlipImage:(UIImage *)imag;
+ (UIImage *)upDownFlipImage:(UIImage *)imag;
- (void)addRoundedRectToPath:(CGRect)rect context:(CGContextRef)context ovalWidth:(CGFloat)ovalWidth ovalHeight:(CGFloat)ovalHeight;

/** 设置图片大小
 *
 *  通过传入的size更改图片的宽高并返回
 *  @param img 传入的图片
 *  @param size 需要的size
 *  @return 更改后的图片
 */
+ (UIImage *)scaleToSize:(UIImage *)img size:(CGSize)size;
- (UIImage*)fixOrientation;
//设置图片相关属性
+ (UIImage *)createImageWithColor:(UIColor *)color;

+ (UIImage *)thumbnailWithImageWithoutScale:(UIImage *)image size:(CGSize)asize;

+ (UIImage *)blur:(UIImage *)theImage;

//在图片上添加另一张图片
- (UIImage *)addImage:(UIImage *)image orignX:(CGFloat)x orignY:(CGFloat)y;

+ (UIImage *)imageWithColor:(UIColor *)color cornerRadius:(CGFloat)cornerRadius;
- (UIImage *)imageWithMinimumSize:(CGSize)size;
@end
