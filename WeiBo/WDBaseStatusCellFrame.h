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

@property(nonatomic, assign) CGRect image;
@property(nonatomic, assign) CGRect retweet;
@property(nonatomic, assign) CGRect retext;
@property(nonatomic, assign) CGRect reScreenName;
@property(nonatomic, assign) CGRect reImage;

@end
