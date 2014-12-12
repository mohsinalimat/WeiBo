//
//  WDImageView.m
//  WeiBo
//
//  Created by chenjiang on 14-12-12.
//  Copyright (c) 2014年 wind. All rights reserved.
//

#import "WDImageView.h"
#import "WDStatusTool.h"

@interface WDImageView()
{
  UIImageView *_gifView;
}

@end

@implementation WDImageView

- (instancetype)initWithFrame:(CGRect)frame
{
  if (self = [super initWithFrame:frame]) {
    _gifView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"timeline_image_gif"]];
    [self addSubview:_gifView];
  }
  return self;
}

- (void)setPicUrl:(NSString *)picUrl
{
  _picUrl = picUrl;
  [WDStatusTool statusToolInsteadView:self setImageWithURLString:picUrl placeholderImage:[UIImage imageNamed:@"timeline_image_loading"]];
  _gifView.hidden = ![picUrl.lowercaseString hasSuffix:@".gif"];
}

- (void)setFrame:(CGRect)frame
{
  [super setFrame:frame];
  CGSize gifViewSize = _gifView.frame.size;
  _gifView.frame = CGRectMake(frame.size.width - gifViewSize.width, frame.size.height - gifViewSize.height, gifViewSize.width, gifViewSize.height);
}

@end
