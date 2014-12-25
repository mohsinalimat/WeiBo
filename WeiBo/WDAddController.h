//
//  WDAddController.h
//  WeiBo
//
//  Created by chenjiang on 14-12-10.
//  Copyright (c) 2014年 wind. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "WDBaseController.h"

@interface WDComposeButton : UIControl

- (instancetype)initWithTitle:(NSString *)title icon:(UIImage *)icon;

- (CGSize)getIconSize;

@end

@interface WDAddController : WDBaseController

@property(nonatomic, weak) UINavigationController *navController;

@end
