//
//  WDAccountTool.m
//  WeiBo
//
//  Created by chenjiang on 14-12-10.
//  Copyright (c) 2014年 wind. All rights reserved.
//

#import "WDAccountTool.h"

#define kAccountFile [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory,NSUserDomainMask,YES)[0] stringByAppendingString:@"/account.data"]

@implementation WDAccountTool

static WDAccountTool *_instance = nil;

+ (WDAccountTool *)sharedAccountTool
{
  if (!_instance)
  {
    _instance = [[WDAccountTool alloc] init];
  }
  return _instance;
}

+ (instancetype)allocWithZone:(struct _NSZone *)zone
{
  static dispatch_once_t onceToken;
  dispatch_once(&onceToken, ^{
    _instance = [super allocWithZone:zone];
  });
  return _instance;
}

- (instancetype)init
{
  if (self = [super init])
  {
    _account = [NSKeyedUnarchiver unarchiveObjectWithFile:kAccountFile];
  }
  return self;
}

- (void)saveAccount:(WDAccount *)account
{
  _account = account;
  [NSKeyedArchiver archiveRootObject:account toFile:kAccountFile];
}

@end
