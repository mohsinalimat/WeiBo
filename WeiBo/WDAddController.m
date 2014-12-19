//
//  WDAddController.m
//  WeiBo
//
//  Created by chenjiang on 14-12-10.
//  Copyright (c) 2014年 wind. All rights reserved.
//

#import "WDAddController.h"

@implementation WDAddController

- (void)viewDidLoad
{
  [super viewDidLoad];
  self.view.backgroundColor = [UIColor whiteColor];
//  self.navigationController.navigationBar.hidden = YES;
}

- (void)addButton
{
  CGSize screenSize = [UIScreen mainScreen].bounds.size;
  UIButton *btn = [[UIButton alloc] initWithFrame:CGRectMake(0, screenSize.height - 44, screenSize.width, 44)];
  [self.view addSubview:btn];
  btn.backgroundColor = [UIColor redColor];
}

@end
