//
//  WDAccount.m
//  WeiBo
//
//  Created by chenjiang on 14-12-10.
//  Copyright (c) 2014年 wind. All rights reserved.
//

#import "WDAccount.h"

@implementation WDAccount

/*
"access_token": "ACCESS_TOKEN",
"expires_in": 1234,
"remind_in":"798114",
"uid":"12341234"
}
 */
- (instancetype)initWithDict:(NSDictionary *)dict
{
  if (self = [super init])
  {
    _access_token = [dict valueForKey:@"access_token"];
    _expires_in   = [dict valueForKey:@"expires_in"];
    _remind_in    = [dict valueForKey:@"remind_in"];
    _uid          = [dict valueForKey:@"uid"];
  }
  return self;
}

+ (instancetype)accountWithDict:(NSDictionary *)dict
{
  return [[WDAccount alloc] initWithDict:dict];
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{
  [aCoder encodeObject:_access_token forKey:@"access_token"];
  [aCoder encodeObject:_uid forKey:@"uid"];
}

- (id)initWithCoder:(NSCoder *)aDecoder
{
  if (self = [super init])
  {
    _access_token = [aDecoder decodeObjectForKey:@"access_token"];
    _uid          = [aDecoder decodeObjectForKey:@"uid"];
  }
  return self;
}

@end
