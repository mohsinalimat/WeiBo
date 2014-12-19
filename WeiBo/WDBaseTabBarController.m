//
//  WDBaseTabBarController.m
//  WeiBo
//
//  Created by chenjiang on 14-12-19.
//  Copyright (c) 2014年 wind. All rights reserved.
//

#import "WDBaseTabBarController.h"
#import "WDDock.h"
#import "WDMacro.h"

@interface WDBaseTabBarController()<WDDockDelegate>

@end

@implementation WDBaseTabBarController

- (void)viewDidLoad
{
  [super viewDidLoad];
  
  self.tabBar.hidden = YES;
  _dock = [[WDDock alloc] initWithFrame:self.tabBar.frame];
//  _dock = [[WDDock alloc] initWithFrame:self.tabBar.bounds];
  self.view.backgroundColor = [UIColor greenColor];
  [self.view addSubview:_dock];
//  [self.tabBar addSubview:_dock];
  _dock.delegate = self;

  [_dock addItemWithIcon:@"tabbar_home.png" selectedIcon:@"tabbar_home_selected.png" title:@"首页"];
  [_dock addItemWithIcon:@"tabbar_message_center.png" selectedIcon:@"tabbar_message_center_selected.png" title:@"消息"];
  [_dock addItemWithIcon:@"tabbar_compose_button.png" selectedIcon:@"tabbar_compose_button_highlighted.png" title:nil];
  [_dock addItemWithIcon:@"tabbar_discover.png" selectedIcon:@"tabbar_discover_selected.png" title:@"发现"];
  [_dock addItemWithIcon:@"tabbar_profile.png" selectedIcon:@"tabbar_profile_selected.png" title:@"我"];
}

- (void)hideDock:(BOOL)hide
{
  _dock.hidden = hide;
}

- (void)dock:(WDDock *)dock itemSelectFrom:(NSInteger)sourceIndex to:(NSInteger)toIndex
{
  if (toIndex < 0 || toIndex >= self.childViewControllers.count)
  {
    return;
  }
  
  UIViewController *oldViewController = self.childViewControllers[sourceIndex];
  [oldViewController.view removeFromSuperview];
  UIViewController *newViewController = self.childViewControllers[toIndex];
  CGFloat width = self.view.frame.size.width;
  CGFloat height = self.view.frame.size.height - dock.frame.size.height;
  newViewController.view.frame = CGRectMake(0, 0, width, height);
//  [self.view addSubview:newViewController.view];
  [self.view insertSubview:newViewController.view aboveSubview:_dock];
}

@end
