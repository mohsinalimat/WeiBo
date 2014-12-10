//
//  WDHttpTool.h
//  WeiBo
//
//  Created by chenjiang on 14-12-10.
//  Copyright (c) 2014年 wind. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "WDMacro.h"

typedef void (^Sucess)(id JSON);
typedef void (^Failure)(NSError *error);

typedef NS_ENUM(NSInteger, HttpMethod)
{
  HttpMethodGet   = 0x0000,
  HttpMethodPost  = 0x0001,
};

@interface WDHttpTool : NSObject

+ (void)httpToolPostWithBaseUrl:(NSString *)urlString path:(NSString *)pathString params:(NSDictionary *)params sucess:(Sucess)success failure:(Failure)failure method:(HttpMethod)method contentType:(NSString *)contentType;

@end
