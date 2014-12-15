//
//  WDStatusDock.m
//  WeiBo
//
//  Created by chenjiang on 14-12-15.
//  Copyright (c) 2014年 wind. All rights reserved.
//

#import "WDStatusDock.h"
#import "UIImage+WD568h.h"
#import "NSString+WD.h"
#import "WDMacro.h"

@implementation WDStatusDock

- (instancetype)initWithFrame:(CGRect)frame
{
  if (self = [super initWithFrame:frame])
  {
    _reposts = [self addButtonWithImage:@"timeline_icon_comment.png" backgroundImage:@"timeline_card_bottom_background" buttonIndex:0];
    _comments = [self addButtonWithImage:@"timeline_icon_retweet.png" backgroundImage:@"timeline_card_bottom_background" buttonIndex:1];
    _attitudes = [self addButtonWithImage:@"timeline_icon_unlike.png" backgroundImage:@"timeline_card_bottom_background" buttonIndex:2];
  }
  return self;
}

- (UIButton *)addButtonWithImage:(NSString *)imageName backgroundImage:(NSString *)backgroundImageName buttonIndex:(NSInteger)index
{
  UIButton *button = [super addButtonWithImage:imageName backgroundImage:backgroundImageName buttonIndex:index];
  [button setBackgroundImage:[UIImage resizeImage:backgroundImageName] forState:UIControlStateNormal];
  [button setBackgroundImage:[UIImage resizeImage:[backgroundImageName fileAppend:@"_highlighted"]] forState:UIControlStateHighlighted];
  if (index)
  {
    UIImageView *cardButton = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"timeline_card_bottom_line"]];
    [self addSubview:cardButton];
    cardButton.center = CGPointMake(button.frame.origin.x, kStatusDockHeight * 0.5);
  }
  return button;
}



@end
