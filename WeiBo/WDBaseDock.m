//
//  WDBaseDock.m
//  WeiBo
//
//  Created by chenjiang on 14-12-15.
//  Copyright (c) 2014年 wind. All rights reserved.
//

#import "WDBaseDock.h"
#import "WDMacro.h"

@implementation WDBaseDock

- (instancetype)initWithFrame:(CGRect)frame
{
  if (self = [super initWithFrame:frame]) {
    CGFloat dockWidth = [UIScreen mainScreen].bounds.size.width ;
    self.frame = CGRectMake(0, kCellDefaultHeight - kStatusDockHeight, dockWidth, kStatusDockHeight);
    self.autoresizingMask = UIViewAutoresizingFlexibleTopMargin;
    self.userInteractionEnabled = YES;
  }
  return self;
}

- (UIButton *)addButtonWithImage:(NSString *)imageName backgroundImage:(NSString *)backgroundImageName buttonIndex:(NSInteger)index
{
  UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
  [self addSubview:button];
  [button setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
  button.titleLabel.font = [UIFont systemFontOfSize:12];
  [button setImage:[UIImage imageNamed:imageName] forState:UIControlStateNormal];
  button.titleEdgeInsets = UIEdgeInsetsMake(0, 10, 0, 0);
  
  CGFloat buttonWidth = self.frame.size.width / 3;
  button.frame = CGRectMake(index * buttonWidth, 0, buttonWidth, self.frame.size.height);
  
  return button;
}

- (void)setButton:(UIButton *)button withTitle:(NSString *)title forCounts:(NSUInteger)number
{
  if (number > 10000)
  {
    NSString *title = [NSString stringWithFormat:@"%.1f万", number / 10000.0];
    title = [title stringByReplacingOccurrencesOfString:@".0" withString:@""];
    [button setTitle:title forState:UIControlStateNormal];
  }
  else if(number > 0)
  {
    [button setTitle:[NSString stringWithFormat:@"%lu", (unsigned long)number] forState:UIControlStateNormal];
  }
  else
  {
    [button setTitle:title forState:UIControlStateNormal];
  }
}

- (void)setStatus:(WDStatus *)status
{
  _status = status;
  
  [self setButton:_reposts withTitle:@"转发" forCounts:_status.repostsCount];
  [self setButton:_comments withTitle:@"评论" forCounts:_status.commentsCount];
  [self setButton:_attitudes withTitle:@"赞" forCounts:_status.attitudesCount];
}

@end
