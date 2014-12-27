//
//  WDMessageController.m
//  WeiBo
//
//  Created by chenjiang on 14-12-10.
//  Copyright (c) 2014年 wind. All rights reserved.
//

#import "WDMessageController.h"
#import "WDNickNameButton.h"

@implementation WDMessageController

- (void)viewDidLoad
{
  [super viewDidLoad];
  self.view.backgroundColor = [UIColor whiteColor];
  
  self.title = @"消息";
//  self.view.translatesAutoresizingMaskIntoConstraints = NO;
//  
//  WDNickNameButton *nickName = [[WDNickNameButton alloc] initWithNickName:@"chenjiang,nihao"];
//  nickName.translatesAutoresizingMaskIntoConstraints = NO;
//  [self.view addSubview:nickName];
//  [self.view addConstraint:[NSLayoutConstraint constraintWithItem:nickName attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeCenterX multiplier:1.0f constant:0]];
//  [self.view addConstraint:[NSLayoutConstraint constraintWithItem:nickName attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeCenterY multiplier:1.0f constant:0]];
}

@end
