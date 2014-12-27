//
//  WDStatusViewCell.h
//  WeiBo
//
//  Created by chenjiang on 14-12-27.
//  Copyright (c) 2014年 wind. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "WDHomeStatusCell.h"

@interface WDStatusViewCell : UITableViewCell

@property(nonatomic, strong) WDBaseStatusCellFrame *cellFrame;

+ (NSString *)ID;

@end
