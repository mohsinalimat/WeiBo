//
//  WDHomeStatusCellFrame.m
//  WeiBo
//
//  Created by chenjiang on 14-12-12.
//  Copyright (c) 2014年 wind. All rights reserved.
//

#import "WDHomeStatusCellFrame.h"
#import "WDMacro.h"

@implementation WDHomeStatusCellFrame

- (void)setDataModel:(WDStatus *)dataModel
{
  [super setDataModel:dataModel];
  self.cellHeight += kStatusDockHeight;
}

@end
