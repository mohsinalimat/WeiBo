//
//  WDPopViewController.m
//  WeiBo
//
//  Created by chenjiang on 14-12-17.
//  Copyright (c) 2014年 wind. All rights reserved.
//

#import "WDPopViewController.h"
#import "SGPopSelectView.h"

@interface WDPopViewController()<UIGestureRecognizerDelegate>
{
  SGPopSelectView *_popView;
}
@end

@implementation WDPopViewController

- (instancetype)init
{
  if (self = [super init])
  {
    self.view.backgroundColor = [UIColor clearColor];
    
    UITapGestureRecognizer *tapGestureRecoginazer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapAction:)];
    tapGestureRecoginazer.delegate = self;
    [self.view addGestureRecognizer:tapGestureRecoginazer];
    
    _popView = [[SGPopSelectView alloc] init];
    NSArray *selections = @[@"Shake It Off",@"All About that Bass",@"Animals",@"Take Me To Church",@"Out Of The Woods",@"Centuries",@"I'm Not the Only One",@"Burnin' It Down"];
    _popView.selections = selections;
    _popView.translatesAutoresizingMaskIntoConstraints = NO;
    _popView.selectedHandle = ^(NSInteger selectedIndex){
      NSLog(@"selected index %ld, content is %@", (long)selectedIndex, selections[selectedIndex]);
    };
    CGPoint p = CGPointMake(self.view.frame.size.width / 2.0f, self.view.frame.size.height / 2.0f);
    [_popView showFromView:self.view atPoint:p animated:YES];
  }
  
  return self;
}

- (void)tapAction:(UITapGestureRecognizer *)tap
{
  [self removeFromParentViewController];
}

- (BOOL)gestureRecognizerShouldBegin:(UIGestureRecognizer *)gestureRecognizer
{
  CGPoint p = [gestureRecognizer locationInView:self.view];
  if (_popView.visible && CGRectContainsPoint(_popView.frame, p))
  {
    return NO;
  }
  return YES;
}

- (void)viewDidLoad
{
  [super viewDidLoad];
  
}

@end
