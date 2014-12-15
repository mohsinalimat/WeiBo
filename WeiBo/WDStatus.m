//
//  WDStatus.m
//  WeiBo
//
//  Created by chenjiang on 14-12-12.
//  Copyright (c) 2014年 wind. All rights reserved.
//

#import "WDStatus.h"

@implementation WDStatus

@synthesize repostsCount = _repostsCount;
@synthesize commentsCount = _commentsCount;
@synthesize attitudesCount = _attitudesCount;

- (instancetype)initWithDict:(NSDictionary *)dict
{
  if (self = [super initWithDict:dict])
  {
    _repostsCount = [[dict valueForKey:@"reposts_count"] intValue];
    _commentsCount = [[dict valueForKey:@"comments_count"] intValue];
    _attitudesCount = [[dict valueForKey:@"attitudes_count"] intValue];
    _picUrls = [dict valueForKey:@"pic_urls"];
    
    NSDictionary *retweeted_status = [dict valueForKey:@"retweeted_status"];
    if (retweeted_status)
    {
      _retweetedStatus = [[WDStatus alloc] initWithDict:retweeted_status];
    }
  }
  return self;
}

+ (id)statusWithDict:(NSDictionary *)dict
{
  return [[WDStatus alloc] initWithDict:dict];
}

@end
