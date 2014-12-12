//
//  WDBaseText.m
//  WeiBo
//
//  Created by chenjiang on 14-12-12.
//  Copyright (c) 2014年 wind. All rights reserved.
//

#import "WDBaseText.h"

@implementation WDBaseText

- (instancetype)initWithDict:(NSDictionary *)dict
{
  if (self = [super init])
  {
    _ID = [[dict valueForKey:@"id"] longLongValue];
    _text = [dict valueForKey:@"text"];
    _user = [WDUser statusUserWithDict:[dict valueForKey:@"user"]];
    self.createAt = [dict valueForKey:@"created_at"];
    self.source = [dict valueForKey:@"source"];
  }
  return self;
}

- (NSString *)createAt
{
  //"Tue May 31 17:46:55 +0800 2011"
  NSDateFormatter *dfm = [[NSDateFormatter alloc] init];
  dfm.dateFormat = @"EEE MMM dd HH:mm:ss zzzz yyyy";
  dfm.locale = [[NSLocale alloc] initWithLocaleIdentifier:@"en_US"];
  
  NSDate *createdTime = [dfm dateFromString:_createAt];
  dfm.dateFormat = @"M月d日 HH点mm分";
  
  NSString *createdTimeStr = [dfm stringFromDate:createdTime];
  
  NSTimeInterval time = [[NSDate date] timeIntervalSinceDate:createdTime];
  NSTimeInterval second = time;       // 时间单位换算成 秒
  NSTimeInterval minute = time / 60;  // 时间单位换算成 分
  NSTimeInterval hour = minute / 60;  // 时间单位换算成 时
  NSTimeInterval day = hour / 24;     // 时间单位换算成 天
  NSTimeInterval year = day / 365;    // 时间单位换算成 年
  
  if (second < 60) {                  // 1分钟之内显示 "刚刚"
    return @"刚刚";
  } else if (minute < 60) {           // 1小时之内显示 "x分钟前"
    return [NSString stringWithFormat:@"%.f分钟前", minute];
  } else if (hour < 24) {             // 1天之内显示 "x小时前"
    return [NSString stringWithFormat:@"%.f小时前", hour];
  } else if (day < 7) {               // 1周之内显示 "x天前"
    return [NSString stringWithFormat:@"%.f天前", day];
  } else if (year >= 1) {             // 1年以前显示 "xxxx年x月x日"
    dfm.dateFormat = @"yyyy年M月d日";
    return [dfm stringFromDate:createdTime];
  } else {                            // 1年以内显示 "x月x日 x点x分"
    return createdTimeStr;
  }
}

- (void)setSource:(NSString *)source
{
  //"<a href="http://weibo.com" rel="nofollow">新浪微博</a>"
  if (source == nil || [source isEqualToString:@""])
  {
    return;
  }
  NSInteger begin = [source rangeOfString:@">"].location + 1;
  NSInteger end  = [source rangeOfString:@"</a>"].location;
  NSString *tempStr = [source substringWithRange:NSMakeRange(begin, end - begin)];
  
  _source = [NSString stringWithFormat:@"来自%@", tempStr];
}

@end
