//
//  WDBaseTextCellFrame.h
//  WeiBo
//
//  Created by chenjiang on 14-12-12.
//  Copyright (c) 2014年 wind. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "WDAvata.h"

@class WDBaseText;

@interface WDBaseTextCellFrame : NSObject

@property(nonatomic, readonly) CGRect avataRect;
@property(nonatomic, readonly) CGRect screenNameRect;
@property(nonatomic, readonly) CGRect mbIconRect;
@property(nonatomic, assign)   CGRect timeRect;
@property(nonatomic, assign)   CGRect sourceRect;
@property(nonatomic, assign)   CGRect textRect;
@property(nonatomic, assign)   CGFloat cellHeight;
@property(nonatomic, assign) CGFloat cellWidth;
@property(nonatomic, assign)   WDAvataType avataType;
@property(nonatomic, strong)   WDBaseText *dataModel;

- (void)setDataModel:(WDBaseText *)dataModel withAvataType:(WDAvataType)avataType;

@end
