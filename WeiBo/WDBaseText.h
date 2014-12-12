//
//  WDBaseText.h
//  WeiBo
//
//  Created by chenjiang on 14-12-12.
//  Copyright (c) 2014年 wind. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "WDUser.h"

@interface WDBaseText : NSObject

@property(nonatomic, assign) long long ID;
@property(nonatomic, copy) NSString *text;
@property(nonatomic, strong) WDUser *user;
@property(nonatomic, copy) NSString *createAt;
@property(nonatomic, copy) NSString *source;

- (instancetype)initWithDict:(NSDictionary *)dict;

@end
