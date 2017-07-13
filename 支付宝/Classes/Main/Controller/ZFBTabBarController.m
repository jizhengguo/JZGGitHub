//
//  ZFBTabBarController.m
//  支付宝
//
//  Created by apple on 2017/7/11.
//  Copyright © 2017年 itheima. All rights reserved.
//

#import "ZFBTabBarController.h"
#import "UIColor+Addition.h"
#import "ZFBNavigationController.h"

@interface ZFBTabBarController ()

@end

@implementation ZFBTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // 3.创建四个子控制器
    UIViewController *vc1 = [self createChildViewController:@"ZFBHomeController" andTabBarItemWithImageName:@"TabBar_HomeBar" andTabBarItemWithTitle:@"生活"];
    
//    UIViewController *vc2 = [self createChildViewController:@"ZFBBusinessController" andTabBarItemWithImageName:@"TabBar_Businesses" andTabBarItemWithTitle:@"口碑"];
    
    // 口碑控制器用加载SB的方式去创建
    UIViewController *vc2 = [self createChildViewControllerWithStoryboardName:@"Business" andTabBarItemWithImageName:@"TabBar_Businesses" andTabBarItemWithTitle:@"口碑"];
    
    UIViewController *vc3 = [self createChildViewController:@"ZFBFriendsController" andTabBarItemWithImageName:@"TabBar_Friends" andTabBarItemWithTitle:@"朋友"];
    
    UIViewController *vc4 = [self createChildViewController:@"ZFBMineController" andTabBarItemWithImageName:@"TabBar_Assets" andTabBarItemWithTitle:@"我的"];
    
    // 给标签控制器添加子控制器
    self.viewControllers = @[vc1, vc2, vc3, vc4];
    
    // 设置标签栏的渲染颜色
    self.tabBar.tintColor = [UIColor colorWithHex:0x2e90d4];

    // 关闭标签栏的半透明效果
    self.tabBar.translucent = NO;
    
}

/**
 创建标签控制器的子控制器,并且设置标签栏上的内容,把控制器再包装一个导航控制器,最终返回导航控制器
 
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
//    vc.tabBarItem.title = title;
    // 设置标签栏上的图片
    vc.tabBarItem.image = [UIImage imageNamed:imageName];
    
    // 拼接选中状态图片名称
    NSString *selImageName = [imageName stringByAppendingString:@"_Sel"];
    // 设置标签样上的选中状态图片"让选中状态图片不渲染"
    vc.tabBarItem.selectedImage = [[UIImage imageNamed:selImageName] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    
    
    // 给子控制器包装一个导航控制器
    ZFBNavigationController *nav = [[ZFBNavigationController alloc] initWithRootViewController:vc];
    
    // 设置栈顶控制器对应导航条上的内容
//    vc.navigationItem.title = title;
    
    
    // 当标签栏上的标题和导航条上的标题一样时,可以用控制器的title属性
    vc.title = title;
    
    vc.view.backgroundColor = [UIColor whiteColor];
    // 返回控制器
    return nav;
    
}


/**
 创建标签控制器的子控制器,并且设置标签栏上的内容,把控制器再包装一个导航控制器,最终返回导航控制器
 
 @param sbName sb文件名称
 @param imageName 图标名称
 @param title 标题
 */
- (UIViewController *)createChildViewControllerWithStoryboardName:(NSString *)sbName andTabBarItemWithImageName:(NSString *)imageName andTabBarItemWithTitle:(NSString *)title{
//    // 把字符串类型的类名转换成class
//    Class cla = NSClassFromString(className);
//    
//    // 创建标签控制器的子控制器
//    UIViewController *vc = [[cla alloc] init];
    
    // 加载指定名称的sb文件
    UIStoryboard *sb = [UIStoryboard storyboardWithName:sbName bundle:nil];
    // 实例化sb中箭头指向的控制器
    UIViewController *vc = [sb instantiateInitialViewController];
    
    
    // 设置标签栏对应的标签
    //    vc.tabBarItem.title = title;
    // 设置标签栏上的图片
    vc.tabBarItem.image = [UIImage imageNamed:imageName];
    
    // 拼接选中状态图片名称
    NSString *selImageName = [imageName stringByAppendingString:@"_Sel"];
    // 设置标签样上的选中状态图片"让选中状态图片不渲染"
    vc.tabBarItem.selectedImage = [[UIImage imageNamed:selImageName] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    
    
    // 给子控制器包装一个导航控制器
    ZFBNavigationController *nav = [[ZFBNavigationController alloc] initWithRootViewController:vc];
    
    // 设置栈顶控制器对应导航条上的内容
    //    vc.navigationItem.title = title;
    
    
    // 当标签栏上的标题和导航条上的标题一样时,可以用控制器的title属性
    vc.title = title;
    
    vc.view.backgroundColor = [UIColor whiteColor];
    // 返回控制器
    return nav;
    
}


@end
