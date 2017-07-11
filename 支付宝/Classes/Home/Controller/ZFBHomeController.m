//
//  ZFBHomeController.m
//  支付宝
//
//  Created by apple on 2017/7/11.
//  Copyright © 2017年 itheima. All rights reserved.
//

/** 代理的三步:
 1.遵守协议
 2.设置代理 "在那里创建的委托者就在那里去设置代理"
 3.实现相应协议
 
 
 */
#import "ZFBHomeController.h"
#import "ZFBHomeTopView.h"
#import "UIColor+Addition.h"
#import "Masonry.h"

@interface ZFBHomeController ()<ZFBHomeTopViewDelegate>

@end

@implementation ZFBHomeController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    
    // 1.顶部视图
    ZFBHomeTopView *topView = [[ZFBHomeTopView alloc] init];
    
    // 设置代理
    topView.delegate = self;
    
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



#pragma mark - homeTopView代理 方法
- (void)homeTopView:(ZFBHomeTopView *)homeTopView andBtnClickType:(ZFBHomeTopViewBtnType)type {
    
    switch (type) {
        case ZFBHomeTopViewBtnTypeScan: {
            
            UIViewController *vc = [[UIViewController alloc] init];
            vc.view.backgroundColor = [UIColor whiteColor];
            [self.navigationController pushViewController:vc animated:YES];
            
            break;
        }
        default:
            break;
    }
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
