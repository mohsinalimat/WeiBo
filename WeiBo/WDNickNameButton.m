//
//  WDNickNameButton.m
//  WeiBo
//
//  Created by chenjiang on 14-12-16.
//  Copyright (c) 2014年 wind. All rights reserved.
//

#import "WDNickNameButton.h"

#define kNickNameButtonWidth 140
#define kNickNameButtonHeight 30

@interface WDNickNameButton()
{
  
}

@end

@implementation WDNickNameButton

- (instancetype)initWithNickName:(NSString *)nickName
{
  if (self = [super init])
  {
    [self setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
    [self setTitle:nickName forState:UIControlStateNormal];
    self.bounds = CGRectMake(0, 0, kNickNameButtonWidth, kNickNameButtonHeight);
    [self setBackgroundImage:[UIImage imageNamed:@"navigationbar_title_highlighted"] forState:UIControlStateHighlighted];
  }
  return self;
}

@end
