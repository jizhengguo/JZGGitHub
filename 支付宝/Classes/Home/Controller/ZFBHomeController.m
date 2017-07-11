//
//  ZFBHomeController.m
//  支付宝
//
//  Created by apple on 2017/7/11.
//  Copyright © 2017年 itheima. All rights reserved.
//

#import "ZFBHomeController.h"
#import "ZFBHomeTopView.h"
#import "UIColor+Addition.h"
#import "Masonry.h"

@interface ZFBHomeController ()

@end

@implementation ZFBHomeController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    
    // 1.顶部视图
    ZFBHomeTopView *topView = [[ZFBHomeTopView alloc] init];
    // 设置背景颜色
    topView.backgroundColor = [UIColor colorWithHex:0x2e90d4];
    
    [self.view addSubview:topView];
    
    [topView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.top.right.offset(0);
        make.height.equalTo(topView.mas_width).multipliedBy(115 / 375.0);
    }];
    
    
    
    // 2.功能列表界面
    UIView *founctionListView = [[UIView alloc] init];
    founctionListView.backgroundColor = [UIColor purpleColor];
    [self.view addSubview:founctionListView];
    
    [founctionListView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.bottom.offset(0);
        make.top.equalTo(topView.mas_bottom).offset(0);
    }];
}







// 设置状态栏文字颜色
//- (UIStatusBarStyle)preferredStatusBarStyle {
//    return UIStatusBarStyleLightContent;
//}

// 状态栏的隐藏只能由每一个子控制器自己设置,苹果不建议隐藏状态栏
//- (BOOL)prefersStatusBarHidden {
//    return YES;
//}

@end
