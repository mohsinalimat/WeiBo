//
//  WDHttpTool.m
//  WeiBo
//
//  Created by chenjiang on 14-12-10.
//  Copyright (c) 2014年 wind. All rights reserved.
//

#import "WDHttpTool.h"
#import "WDAccountTool.h"

@implementation WDHttpTool

+ (void)httpToolPostWithBaseUrl:(NSString *)urlString path:(NSString *)pathString params:(NSDictionary *)params sucess:(Sucess)success failure:(Failure)failure method:(HttpMethod)method contentType:(NSString *)contentType
{
  AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
  manager.responseSerializer.acceptableContentTypes = [manager.responseSerializer.acceptableContentTypes setByAddingObject:contentType];
  
  NSString *url = [NSString stringWithFormat:@"%@%@", urlString, pathString];
  
  NSMutableDictionary *paramsDict = [[NSMutableDictionary alloc] initWithDictionary:params];
  NSString *accessToken = [WDAccountTool sharedAccountTool].account.access_token;
  if (accessToken)
  {
    [paramsDict setObject:accessToken forKey:@"access_token"];
  }
  
  switch (method)
  {
    case HttpMethodGet:
    {
      [manager GET:url parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        success(responseObject);
      } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        failure(error);
      }];
    }
      break;
      
    case HttpMethodPost:
    {
      [manager POST:url parameters:paramsDict success:^(AFHTTPRequestOperation *operation, id responseObject) {
        success(responseObject);
      } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        failure(error);
      }];
    }
      break;
  }
}

@end
