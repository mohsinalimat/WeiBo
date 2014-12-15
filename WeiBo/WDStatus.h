//
//  WDStatus.h
//  WeiBo
//
//  Created by chenjiang on 14-12-12.
//  Copyright (c) 2014年 wind. All rights reserved.
//

#import "WDBaseText.h"

@interface WDStatus : WDBaseText

@property(nonatomic, strong) WDStatus *retweetedStatus;
@property(nonatomic, assign) NSUInteger repostsCount;
@property(nonatomic, assign) NSUInteger commentsCount;
@property(nonatomic, assign) NSUInteger attitudesCount;
@property(nonatomic, strong) NSArray *picUrls;

+ (id) statusWithDict:(NSDictionary *)dict;

@end
