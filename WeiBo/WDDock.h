//
//  WDDock.h
//  WeiBo
//
//  Created by chenjiang on 14-12-10.
//  Copyright (c) 2014年 wind. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "WDDockItem.h"

@class WDDock;

@protocol WDDockDelegate <NSObject>

@optional
- (void)dock:(WDDock *)dock itemSelectFrom:(NSInteger)sourceIndex to:(NSInteger)toIndex;

@end

@interface WDDock : UIView

@property(nonatomic, strong) WDDockItem *item;
@property(nonatomic, weak) id<WDDockDelegate> delegate;
@property(nonatomic, assign) NSUInteger indexSelected;

- (void)addItemWithIcon:(NSString *)iconName selectedIcon:(NSString *)selected title:(NSString *)title;

@end
