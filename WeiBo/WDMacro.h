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

#define isIPhone5 ([UIScreen mainScreen].bounds.size.height == 568)
#define SYSTEMVERSION [[UIDevice currentDevice].systemVersion doubleValue] //系统版本号判断

#define COLORRGCA(R, G, B, A) [UIColor colorWithRed:R / 255 green:G / 255 blue:B / 255 alpha:A]

// SAOAuthController:OAuth认证
#define kOAuthURL [kBaseURL stringByAppendingString:@"oauth2/authorize"]    // 新浪OAuth认证URL

#define kAppKey             @"141199207"                                    // 开发者帐号AppKey
#define kAppSecret          @"d2edc69e690faf8b0dc7f18719930923"             // 开发者帐号AppSecret
#define kClient_id          @"141199207"                                    // 新浪OAuth认证ClientID
#define kRedirect_uri       @"https://api.weibo.com/oauth2/default.html" // 新浪OAuth认证回调页面

#define kBaseURL            @"https://api.weibo.com/"                       // 新浪OAuth认证域名

#define HttpContentTypeText @"text/plain"
#define HttpContentTypeJson @"application/json"

#define kColor(r, g, b)     [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:1]
#define kBGColor            kColor(239, 239, 244)                           // 全局背景颜色

#define kMBScreenNameColor  kColor(240, 100, 20)                            // 会员用户昵称颜色
#define kScreenNameColor    kColor(0, 0, 0)                                 // 普通用户昵称颜色
#define kTimeColor          kColor(200, 100, 30)                            // 微博发表时间显示颜色
#define kScreenNameFount    [UIFont systemFontOfSize:15]                    // 用户昵称字号
#define kReScreenNameFont   [UIFont systemFontOfSize:15]                    // 转发微博体昵称字号
#define kTimeFont           [UIFont systemFontOfSize:10]                    // 发表时间字号
#define kTextFount          [UIFont systemFontOfSize:17]                    // 微博正文字号
#define kSourceFont         kTimeFont                                       // 微博来源字号
#define kInterval 10
#define kCellMargins        (kInterval * 0.5)                               // 单元格两边边距
#define kMBIconWH           12                                              // 会员图标尺寸
#define kReTextFont         kReScreenNameFont                               // 转发微博体正文字号

#define kCellDefaultHeight  44                                              // TableViewCell默认高度
#define kStatusDockHeight   35                                              // 功能菜单栏高度

#endif
