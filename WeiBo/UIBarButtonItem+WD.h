//
//  UIBarButtonItem+WD.h
//  WeiBo
//
//  Created by chenjiang on 14-12-11.
//  Copyright (c) 2014年 wind. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIBarButtonItem (WD)

- (instancetype)initWithImageName:(NSString *)imageName highLightImageName:(NSString *)highLight addTarget:(id)target action:(SEL)action forContolEvents:(UIControlEvents)controlEvents;

+ (instancetype)barButtonItemWithImageName:(NSString *)imageName highLightImageName:(NSString *)highLight addTarget:(id)target action:(SEL)action;

@end
