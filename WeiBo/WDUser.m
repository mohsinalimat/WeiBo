//
//  WDUser.m
//  WeiBo
//
//  Created by chenjiang on 14-12-12.
//  Copyright (c) 2014年 wind. All rights reserved.
//

#import "WDUser.h"

@implementation WDUser

- (instancetype)initWithDict:(NSDictionary *)dict
{
  if (self = [super init])
  {
    _screenName = [dict valueForKey:@"screen_name"];
    _profileImageUrl = [dict valueForKey:@"profile_image_url"];
    _verified = [[dict valueForKey:@"verified"] boolValue];
    _verifiedType = [[dict valueForKey:@"verified_type"] intValue];
    _mbRank = [[dict valueForKey:@"mbrank"] intValue];
    _mbType = [[dict valueForKey:@"mbtype"] intValue];
  }
  return self;
}

+ (instancetype)statusUserWithDict:(NSDictionary *)dict
{
  return [[WDUser alloc] initWithDict:dict];
}

@end
