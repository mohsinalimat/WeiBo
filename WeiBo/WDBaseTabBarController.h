//
//  WDBaseTabBarController.h
//  WeiBo
//
//  Created by chenjiang on 14-12-19.
//  Copyright (c) 2014年 wind. All rights reserved.
//

#import <UIKit/UIKit.h>

@class WDDock;

@interface WDBaseTabBarController : UITabBarController

@property(nonatomic, strong) WDDock *dock;
@property(nonatomic, weak) UINavigationController *selectedNavController;

- (void)hideDock:(BOOL)hide;
- (void)sendDockToBack;
- (void)bringDockToFont;
- (void)sendDockBelowView:(UIView*)view;

@end
