//
//  WDAddController.m
//  WeiBo
//
//  Created by chenjiang on 14-12-10.
//  Copyright (c) 2014年 wind. All rights reserved.
//

#import "WDAddController.h"

@interface WDAddController()

@property(nonatomic, strong) UIButton *btnBackground;
@property(nonatomic, strong) UIImageView *addImage;

@end

@implementation WDAddController

- (void)viewDidLoad
{
  [super viewDidLoad];
  self.view.backgroundColor = [UIColor greenColor];
  
  _btnBackground = [UIButton buttonWithType:UIButtonTypeCustom];
  [self.view addSubview:_btnBackground];
  _btnBackground.frame = [UIScreen mainScreen].bounds;
  [_btnBackground setBackgroundColor:[UIColor whiteColor]];
  [_btnBackground addTarget:self action:@selector(dispearClick:) forControlEvents:UIControlEventTouchUpInside];
  
  UIImageView *bottomView = [[UIImageView alloc] init];
  bottomView.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"tabbar_background"]];
  [self.view addSubview:bottomView];
  CGSize winSize = [UIScreen mainScreen].bounds.size;
  bottomView.frame = CGRectMake(0, winSize.height - 44, winSize.width, 44);
  
  _addImage = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"tabbar_compose_background_icon_add"]];
  [bottomView addSubview:_addImage];
  _addImage.center = CGPointMake(bottomView.bounds.size.width / 2.0f, bottomView.bounds.size.height / 2.0f);
  
  [UIView beginAnimations:@"addImageOn" context:nil];
  [_addImage setAnimationDuration:1.0f];
  CGAffineTransform transform = CGAffineTransformIdentity;
  _addImage.transform = CGAffineTransformRotate(transform, 45.0f * M_PI / 180.0f);
  [UIView commitAnimations];
}

- (void)dispearClick:(UIButton *)sender
{
  if (_navController)
  {
    [UIView animateWithDuration:0.3f
                     animations:^{
                       CGAffineTransform transform = CGAffineTransformIdentity;
                       _addImage.transform = CGAffineTransformRotate(transform, -45.0f * M_PI / 180.0f);
                     }
                     completion:^(BOOL finished) {
                       [_navController dismissViewControllerAnimated:NO completion:nil];
                     }];
  }
}

- (void)addButton
{
  CGSize screenSize = [UIScreen mainScreen].bounds.size;
  UIButton *btn = [[UIButton alloc] initWithFrame:CGRectMake(0, screenSize.height - 44, screenSize.width, 44)];
  [self.view addSubview:btn];
  btn.backgroundColor = [UIColor redColor];
}

@end
