//
//  WDBaseTextCellTableViewCell.h
//  WeiBo
//
//  Created by chenjiang on 14-12-12.
//  Copyright (c) 2014年 wind. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "WDMacro.h"

@class WDBaseTextCellFrame;

@interface WDBaseTextCell : UITableViewCell

@property(nonatomic, strong) WDBaseTextCellFrame *cellFrame;

+ (NSString *)ID;

@end
