//
//  WDBaseTextCellFrame.m
//  WeiBo
//
//  Created by chenjiang on 14-12-12.
//  Copyright (c) 2014年 wind. All rights reserved.
//

#import "WDBaseTextCellFrame.h"
#import "WDBaseText.h"
#import "WDMacro.h"

@implementation WDBaseTextCellFrame

- (void)setDataModel:(WDBaseText *)dataModel
{
  _dataModel = dataModel;
  CGSize screenSize = [UIScreen mainScreen].applicationFrame.size;
  self.cellWidth = screenSize.width;
  
  CGFloat avataX = kInterval;
  CGFloat avataY = kInterval;
  CGSize avataSize = [WDAvata sizeOfAvataType:_avataType];
  _avataRect = CGRectMake(avataX, avataY, avataSize.width, avataSize.height);
  
  CGFloat screenNameX = CGRectGetMaxX(_avataRect) + kInterval;
  CGFloat screenNameY = avataY;
  CGSize screenNameSize = [dataModel.user.screenName sizeWithFont:kScreenNameFount];
  _screenNameRect = CGRectMake(screenNameX, screenNameY, screenSize.width, screenSize.height);
  
  CGFloat mbIconX = CGRectGetMaxX(_screenNameRect) + kInterval;
  CGFloat mbIconY = (screenNameSize.height - kMBIconWH) * 0.5 + screenNameY;
  _mbIconRect = CGRectMake(mbIconX, mbIconY, kMBIconWH, kMBIconWH);
  
  _cellHeight = MAX(CGRectGetHeight(_avataRect), CGRectGetHeight(_screenNameRect)) + kInterval;
}

- (void)setDataModel:(WDBaseText *)dataModel withAvataType:(WDAvataType)avataType
{
  self.avataType = avataType;
  [self setDataModel:dataModel];
}

@end
