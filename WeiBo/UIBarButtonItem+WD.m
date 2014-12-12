//
//  UIBarButtonItem+WD.m
//  WeiBo
//
//  Created by chenjiang on 14-12-11.
//  Copyright (c) 2014年 wind. All rights reserved.
//

#import "UIBarButtonItem+WD.h"

@implementation UIBarButtonItem (WD)

- (instancetype)initWithImageName:(NSString *)imageName highLightImageName:(NSString *)highLight addTarget:(id)target action:(SEL)action forContolEvents:(UIControlEvents)controlEvents
{
  UIButton *button = [[UIButton alloc] init];
  UIImage *image = [UIImage imageNamed:imageName];
  [button setImage:image forState:UIControlStateNormal];
  [button setImage:[UIImage imageNamed:highLight] forState:UIControlStateHighlighted];
  [button addTarget:target action:action forControlEvents:controlEvents];
  CGSize buttonSize = image.size;
  button.frame = (CGRect){
    CGPointZero, buttonSize
  };
  UIBarButtonItem *item = [[UIBarButtonItem alloc] initWithCustomView:button];
  return item;
}

+ (instancetype)barButtonItemWithImageName:(NSString *)imageName highLightImageName:(NSString *)highLight addTarget:(id)target action:(SEL)action
{
  return [[UIBarButtonItem alloc] initWithImageName:imageName highLightImageName:highLight addTarget:target action:action forContolEvents:UIControlEventTouchUpInside];
}

@end
