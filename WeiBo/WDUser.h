//
//  WDUser.h
//  WeiBo
//
//  Created by chenjiang on 14-12-12.
//  Copyright (c) 2014年 wind. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef NS_ENUM(NSInteger, VerifiedType)
{
  kVerifiedTypeNone           = -1,
  kVerifiedTypePersonal       = 0,
  kVerifiedTypeOrgEnterprice  = 2,
  kVerifiedTypeOrgMedia       = 3,
  kVerifiedTypeOrgWebsite     = 5,
  kVerifiedTypeDaren          = 220,
};

typedef NS_ENUM(NSInteger, MbType)
{
  kMbTypeNone,
  kMbTypeNormal,
  kMbTypeYear,
};

@interface WDUser : NSObject

@property(nonatomic, copy) NSString *screenName;
@property(nonatomic, copy) NSString *profileImageUrl;
@property(nonatomic, assign) BOOL verified;
@property(nonatomic, assign) VerifiedType verifiedType;
@property(nonatomic, assign) NSInteger mbRank;
@property(nonatomic, assign) MbType mbType;

- (instancetype)initWithDict:(NSDictionary *)dict;

+ (instancetype)statusUserWithDict:(NSDictionary *)dict;

@end
