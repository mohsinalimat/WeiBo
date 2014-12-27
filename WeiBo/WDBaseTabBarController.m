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
#import "WDAddController.h"
#import "WDTumblrMenuView.h"

@interface WDBaseTabBarController()<WDDockDelegate>

@end

@implementation WDBaseTabBarController

- (void)viewDidLoad
{
  [super viewDidLoad];
  
  self.tabBar.hidden = YES;
  _dock = [[WDDock alloc] initWithFrame:self.tabBar.frame];
  self.view.backgroundColor = [UIColor greenColor];
  [self.view addSubview:_dock];
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

- (void)sendDockToBack
{
  [self.view sendSubviewToBack:_dock];
}

- (void)bringDockToFont
{
  [self.view bringSubviewToFront:_dock];
}

- (void)sendDockBelowView:(UIView *)view
{
  [_dock removeFromSuperview];
  [self.view insertSubview:_dock belowSubview:view];
}

- (void)showMenu
{
    WDTumblrMenuView *menuView = [[WDTumblrMenuView alloc] init];
    [menuView addMenuItemWithTitle:@"文字" andIcon:[UIImage imageNamed:@"tabbar_compose_idea"] andSelectedBlock:^{
        NSLog(@"Text selected");
    }];
    [menuView addMenuItemWithTitle:@"相册" andIcon:[UIImage imageNamed:@"tabbar_compose_photo"] andSelectedBlock:^{
        NSLog(@"Photo selected");
    }];
    [menuView addMenuItemWithTitle:@"拍摄" andIcon:[UIImage imageNamed:@"tabbar_compose_camera"] andSelectedBlock:^{
        NSLog(@"Quote selected");
        
    }];
    [menuView addMenuItemWithTitle:@"签到" andIcon:[UIImage imageNamed:@"tabbar_compose_lbs"] andSelectedBlock:^{
        NSLog(@"Link selected");
        
    }];
    [menuView addMenuItemWithTitle:@"点评" andIcon:[UIImage imageNamed:@"tabbar_compose_review"] andSelectedBlock:^{
        NSLog(@"Chat selected");
        
    }];
    [menuView addMenuItemWithTitle:@"更多" andIcon:[UIImage imageNamed:@"tabbar_compose_more"] andSelectedBlock:^{
        NSLog(@"Video selected");
        
    }];
    
    [menuView show];
}

- (void)dock:(WDDock *)dock itemSelectFrom:(NSInteger)sourceIndex to:(NSInteger)toIndex
{
  int tmpToIndex = toIndex;
  if (toIndex > 2)
  {
    --tmpToIndex;
  }
  if (toIndex < 0 || tmpToIndex >= self.childViewControllers.count)
  {
    return;
  }
  
  if(toIndex == 2)
  {
    [self showMenu];
    return;
  }
  
  if(sourceIndex > 2)
  {
    sourceIndex -= 1;
  }
  if (toIndex > 2)
  {
    toIndex -= 1;
  }
  UIViewController *oldViewController = self.childViewControllers[sourceIndex];
  [oldViewController.view removeFromSuperview];
  UIViewController *newViewController = self.childViewControllers[toIndex];
  CGFloat width = self.view.frame.size.width;
  CGFloat height = self.view.frame.size.height - dock.frame.size.height;
  newViewController.view.frame = CGRectMake(0, 0, width, height);
  [self.view insertSubview:newViewController.view belowSubview:_dock];
  self.selectedNavController = (UINavigationController*)newViewController;
}

@end
