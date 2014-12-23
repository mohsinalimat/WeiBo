//
//  WDStatusDetailController.m
//  WeiBo
//
//  Created by chenjiang on 14-12-15.
//  Copyright (c) 2014年 wind. All rights reserved.
//

#import "WDStatusDetailController.h"
#import "WDBaseTabBarController.h"
#import "WDBaseController.h"

@interface WDStatusDetailController()<UINavigationControllerDelegate>

@end

@implementation WDStatusDetailController

- (void)viewDidLoad
{
  [super viewDidLoad];
  self.view.backgroundColor = [UIColor redColor];
  self.navigationController.delegate = self;
}

- (void)navigationController:(UINavigationController *)navigationController willShowViewController:(UIViewController *)viewController animated:(BOOL)animated
{
  if ([viewController isKindOfClass:[WDStatusDetailController class]])
  {
    WDBaseTabBarController *tabVC = (WDBaseTabBarController*)self.tabBarController;
    [tabVC sendDockToBack];
  }
  else if([viewController isKindOfClass:[WDBaseController class]])
  {
    WDBaseTabBarController *tabVC = (WDBaseTabBarController*)self.tabBarController;
    [tabVC bringDockToFont];
  }
}

@end
