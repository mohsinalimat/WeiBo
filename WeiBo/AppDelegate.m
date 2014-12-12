//
//  AppDelegate.m
//  WeiBo
//
//  Created by chenjiang on 14-12-10.
//  Copyright (c) 2014年 wind. All rights reserved.
//

#import "AppDelegate.h"
#import "WDHomeController.h"
#import "WDOAuthController.h"
#import "WDAccountTool.h"
#import "WDMessageController.h"
#import "WDAddController.h"
#import "WDDiscoverController.h"
#import "WDProfileController.h"
#import "MainController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate

- (void)mainWindow
{
    WDHomeController *homeVC = [[WDHomeController alloc] init];
    homeVC.title = @"首页";
    homeVC.tabBarItem.image = [UIImage imageNamed:@"tabbar_home"];
    UINavigationController *homeNav = [[UINavigationController alloc] initWithRootViewController:homeVC];

    WDMessageController *messageVC = [[WDMessageController alloc] init];
    messageVC.title = @"消息";
    messageVC.tabBarItem.image = [UIImage imageNamed:@"tabbar_message_center"];
    UINavigationController *messageNav = [[UINavigationController alloc] initWithRootViewController:messageVC];

    WDAddController *addVC = [[WDAddController alloc] init];
    addVC.tabBarItem.image = [UIImage imageNamed:@"tabbar_compose_button"];
    UINavigationController *addNav = [[UINavigationController alloc] initWithRootViewController:addVC];

    WDDiscoverController *discoverVC = [[WDDiscoverController alloc] init];
    discoverVC.title = @"发现";
    discoverVC.tabBarItem.image = [UIImage imageNamed:@"tabbar_discover"];
    UINavigationController *discoverNav = [[UINavigationController alloc] initWithRootViewController:discoverVC];

    WDProfileController *profileVC = [[WDProfileController alloc] init];
    profileVC.title = @"我";
    profileVC.tabBarItem.image = [UIImage imageNamed:@"tabbar_profile"];
    UINavigationController *profileNav = [[UINavigationController alloc] initWithRootViewController:profileVC];

    UITabBarController *tarBarVC = [[UITabBarController alloc] init];
    [tarBarVC setViewControllers:@[homeNav, messageNav, addNav, discoverNav, profileNav]];

    self.window.rootViewController = tarBarVC;
}

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
  // Override point for customization after application launch.
  self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
  if ([WDAccountTool sharedAccountTool].account)
  {
    self.window.rootViewController = [[MainController alloc] init];
  }
  else
  {
      self.window.rootViewController = [[WDOAuthController alloc] init];
  }
  [self.window makeKeyAndVisible];
  return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
  // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
  // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
  // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
  // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
  // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
  // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
  // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
