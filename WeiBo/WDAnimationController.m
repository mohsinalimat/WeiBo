//
//  WDAnimationController.m
//  WeiBo
//
//  Created by chenjiang on 15/5/28.
//  Copyright (c) 2015年 wind. All rights reserved.
//

#import "WDAnimationController.h"

@interface WDAnimationController ()

@property (nonatomic, strong) UIView *animationView1;
@property (nonatomic, strong) UIView *animationView2;
@property (nonatomic, strong) UIButton *buttonAnimation;

@end

@implementation WDAnimationController

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    self.buttonAnimation = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.view addSubview:_buttonAnimation];
    _buttonAnimation.backgroundColor = [UIColor grayColor];
    _buttonAnimation.layer.cornerRadius = 3;
    _buttonAnimation.layer.masksToBounds = YES;
    [_buttonAnimation setTitle:@"动画" forState:UIControlStateNormal];
    {
        _buttonAnimation.translatesAutoresizingMaskIntoConstraints = NO;
        NSDictionary *views = NSDictionaryOfVariableBindings(_buttonAnimation);
        [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:[_buttonAnimation(50)]" options:0 metrics:nil views:views]];
        [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:[_buttonAnimation(20)]-20-|" options:0 metrics:nil views:views]];
        [self.view addConstraint:[NSLayoutConstraint constraintWithItem:_buttonAnimation attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeCenterX multiplier:1.0f constant:0.0f]];
    }
    [_buttonAnimation addTarget:self action:@selector(eventAnimation:) forControlEvents:UIControlEventTouchUpInside];
    
    self.animationView1 = [[UIView alloc] initWithFrame:CGRectMake(20, 61, 20, 20)];
    [self.view addSubview:_animationView1];
    _animationView1.backgroundColor = [UIColor redColor];
    
    self.animationView2 = [[UIView alloc] initWithFrame:CGRectMake(20, 111, 20, 20)];
    [self.view addSubview:_animationView2];
    _animationView2.backgroundColor = [UIColor greenColor];
    
    
}

- (void)CABasicAnimationDemo
{
    CABasicAnimation *animation = [CABasicAnimation animation];
    animation.keyPath = @"position.x";
    animation.fromValue = @(20);
    animation.toValue = @(300);
    animation.duration = 1;
    
    [_animationView1.layer addAnimation:animation forKey:@"basic"];
    _animationView1.layer.position = CGPointMake(300, 61);
//
    animation.fromValue = @(20);
    animation.toValue = @(300);
    animation.beginTime = CACurrentMediaTime() + 0.5;
    [_animationView2.layer addAnimation:animation forKey:@"basic"];
    _animationView2.layer.position = CGPointMake(300, 111);
}

- (void)CAKeyframeAnimationDemo
{
    CAKeyframeAnimation *animation = [CAKeyframeAnimation animation];
    animation.keyPath = @"position.x";
    animation.values = @[ @0, @10, @-10, @10, @0 ];
    animation.keyTimes = @[ @0, @(1 / 6.0), @(3 / 6.0), @(5 / 6.0), @1 ];
    animation.duration = 0.4;
    animation.additive = YES;
    [_animationView1.layer addAnimation:animation forKey:@"shake"];
}

- (void)circleAnimation
{
    _animationView1.frame = CGRectMake(100, 100, 20, 20);
    CGRect boundingRect = CGRectMake(-100, -100, 200, 200);
    
    CAKeyframeAnimation *orbit = [CAKeyframeAnimation animation];
    orbit.keyPath = @"position";
    orbit.path = CFAutorelease(CGPathCreateWithEllipseInRect(boundingRect, NULL));
    orbit.duration = 0.5;
    orbit.additive = YES;
    orbit.repeatCount = HUGE_VALF;
    orbit.calculationMode = kCAAnimationPaced;
    orbit.rotationMode = kCAAnimationRotateAuto;
    
    [_animationView1.layer addAnimation:orbit forKey:@"orbit"];
}

- (void)eventAnimation:(id)sender
{
//    [self CABasicAnimationDemo];
//    [self CAKeyframeAnimationDemo];
    [self circleAnimation];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
