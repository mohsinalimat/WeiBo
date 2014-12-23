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

@interface WDBaseController()<UINavigationControllerDelegate>

@end

@implementation WDBaseController

- (instancetype)init
{
  if (self = [super init])
  {
    self.navigationController.delegate = self;
  }
  return self;
}

- (void)pushAddController
{
  [self.navigationController pushViewController:[[WDAddController alloc ] init] animated:YES];
}

@end
