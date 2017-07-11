//
//  AppDelegate.m
//  支付宝
//
//  Created by apple on 2017/7/11.
//  Copyright © 2017年 itheima. All rights reserved.
//
/**
 // 创建标签控制器的子控制器
 ZFBHomeController *vc1 = [[ZFBHomeController alloc] init];
 
 // 设置标签栏对应的标签
 vc1.tabBarItem.title = @"生活";
 // 设置标签栏上的图片
 vc1.tabBarItem.image = [UIImage imageNamed:@"TabBar_HomeBar"];
 // 设置标签样上的选中状态图片
 vc1.tabBarItem.selectedImage = [UIImage imageNamed:@"TabBar_HomeBar_Sel"];
 */
#import "AppDelegate.h"
#import "ZFBTabBarController.h"


@interface AppDelegate ()

@end

@implementation AppDelegate

// 应用程序第一次启动完成后就会调用此方法
- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    // 1.创建窗口
    _window = [[UIWindow alloc] init];
    
    // 2.创建标签控制器
    ZFBTabBarController *tabBarVC = [[ZFBTabBarController alloc] init];
    
  /**
    // 3.创建四个子控制器
    UIViewController *vc1 = [self createChildViewController:@"ZFBHomeController" andTabBarItemWithImageName:@"TabBar_HomeBar" andTabBarItemWithTitle:@"生活"];
    
    UIViewController *vc2 = [self createChildViewController:@"ZFBBusinessController" andTabBarItemWithImageName:@"TabBar_Businesses" andTabBarItemWithTitle:@"口碑"];
    
    UIViewController *vc3 = [self createChildViewController:@"ZFBFriendsController" andTabBarItemWithImageName:@"TabBar_Friends" andTabBarItemWithTitle:@"朋友"];
    
    UIViewController *vc4 = [self createChildViewController:@"ZFBMineController" andTabBarItemWithImageName:@"TabBar_Assets" andTabBarItemWithTitle:@"我的"];
    
    // 给标签控制器添加子控制器
    tabBarVC.viewControllers = @[vc1, vc2, vc3, vc4];
    
    // 设置标签栏的渲染颜色
    tabBarVC.tabBar.tintColor = [UIColor colorWithHex:0x2e90d4];
    */
    // 给窗口设置根控制器
    _window.rootViewController = tabBarVC;
    
    // 让窗口成为主窗口并可视
    [_window makeKeyAndVisible];
    
    
    return YES;
}



/**
 创建标签控制器的子控制器,并且设置标签栏上的内容

 @param className 子控制器字符串格式的类名
 @param imageName 图标名称
 @param title 标题
 
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
*/







- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}


@end
