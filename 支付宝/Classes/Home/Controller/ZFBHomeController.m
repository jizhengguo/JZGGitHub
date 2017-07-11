//
//  ZFBHomeController.m
//  支付宝
//
//  Created by apple on 2017/7/11.
//  Copyright © 2017年 itheima. All rights reserved.
//

#import "ZFBHomeController.h"

@interface ZFBHomeController ()

@end

@implementation ZFBHomeController

- (void)viewDidLoad {
    [super viewDidLoad];
}


// 设置状态栏文字颜色
//- (UIStatusBarStyle)preferredStatusBarStyle {
//    return UIStatusBarStyleLightContent;
//}

// 状态栏的隐藏只能由每一个子控制器自己设置,苹果不建议隐藏状态栏
- (BOOL)prefersStatusBarHidden {
    return YES;
}

@end
