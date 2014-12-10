//
//  WDAccount.h
//  WeiBo
//
//  Created by chenjiang on 14-12-10.
//  Copyright (c) 2014年 wind. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface WDAccount : NSObject<NSCoding>

@property(nonatomic, copy) NSString *access_token;
@property(nonatomic, copy) NSString *expires_in;
@property(nonatomic, copy) NSString *remind_in;
@property(nonatomic, copy) NSString *uid;

- (instancetype)initWithDict:(NSDictionary *)dict;

+ (instancetype)accountWithDict:(NSDictionary *)dict;

@end
