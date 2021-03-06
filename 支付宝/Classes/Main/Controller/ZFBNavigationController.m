//
//  ZFBNavigationController.m
//  支付宝
//
//  Created by apple on 2017/7/11.
//  Copyright © 2017年 itheima. All rights reserved.
//

#import "ZFBNavigationController.h"
#import "UIColor+Addition.h"

@interface ZFBNavigationController ()

@end

@implementation ZFBNavigationController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    // 1.设置导航条标题文字颜色
    // NSForegroundColorAttributeName 此KEY表示要设置导航条标题文字颜色
    self.navigationBar.titleTextAttributes = @{NSForegroundColorAttributeName :[UIColor whiteColor]};
    
    
    
    
    
    // 2.设置导航条的背景色
    // 下面两行代码结合起来才能把阴影线去掉,但导航也变得彻底透明
    [self.navigationBar setShadowImage:[UIImage new]];
    [self.navigationBar setBackgroundImage:[UIImage new] forBarMetrics:UIBarMetricsDefault];
    
    // 设置导航条及状态栏的背景色
//    [UIColor colorWithPatternImage:[UIImage imageNamed:@"TabBar_Assets_Sel"] 用图片来当颜色
    self.navigationBar.barTintColor = [UIColor colorWithHex:0x2e90d4];
    
    
    // 关闭导航条的半透明效果"半透明关闭后,控制器的view会短了64的高度"
    self.navigationBar.translucent = NO;
    
}

//- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
//    // pointSize 获取字体大小
//    NSLog(@"%.f", ((UILabel *)self.navigationBar.subviews[1].subviews.firstObject).font.pointSize);
//}

// 设置状态栏文字颜色"如果有导航控制器设置状态栏的颜色权限是由导航控制器设置,"
- (UIStatusBarStyle)preferredStatusBarStyle {
    return UIStatusBarStyleLightContent;
}

//- (BOOL)prefersStatusBarHidden {
//    return YES;
//}

// self.topViewController 获取当前导航控制器中的栈顶控制器
// 把状态栏设置权限交给当前的栈顶控制器设置
//- (UIViewController *)childViewControllerForStatusBarStyle {
//    
//    return self.topViewController;
//}


//- (UIViewController *)childViewControllerForStatusBarHidden {
//    
//}
@end
