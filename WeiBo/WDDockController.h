//
//  WDDockController.h
//  WeiBo
//
//  Created by chenjiang on 14-12-10.
//  Copyright (c) 2014年 wind. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "WDDock.h"

@interface WDDockController : UIViewController

@property (nonatomic, strong)WDDock *dock;
@property (nonatomic, strong)UIViewController *controller;

- (void)clickWithDockButtonIndex:(NSUInteger)index;

@end
