//
//  WDBaseStatusCell.h
//  WeiBo
//
//  Created by chenjiang on 14-12-12.
//  Copyright (c) 2014年 wind. All rights reserved.
//

#import "WDBaseTextCellTableViewCell.h"
#import "WDBaseStatusCellFrame.h"

@interface WDBaseStatusCell : WDBaseTextCell

@property(nonatomic, strong) WDBaseStatusCellFrame *cellFrame;
@property(nonatomic, strong) UIImageView *retweet;

@end
