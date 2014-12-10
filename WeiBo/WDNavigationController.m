//
//  WDNavigationController.m
//  WeiBo
//
//  Created by chenjiang on 14-12-10.
//  Copyright (c) 2014年 wind. All rights reserved.
//

#import "WDNavigationController.h"

@interface WDNavigationController ()

@end

@implementation WDNavigationController

- (void)viewDidLoad
{
    [super viewDidLoad];
    if ([[[UIDevice currentDevice] systemVersion] floatValue] < 7.0)
    {
        // 1、修改导航条样式
        UINavigationBar *bar = [UINavigationBar appearance];
        // 修改导航条背景
        [bar setBackgroundImage:[UIImage imageNamed:@"navigationbar_background.png"] forBarMetrics:UIBarMetricsDefault];
        // 修改导航条文字样式
        [bar setTitleTextAttributes:@{
                                      UITextAttributeTextColor : [UIColor grayColor],
                                      UITextAttributeTextShadowOffset : [NSValue valueWithUIOffset:UIOffsetZero]
                                      }];
        
        // 2、修改导航条按钮样式
        UIBarButtonItem *item = [UIBarButtonItem appearance];
        // 修改导航条按钮背景
        [item setBackgroundImage:[UIImage imageNamed:@"navigationbar_button_background.png"] forState:UIControlStateNormal barMetrics:UIBarMetricsDefault];
        [item setBackgroundImage:[UIImage imageNamed:@"navigationbar_button_background_pushed.png"] forState:UIControlStateHighlighted barMetrics:UIBarMetricsDefault];
        // 修改导航条按钮文字样式
        [item setTitleTextAttributes:@{
                                       UITextAttributeTextColor : [UIColor grayColor],
                                       UITextAttributeTextShadowOffset : [NSValue valueWithUIOffset:UIOffsetZero]
                                       } forState:UIControlStateNormal];
        [item setTitleTextAttributes:@{
                                       UITextAttributeTextColor : [UIColor grayColor],
                                       UITextAttributeTextShadowOffset : [NSValue valueWithUIOffset:UIOffsetZero]
                                       } forState:UIControlStateHighlighted];
        
        // 3、修改状态栏样式
        [UIApplication sharedApplication].statusBarStyle = UIStatusBarStyleBlackOpaque;
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
