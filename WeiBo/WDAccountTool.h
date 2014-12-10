//
//  WDAccountTool.h
//  WeiBo
//
//  Created by chenjiang on 14-12-10.
//  Copyright (c) 2014年 wind. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "WDAccount.h"

@interface WDAccountTool : NSObject

@property(nonatomic, readonly) WDAccount *account;

+ (WDAccountTool *)sharedAccountTool;

- (void)saveAccount:(WDAccount *)account;

@end
