//
//  JWStatusHUD.h
//  JWStatusHUD
//
//  Created by 黄进文 on 15/10/17.
//  Copyright © 2015年 黄进文. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface JWStatusHUD : NSObject

/** 
 * 显示图片 + 名字信息
 */
+ (void)showImageName:(NSString *)imageName text:(NSString *)text;

/**
 * 显示图片 + 名字信息
 */
+ (void)showImage:(UIImage *)image text:(NSString *)text;

/**
 * 显示成功信息
 */
+ (void)showSuccess:(NSString *)text;

/**
 * 显示失败信息
 */
+ (void)showError:(NSString *)text;

/**
 * 显示正在加载的信息
 */
+ (void)showLoading:(NSString *)text;

/**
 * 显示普通信息
 */
+ (void)showText:(NSString *)text;

/**
 * 隐藏
 */
+ (void)hide;

@end
