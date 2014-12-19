//
//  WDPopBackgroundView.m
//  WeiBo
//
//  Created by chenjiang on 14-12-17.
//  Copyright (c) 2014年 wind. All rights reserved.
//

#import "WDPopBackgroundView.h"
#import "SGPopSelectView.h"

@interface WDPopBackgroundView()<UIGestureRecognizerDelegate>
{
  SGPopSelectView *_popView;
}
@end

@implementation WDPopBackgroundView

- (instancetype)init
{
  if (self = [super init])
  {
    self.backgroundColor = [UIColor clearColor];
    self.frame = [[UIScreen mainScreen] bounds];
    self.userInteractionEnabled = YES;
    
    UITapGestureRecognizer *ges = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapAction:)];
    ges.delegate = self;
    [self addGestureRecognizer:ges];
    
    _popView = [[SGPopSelectView alloc] init];
    NSArray *selections = @[@"Shake It Off",@"All About that Bass",@"Animals",@"Take Me To Church",@"Out Of The Woods",@"Centuries",@"I'm Not the Only One",@"Burnin' It Down"];
    _popView.selections = selections;
    _popView.translatesAutoresizingMaskIntoConstraints = NO;
    _popView.selectedHandle = ^(NSInteger selectedIndex){
      NSLog(@"selected index %ld, content is %@", (long)selectedIndex, selections[selectedIndex]);
    };
    [self addSubview:_popView];
    [_popView showFromView:self atPoint:CGPointMake(0, self.bounds.size.width / 2.0f) animated:YES];
  }
  return self;
}

- (void)tapAction:(UITapGestureRecognizer *)gesture
{
  [self removeFromSuperview];
}


@end
