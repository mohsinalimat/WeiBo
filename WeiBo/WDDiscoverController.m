//
//  WDDiscoverController.m
//  WeiBo
//
//  Created by chenjiang on 14-12-10.
//  Copyright (c) 2014年 wind. All rights reserved.
//

#import "WDDiscoverController.h"
#import <pop/POP.h>
#import "WDAnimationController.h"

@interface WDDiscoverController()

@property (nonatomic, strong) UIView *animateView;
@property (nonatomic, strong) UIView *animationView2;
@property (nonatomic, assign) BOOL flag;

@end

@implementation WDDiscoverController

- (void)viewDidLoad
{
    self.flag = YES;
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.title = @"发现";
    
    UIButton *btnAction = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.view addSubview:btnAction];
    [btnAction setTitle:@"点击" forState:UIControlStateNormal];
    btnAction.backgroundColor = [UIColor redColor];
    {
        btnAction.translatesAutoresizingMaskIntoConstraints = NO;
        NSDictionary *views = NSDictionaryOfVariableBindings(btnAction);
        [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:[btnAction(100)]" options:0 metrics:nil views:views]];
        [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:[btnAction(20)]-50-|" options:0 metrics:nil views:views]];
        [self.view addConstraint:[NSLayoutConstraint constraintWithItem:btnAction attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeCenterX multiplier:1.0f constant:0.0f]];
    }
    [btnAction addTarget:self action:@selector(eventClient:) forControlEvents:UIControlEventTouchUpInside];
    
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(100, 200, 100, 100)];
    view.backgroundColor = [UIColor colorWithRed:1 green:0 blue:0 alpha:0.5];
    [self.view addSubview:view];
    self.animateView = view;
    
    self.animationView2 = [[UIView alloc] initWithFrame:CGRectMake(100, 400, 100, 100)];
    view.backgroundColor = [UIColor greenColor];
    [self.view addSubview:_animationView2];
}

- (void)eventClient:(UIButton*)sender
{
//    [self CABaseAnimationDemo];
    WDAnimationController *animationVC = [[WDAnimationController alloc] initWithNibName:NSStringFromClass([WDAnimationController class]) bundle:[NSBundle mainBundle]];
    [self presentViewController:animationVC animated:YES completion:nil];
}

- (void)CABaseAnimationDemo
{
    CABasicAnimation *animation = [CABasicAnimation animation];
    animation.keyPath = @"position.x";
    animation.fromValue = @(100);
    animation.toValue = @(300);
    animation.duration = 1;
//    animation.fillMode = kCAFillModeForwards;
//    animation.removedOnCompletion = NO;
    [self.animateView.layer addAnimation:animation forKey:@"basic"];
    self.animateView.layer.position = CGPointMake(300, 200);
    
    animation.beginTime = CACurrentMediaTime() + 0.5;
    [_animationView2.layer addAnimation:animation forKey:@"basic"];
    _animationView2.layer.position = CGPointMake(300, 400);
}

- (void)decayAnimation
{
    if (_flag)
    {
        POPDecayAnimation *anim = [POPDecayAnimation animationWithPropertyNamed:kPOPLayerPositionX];
        anim.velocity = @(100.);
        [_animateView.layer pop_addAnimation:anim forKey:@"slide"];
    }
    else
    {
        POPDecayAnimation *anim = [POPDecayAnimation animationWithPropertyNamed:kPOPLayerPositionX];
        anim.velocity = @(-100.);
        [_animateView.layer pop_addAnimation:anim forKey:@"slide"];
    }
    self.flag = !_flag;
}

- (void)basicAnimation
{
    POPBasicAnimation *anim = [POPBasicAnimation animationWithPropertyNamed:kPOPViewAlpha];
    anim.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    anim.fromValue = @(0.0);
    anim.toValue = @(1.0);
    [_animateView.layer pop_addAnimation:anim forKey:@"fade"];
}

@end
