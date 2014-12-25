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
#import "WDTumblrMenuView.h"

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

- (void)pushPopMenu
{
    [self showMenu];
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
    
    
    
    [menuView showInController:self];
}

@end
