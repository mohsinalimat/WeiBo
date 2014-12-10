//
//  WDMacro.h
//  WeiBo
//
//  Created by chenjiang on 14-12-10.
//  Copyright (c) 2014年 wind. All rights reserved.
//

#ifndef WeiBo_WDMacro_h
#define WeiBo_WDMacro_h

#import "AFNetworking.h"
#import "fmdb.h"
#import "MBProgressHUD.h"

#ifdef DEBUG
#define MyLog(...) NSLog(__VA_ARGS__)
#else
#define MyLog(...)
#endif

#define kDockHeight 44

// SAOAuthController:OAuth认证
#define kOAuthURL [kBaseURL stringByAppendingString:@"oauth2/authorize"]    // 新浪OAuth认证URL
#define kAppKey             @"660705995"                                    // 开发者帐号AppKey
#define kAppSecret          @"38d9d1d644844050dbb2703cb6bc6db6"             // 开发者帐号AppSecret
#define kClient_id          @"660705995"                                    // 新浪OAuth认证ClientID
#define kRedirect_uri       @"http://www.yusian.com"                        // 新浪OAuth认证回调页面
//#define kRedirect_uri       @"http://www.baidu.com"
#define kBaseURL            @"https://api.weibo.com/"                       // 新浪OAuth认证域名

#define HttpContentTypeText @"text/plain"

#endif
