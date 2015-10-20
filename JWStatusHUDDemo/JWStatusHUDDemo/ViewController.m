//
//  ViewController.m
//  JWStatusHUD
//
//  Created by 黄进文 on 15/10/17.
//  Copyright © 2015年 黄进文. All rights reserved.
//

#import "ViewController.h"
#import "JWStatusHUD.h"

@interface ViewController ()

@end

@implementation ViewController

- (IBAction)success {
    [JWStatusHUD showSuccess:@"加载数据成功!"];
}

- (IBAction)fail {
    [JWStatusHUD showError:@"加载数据失败!"];
}

- (IBAction)loading {
    [JWStatusHUD showLoading:@"数据加载中..."];
    
//    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(3.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
//        
//        [JWStatusHUD hide];
//    });
}

- (IBAction)hide {
    [JWStatusHUD hide];
}

- (IBAction)normal {
    [JWStatusHUD showText:@"普通信息"];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
}

@end
