//
//  WDStatusTool.h
//  WeiBo
//
//  Created by chenjiang on 14-12-12.
//  Copyright (c) 2014年 wind. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@class WDStatus;

typedef void(^StatusSucess)(NSArray *array);
typedef void(^StatusFailure)(NSError *error);

@interface WDStatusTool : NSObject

+ (void)statusToolGetStatusWithSinceID:(long long)since maxID:(long long)max Sucess:(StatusSucess)sucess failure:(StatusFailure)failure;

+ (void)statusToolInsteadView:(UIImageView *)imageView setImageWithURLString:(NSString *)urlString placeholderImage:(UIImage*)image;

@end
