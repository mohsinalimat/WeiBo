//
//  WDDockController.m
//  WeiBo
//
//  Created by chenjiang on 14-12-10.
//  Copyright (c) 2014年 wind. All rights reserved.
//

#import "WDDockController.h"
#import "WDMacro.h"

@interface WDDockController ()<WDDockDelegate>

@end

@implementation WDDockController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self addDock];
}

- (void)addDock
{
    _dock = [[WDDock alloc] init];
    _dock.frame = CGRectMake(0, self.view.frame.size.height - kDockHeight, self.view.frame.size.width, kDockHeight);
    [self.view addSubview:_dock];
    _dock.delegate = self;
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
    [self.view addSubview:newViewController.view];
    _controller = newViewController;
}

- (void)clickWithDockButtonIndex:(NSUInteger)index
{
    
}

@end
