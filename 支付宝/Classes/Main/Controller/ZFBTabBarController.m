//
//  ZFBTabBarController.m
//  支付宝
//
//  Created by apple on 2017/7/11.
//  Copyright © 2017年 itheima. All rights reserved.
//

#import "ZFBTabBarController.h"
#import "UIColor+Addition.h"

@interface ZFBTabBarController ()

@end

@implementation ZFBTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // 3.创建四个子控制器
    UIViewController *vc1 = [self createChildViewController:@"ZFBHomeController" andTabBarItemWithImageName:@"TabBar_HomeBar" andTabBarItemWithTitle:@"生活"];
    
    UIViewController *vc2 = [self createChildViewController:@"ZFBBusinessController" andTabBarItemWithImageName:@"TabBar_Businesses" andTabBarItemWithTitle:@"口碑"];
    
    UIViewController *vc3 = [self createChildViewController:@"ZFBFriendsController" andTabBarItemWithImageName:@"TabBar_Friends" andTabBarItemWithTitle:@"朋友"];
    
    UIViewController *vc4 = [self createChildViewController:@"ZFBMineController" andTabBarItemWithImageName:@"TabBar_Assets" andTabBarItemWithTitle:@"我的"];
    
    // 给标签控制器添加子控制器
    self.viewControllers = @[vc1, vc2, vc3, vc4];
    
    // 设置标签栏的渲染颜色
    self.tabBar.tintColor = [UIColor colorWithHex:0x2e90d4];

    
}

/**
 创建标签控制器的子控制器,并且设置标签栏上的内容
 
 @param className 子控制器字符串格式的类名
 @param imageName 图标名称
 @param title 标题
 */
- (UIViewController *)createChildViewController:(NSString *)className andTabBarItemWithImageName:(NSString *)imageName andTabBarItemWithTitle:(NSString *)title{
    // 把字符串类型的类名转换成class
    Class cla = NSClassFromString(className);
    
    // 创建标签控制器的子控制器
    UIViewController *vc = [[cla alloc] init];
    
    // 设置标签栏对应的标签
    vc.tabBarItem.title = title;
    // 设置标签栏上的图片
    vc.tabBarItem.image = [UIImage imageNamed:imageName];
    
    // 拼接选中状态图片名称
    NSString *selImageName = [imageName stringByAppendingString:@"_Sel"];
    // 设置标签样上的选中状态图片"让选中状态图片不渲染"
    vc.tabBarItem.selectedImage = [[UIImage imageNamed:selImageName] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    
    // 返回控制器
    return vc;
    
}

@end
