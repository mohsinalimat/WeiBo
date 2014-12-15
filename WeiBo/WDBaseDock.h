//
//  WDBaseDock.h
//  WeiBo
//
//  Created by chenjiang on 14-12-15.
//  Copyright (c) 2014年 wind. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "WDStatus.h"

@interface WDBaseDock : UIImageView
{
  UIButton *_reposts;
  UIButton *_comments;
  UIButton *_attitudes;
  WDStatus *_status;
}

@property(nonatomic, strong) WDStatus *status;

- (UIButton *)addButtonWithImage:(NSString *)imageName backgroundImage:(NSString *)backgroundImageName buttonIndex:(NSInteger)index;
- (void)setButton:(UIButton *)button withTitle:(NSString *)title forCounts:(NSUInteger)number;

@end
