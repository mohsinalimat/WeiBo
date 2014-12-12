//
//  WDAvata.h
//  WeiBo
//
//  Created by chenjiang on 14-12-12.
//  Copyright (c) 2014年 wind. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "WDUser.h"

// SAAvata：微博头像处理
#define kAvataSmallW        34                                              // 用户小头像尺寸宽度
#define kAvataSmallH        kAvataSmallW                                    // 用户小头像尺寸高度
#define kAvataDefaultW      50                                              // 用户中头像尺寸宽度
#define kAvataDefaultH      kAvataDefaultW                                  // 用户中头像尺寸高度
#define kAvataBigW          85                                              // 用户大头像尺寸宽度
#define kAvataBigH          kAvataBigW                                      // 用户大头像尺寸高度
#define kVerifiedW          18                                              // 用户类型图标尺寸宽度
#define kVerifiedH          kVerifiedW                                      // 用户类型图标尺寸高度

typedef NS_ENUM(NSInteger, WDAvataType)
{
  kAvataTypeSmall,
  kAvataTypeDefault,
  kAvataTypeBig,
};

@interface WDAvata : UIView

@property(nonatomic, assign) WDAvataType type;
@property(nonatomic, strong) WDUser *user;

+ (CGSize)sizeOfAvataType:(WDAvataType)avataType;
- (void)setUser:(WDUser *)user ofType:(WDAvataType)type;
- (UIImage *)placeImageWithAvataType:(WDAvataType)avataType;

@end
