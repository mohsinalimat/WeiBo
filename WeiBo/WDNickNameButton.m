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
  UILabel *_nickName;
  UIImageView *_icon;
}

@end

@implementation WDNickNameButton

- (instancetype)initWithNickName:(NSString *)nickName
{
  if (self = [super init])
  {
    self.backgroundColor = [UIColor redColor];
    [self setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
//    [self setTitle:nickName forState:UIControlStateNormal];
    self.bounds = CGRectMake(0, 0, kNickNameButtonWidth, kNickNameButtonHeight);
    self.translatesAutoresizingMaskIntoConstraints = NO;
    [self addConstraint:[NSLayoutConstraint constraintWithItem:self attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1.0f constant:kNickNameButtonWidth]];
    [self addConstraint:[NSLayoutConstraint constraintWithItem:self attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1.0f constant:kNickNameButtonHeight]];
    
    [self setBackgroundImage:[UIImage imageNamed:@"navigationbar_title_highlighted"] forState:UIControlStateHighlighted];
    
    _nickName = [[UILabel alloc] init];
    _nickName.backgroundColor = [UIColor greenColor];
    _nickName.text = nickName;
    _nickName.translatesAutoresizingMaskIntoConstraints = NO;
    [self addSubview:_nickName];
    [self addConstraint:[NSLayoutConstraint constraintWithItem:_nickName attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeCenterY multiplier:1.0f constant:0]];
    [self addConstraint:[NSLayoutConstraint constraintWithItem:_nickName attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeLeft multiplier:1.0f constant:8]];
    
    _icon = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"navigationbar_arrow_down"]];
    _icon.translatesAutoresizingMaskIntoConstraints = NO;
    [self addSubview:_icon];
    [self addConstraint:[NSLayoutConstraint constraintWithItem:_icon attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeCenterY multiplier:1.0f constant:0]];
    [self addConstraint:[NSLayoutConstraint constraintWithItem:_icon attribute:NSLayoutAttributeRight relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeRight multiplier:1.0f constant:8]];

    
//    UIView *spacer1 = [[UIView alloc] init];
//    spacer1.translatesAutoresizingMaskIntoConstraints = NO;
//    [self addSubview:spacer1];
//    spacer1.backgroundColor = [UIColor yellowColor];
//    
//    UIView *spacer2 = [[UIView alloc] init];
//    spacer2.translatesAutoresizingMaskIntoConstraints = NO;
//    [self addSubview:spacer2];
//    spacer2.backgroundColor = [UIColor purpleColor];
//    
//    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|[spacer1][_nickName][_icon][spacer2(==spacer1)]|" options:0 metrics:nil views:NSDictionaryOfVariableBindings(spacer1, _nickName, _icon, spacer2)]];
  }
  return self;
}

@end
