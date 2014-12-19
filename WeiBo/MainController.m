//
//  MainController.m
//  WeiBo
//
//  Created by chenjiang on 14-12-10.
//  Copyright (c) 2014年 wind. All rights reserved.
//

#import "MainController.h"
#import "WDHomeController.h"
#import "WDMessageController.h"
#import "WDAddController.h"
#import "WDDiscoverController.h"
#import "WDProfileController.h"
#import "WDNavigationController.h"

@interface MainController ()<UINavigationControllerDelegate>

@end

@implementation MainController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self addSubView];
    [self addDockItem];
    [self clickWithDockButtonIndex:0];
}

- (void)addSubView
{
    WDHomeController *homeControl   = [[WDHomeController alloc] init];
    WDNavigationController *homeNav = [[WDNavigationController alloc] initWithRootViewController:homeControl];
    homeNav.delegate                = self;
    [self addChildViewController:homeNav];
    
    WDMessageController *messageControl = [[WDMessageController alloc] init];
    WDNavigationController *messageNav  = [[WDNavigationController alloc] initWithRootViewController:messageControl];
    messageNav.delegate                 = self;
    [self addChildViewController:messageNav];
  
    WDDiscoverController *discoverControl = [[WDDiscoverController alloc] init];
    WDNavigationController *discoverNav   = [[WDNavigationController alloc] initWithRootViewController:discoverControl];
    discoverNav.delegate                  = self;
    [self addChildViewController:discoverNav];
    
    WDProfileController *profileControl = [[WDProfileController alloc] init];
    WDNavigationController *profileNav  = [[WDNavigationController alloc] initWithRootViewController:profileControl];
    profileNav.delegate                 = self;
    [self addChildViewController:profileNav];
}

- (void)addDockItem
{
    [self.dock addItemWithIcon:@"tabbar_home.png" selectedIcon:@"tabbar_home_selected.png" title:@"首页"];
    [self.dock addItemWithIcon:@"tabbar_message_center.png" selectedIcon:@"tabbar_message_center_selected.png" title:@"消息"];
    [self.dock addItemWithIcon:@"tabbar_compose_button.png" selectedIcon:@"tabbar_compose_button_highlighted.png" title:nil];
    [self.dock addItemWithIcon:@"tabbar_discover.png" selectedIcon:@"tabbar_discover_selected.png" title:@"发现"];
    [self.dock addItemWithIcon:@"tabbar_profile.png" selectedIcon:@"tabbar_profile_selected.png" title:@"我"];
}

- (void)clickWithDockButtonIndex:(NSUInteger)index
{
  if (index == 0)
  {
    WDHomeController *homeController = [[[self.childViewControllers firstObject] childViewControllers] firstObject];
    [homeController refresh];
  }
}

- (void)navigationController:(UINavigationController *)navigationController willShowViewController:(UIViewController *)viewController animated:(BOOL)animated
{
  UIViewController *rootViewController = [navigationController.viewControllers firstObject];
  if (viewController != rootViewController)
  {
    CGRect naConViewFrame = navigationController.view.frame;
    CGFloat naConY = navigationController.navigationBar.frame.origin.y;
    CGFloat appHeight = [UIScreen mainScreen].applicationFrame.size.height;
    naConViewFrame.size.height = appHeight + naConY;
    navigationController.view.frame = naConViewFrame;
    
    CGRect dockFrame = self.dock.frame;
    CGFloat navBarHeight = navigationController.navigationBar.frame.size.height;
    
    dockFrame.origin.y = appHeight - navBarHeight - dockFrame.size.height;
    // 3.2 TableView滚动后，View的y值发生变量，因此Dock的Y值也需要一起调整
    if ([rootViewController.view isKindOfClass:[UIScrollView class]]) {
      
      // 3.2.1 计算滚动的长度，y值自加该长度
      UIScrollView *scrollView = (UIScrollView *)rootViewController.view;
      CGFloat contentY = scrollView.contentOffset.y;
      
      // 3.2.2 ios下透明导航条特性，使得contentOffset自动往下移了64个像素(导航条高度+系统状态栏高度)
      if ([[[UIDevice currentDevice] systemVersion] floatValue] >= 7.0) contentY +=64;
      dockFrame.origin.y += contentY;
    }
    
    // 4、调整Dock的位置
    [self.dock removeFromSuperview];
    self.dock.frame = dockFrame;
    [rootViewController.view addSubview:self.dock];
  }
}

- (void)navigationController:(UINavigationController *)navigationController didShowViewController:(UIViewController *)viewController animated:(BOOL)animated
{
  UIViewController *rootViewController = [navigationController.viewControllers firstObject];
  if (viewController == rootViewController)
  {
    [self.dock removeFromSuperview];
    [self.view addSubview:self.dock];
    CGRect dockFrame = self.dock.frame;
    dockFrame.origin.y = self.view.frame.size.height - dockFrame.size.height;
    self.dock.frame = dockFrame;
    
    CGRect naConViewFrame = navigationController.view.frame;
    CGFloat naConY = navigationController.navigationBar.frame.origin.y;
    CGFloat appHeight = [UIScreen mainScreen].applicationFrame.size.height;
    naConViewFrame.size.height = appHeight + naConY - dockFrame.size.height;
    navigationController.view.frame = naConViewFrame;
  }
}

@end
