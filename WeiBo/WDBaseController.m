//
//  WDBaseController.m
//  WeiBo
//
//  Created by chenjiang on 14-12-19.
//  Copyright (c) 2014年 wind. All rights reserved.
//

#import "WDBaseController.h"
#import "WDAddController.h"
#import "WDBaseTabBarController.h"

@implementation WDBaseController

- (void)pushAddController
{
  [self.navigationController pushViewController:[[WDAddController alloc ] init] animated:YES];
}

- (void)viewWillDisappear:(BOOL)animated
{
  [super viewWillDisappear:animated];
  WDBaseTabBarController *baseTabVC = (WDBaseTabBarController *)self.navigationController.tabBarController;
  [baseTabVC hideDock:YES];
}
//
//- (void)viewDidAppear:(BOOL)animated
//{
//  [super viewWillAppear:animated];
//  WDBaseTabBarController *baseTabVC = (WDBaseTabBarController *)self.navigationController.tabBarController;
//  [baseTabVC hideDock:NO];
//}

- (void)viewWillAppear:(BOOL)animated
{
  [super viewWillAppear:animated];
  WDBaseTabBarController *baseTabVC = (WDBaseTabBarController *)self.navigationController.tabBarController;
  [baseTabVC hideDock:NO];
}

@end
