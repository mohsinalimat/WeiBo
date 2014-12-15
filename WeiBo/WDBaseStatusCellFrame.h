//
//  WDBaseStatusCellFrame.h
//  WeiBo
//
//  Created by chenjiang on 14-12-12.
//  Copyright (c) 2014年 wind. All rights reserved.
//

#import "WDBaseTextCellFrame.h"
#import "WDStatus.h"

@interface WDBaseStatusCellFrame : WDBaseTextCellFrame

@property(nonatomic, readonly) CGRect image;
@property(nonatomic, readonly) CGRect retweet;
@property(nonatomic, readonly) CGRect retext;
@property(nonatomic, readonly) CGRect reScreenName;
@property(nonatomic, readonly) CGRect reImage;

@end
