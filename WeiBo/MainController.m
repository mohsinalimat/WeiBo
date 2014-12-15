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
    WDHomeController *homeControl = [[WDHomeController alloc] init];
    WDNavigationController *homeNav = [[WDNavigationController alloc] initWithRootViewController:homeControl];
    homeNav.delegate = self;
    [self addChildViewController:homeNav];
    
    WDMessageController *messageControl = [[WDMessageController alloc] init];
    WDNavigationController *messageNav = [[WDNavigationController alloc] initWithRootViewController:messageControl];
    messageNav.delegate = self;
    [self addChildViewController:messageNav];
    
    WDAddController *addControl = [[WDAddController alloc] init];
    WDNavigationController *addNav = [[WDNavigationController alloc] initWithRootViewController:addControl];
    addNav.delegate = self;
    [self addChildViewController:addNav];
    
    WDDiscoverController *discoverControl = [[WDDiscoverController alloc] init];
    WDNavigationController *discoverNav = [[WDNavigationController alloc] initWithRootViewController:discoverControl];
    discoverNav.delegate = self;
    [self addChildViewController:discoverNav];
    
    WDProfileController *profileControl = [[WDProfileController alloc] init];
    WDNavigationController *profileNav = [[WDNavigationController alloc] initWithRootViewController:profileControl];
    profileNav.delegate = self;
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
  }
}

@end
