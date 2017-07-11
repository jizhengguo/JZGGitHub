//
//  AppDelegate.m
//  支付宝
//
//  Created by apple on 2017/7/11.
//  Copyright © 2017年 itheima. All rights reserved.
//

#import "AppDelegate.h"
#import "ZFBHomeController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate

// 应用程序第一次启动完成后就会调用此方法
- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
   
    // 1.创建窗口
    _window = [[UIWindow alloc] init];
    
    // 2.创建标签控制器
    UITabBarController *tabBarVC = [[UITabBarController alloc] init];
    
    // 创建标签控制器的子控制器
    ZFBHomeController *vc1 = [[ZFBHomeController alloc] init];
    
    // 设置标签栏对应的标签
    vc1.tabBarItem.title = @"生活";
    // 设置标签栏上的图片
    vc1.tabBarItem.image = [UIImage imageNamed:@"TabBar_HomeBar"];
    // 设置标签样上的选中状态图片
    vc1.tabBarItem.selectedImage = [UIImage imageNamed:@"TabBar_HomeBar_Sel"];
    
    
    
    // 给标签控制器添加子控制器
    tabBarVC.viewControllers = @[vc1];
    
    
    // 给窗口设置根控制器
    _window.rootViewController = tabBarVC;
    
    // 让窗口成为主窗口并可视
    [_window makeKeyAndVisible];
    
    
    return YES;
}


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
