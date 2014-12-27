//
//  WDBaseTextCellFrame.m
//  WeiBo
//
//  Created by chenjiang on 14-12-12.
//  Copyright (c) 2014年 wind. All rights reserved.
//

#import "WDBaseTextCellFrame.h"
#import "WDStatus.h"
#import "WDMacro.h"

@implementation WDBaseTextCellFrame

@synthesize avataRect       = _avataRect;
@synthesize screenNameRect  = _screenNameRect;
@synthesize mbIconRect      = _mbIconRect;
@synthesize timeRect        = _timeRect;
@synthesize sourceRect      = _sourceRect;
@synthesize textRect        = _textRect;
@synthesize cellHeight      = _cellHeight;
@synthesize cellWidth       = _cellWidth;
@synthesize avataType       = _avataType;
@synthesize dataModel       = _dataModel;


- (void)setDataModel:(WDStatus *)dataModel
{
  _dataModel        = dataModel;
  CGSize screenSize = [UIScreen mainScreen].applicationFrame.size;
  self.cellWidth    = screenSize.width;
  
  CGFloat avataX    = kInterval;
  CGFloat avataY    = kInterval;
  CGSize avataSize  = [WDAvata sizeOfAvataType:_avataType];
  _avataRect = (CGRect){avataX, avataY, avataSize};
  
  CGFloat screenNameX   = CGRectGetMaxX(_avataRect) + kInterval;
  CGFloat screenNameY   = avataY;
  CGSize screenNameSize = [dataModel.user.screenName sizeWithFont:kScreenNameFount];
  _screenNameRect       = CGRectMake(screenNameX, screenNameY, screenNameSize.width, screenNameSize.height);
  
  CGFloat mbIconX = CGRectGetMaxX(_screenNameRect) + kInterval;
  CGFloat mbIconY = (screenNameSize.height - kMBIconWH) * 0.5 + screenNameY;
  _mbIconRect     = CGRectMake(mbIconX, mbIconY, kMBIconWH, kMBIconWH);
  
  _cellHeight     = MAX(CGRectGetHeight(_avataRect), CGRectGetHeight(_screenNameRect)) + kInterval;
}

- (void)setDataModel:(WDStatus *)dataModel withAvataType:(WDAvataType)avataType
{
  _avataType = avataType;
  [self setDataModel:dataModel];
}

@end
