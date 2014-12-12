//
//  WDStatusTool.m
//  WeiBo
//
//  Created by chenjiang on 14-12-12.
//  Copyright (c) 2014年 wind. All rights reserved.
//

#import "WDStatusTool.h"
#import "UIImageView+WebCache.h"
#import "WDHttpTool.h"
#import "WDStatus.h"

@implementation WDStatusTool

+ (void)statusToolGetStatusWithSinceID:(long long)since maxID:(long long)max Sucess:(StatusSucess)sucess failure:(StatusFailure)failure
{
  NSDictionary *param = @{
                          @"since_id" : @(since),
                          @"max_id" : @(max)
                          };
  [WDHttpTool httpToolPostWithBaseUrl:kBaseURL
                                 path:@"2/statuses/home_timeline.json"
                               params:param
                               sucess:^(id JSON) {
                                 if (sucess == nil)
                                 {
                                   return ;
                                 }
                                 NSMutableArray *statuses = [NSMutableArray array];
                                 for(NSDictionary *dict in [JSON valueForKey:@"statuses"])
                                 {
                                   WDStatus *status = [WDStatus statusWithDict:dict];
                                   [statuses addObject:status];
                                 }
                                 sucess(statuses);
                               }
                              failure:^(NSError *error) {
                                if (failure)
                                {
                                  return ;
                                }
                                failure(error);
                              }
                               method:HttpMethodGet
                          contentType:HttpContentTypeJson];
}

+ (void)statusToolInsteadView:(UIImageView *)imageView setImageWithURLString:(NSString *)urlString placeholderImage:(UIImage *)image
{
  [imageView sd_setImageWithURL:[NSURL URLWithString:urlString] placeholderImage:image options:SDWebImageLowPriority | SDWebImageRetryFailed];
}

@end
