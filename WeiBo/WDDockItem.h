//
//  WDDockItem.h
//  WeiBo
//
//  Created by chenjiang on 14-12-10.
//  Copyright (c) 2014年 wind. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSUInteger, DockItemType)
{
  DockItemTypeNormal  = 0x001,
  DockItemTypeNoTitle = 0x002,
};

@interface WDDockItem : UIButton

+ (WDDockItem *)dockItemWithType:(DockItemType)type;

- (void)addOtherImage:(NSString *)icon;

@end
