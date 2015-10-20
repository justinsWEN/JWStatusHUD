//
//  JWStatusHUD.m
//  JWStatusHUD
//
//  Created by 黄进文 on 15/10/17.
//  Copyright © 2015年 黄进文. All rights reserved.
//

#import "JWStatusHUD.h"

@implementation JWStatusHUD

// 设置windows全局变量
static UIWindow *window_;
// window高度
static CGFloat const JWWindowH = 20;
// 定时器
static NSTimer *timer_;
// 动画时间
static CGFloat const JWAnimationDuration = 0.25;
// 停留时间
static CGFloat const JWStayDuration = 2.0;
// 间隙
static CGFloat const JWMargin = 5;
// 字体大小
static CGFloat const JWTitleFont = 13;

+ (void)showImage:(UIImage *)image text:(NSString *)text {
    
    // 程序开始前停掉上一个定时器
    [timer_ invalidate];
    
    // 创建窗口
    window_.hidden = YES;  // 先隐藏上一次的window,避免上次残留的东西
    window_ = [[UIWindow alloc] init];
    window_.windowLevel = UIWindowLevelAlert;
    window_.backgroundColor = [UIColor darkGrayColor];
    window_.frame = CGRectMake(0, - JWWindowH, [UIScreen mainScreen].bounds.size.width, JWWindowH);
    window_.hidden = NO;
    
    // 添加按钮
    UIButton *btn = [[UIButton alloc] init];
    btn.frame = window_.bounds;
    // 文字
    [btn setTitle:text forState:UIControlStateNormal];
    [btn setTitleColor:[UIColor orangeColor] forState:UIControlStateNormal];
    btn.titleLabel.font = [UIFont systemFontOfSize:JWTitleFont];
    // 图片
    if (image) {
        
        [btn setImage:image forState:UIControlStateNormal];
        // 设置内边距
        btn.imageEdgeInsets = UIEdgeInsetsMake(0, 0, 0, JWMargin);
        btn.titleEdgeInsets = UIEdgeInsetsMake(0, JWMargin, 0, 0);
    }
    
    [window_ addSubview:btn];
    
    // 设置动画
    [UIView animateWithDuration:JWAnimationDuration animations:^{
        // window_.frame = CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, JWWindowH);
        CGRect frame = window_.frame;
        frame.origin.y = 0;
        window_.frame = frame;
    }];
    // 开启一个定时器
    timer_ = [NSTimer scheduledTimerWithTimeInterval:JWStayDuration target:self selector:@selector(hide) userInfo:nil repeats:NO];
}

+ (void)showImageName:(NSString *)imageName text:(NSString *)text {
    
    [self showImage:[UIImage imageNamed:imageName] text:text];
}

+(void)showSuccess:(NSString *)text {
    
    [self showImageName:@"JWStatusHUD.bundle/success" text:text];
}

+ (void)showError:(NSString *)text {
    
    [self showImageName:@"JWStatusHUD.bundle/error" text:text];
}

+ (void)showLoading:(NSString *)text {
    
    // 程序开始前停掉上一个定时器
    [timer_ invalidate];
    timer_ = nil;
    
    // 创建窗口
    window_.hidden = YES;  // 先隐藏上一次的window,避免上次残留的东西
    window_ = [[UIWindow alloc] init];
    window_.windowLevel = UIWindowLevelAlert;
    window_.backgroundColor = [UIColor darkGrayColor];
    window_.frame = CGRectMake(0, - JWWindowH, [UIScreen mainScreen].bounds.size.width, JWWindowH);
    window_.hidden = NO;
    
    // 添加按钮
    UIButton *btn = [[UIButton alloc] init];
    btn.frame = window_.bounds;
    // 文字
    [btn setTitle:text forState:UIControlStateNormal];
    [btn setTitleColor:[UIColor orangeColor] forState:UIControlStateNormal];
    btn.titleLabel.font = [UIFont systemFontOfSize:JWTitleFont];
    [window_ addSubview:btn];
    
    // 添加加载圈圈
    UIActivityIndicatorView *loadingView = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhite];
    loadingView.center = CGPointMake(btn.titleLabel.frame.origin.x - 60, JWWindowH * 0.5);
    [loadingView startAnimating];
    [window_ addSubview:loadingView];
    
    // 设置动画
    [UIView animateWithDuration:JWAnimationDuration animations:^{
        // window_.frame = CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, JWWindowH);
        CGRect frame = window_.frame;
        frame.origin.y = 0;
        window_.frame = frame;
    }];
}

+ (void)showText:(NSString *)text {
    
    [self showImage:nil text:text];
}

+ (void)hide {
    
    // 程序开始前停掉上一个定时器
    [timer_ invalidate];
    timer_ = nil;
    
    // 退出动画
    [UIView animateWithDuration:JWAnimationDuration animations:^{
        
        CGRect frame = window_.frame;
        frame.origin.y = - JWWindowH;
        window_.frame = frame;
    } completion:^(BOOL finished) {
        window_ = nil;
    }];
}

@end
