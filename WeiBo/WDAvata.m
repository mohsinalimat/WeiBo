//
//  WDAvata.m
//  WeiBo
//
//  Created by chenjiang on 14-12-12.
//  Copyright (c) 2014年 wind. All rights reserved.
//

#import "WDAvata.h"
#import "WDStatusTool.h"

@interface WDAvata()
{
  UIImageView *_icon;
  UIImageView *_verified;
}

@end

@implementation WDAvata

- (instancetype)initWithFrame:(CGRect)frame
{
  if (self = [super initWithFrame:frame]) {
    _icon = [[UIImageView alloc] init];
    [self addSubview:_icon];
    
    _verified = [[UIImageView alloc] init];
    [self addSubview:_verified];
  }
  return self;
}

- (void)setUser:(WDUser *)user ofType:(WDAvataType)type
{
  [self setUser:user];
  [self setType:type];
}

- (void)setType:(WDAvataType)type
{
  _type = type;
  switch (type)
  {
    case kAvataTypeSmall:
    {
      _icon.frame = CGRectMake(0, 0, kAvataSmallW, kAvataSmallH);
      _verified.center = CGPointMake(_icon.frame.size.width, _icon.frame.size.height);
      _verified.bounds = CGRectMake(0, 0, kVerifiedW, kVerifiedH);
    }
      break;
      
    case kAvataTypeDefault:
    {
      _icon.frame = CGRectMake(0, 0, kAvataDefaultW, kAvataDefaultH);
      _verified.center = CGPointMake(_icon.frame.size.width, _icon.frame.size.height);
      _verified.bounds = CGRectMake(0, 0, kVerifiedW, kVerifiedH);
    }
      break;
      
    case kAvataTypeBig:
    {
      _icon.frame = CGRectMake(0, 0, kAvataBigW, kAvataBigH);
      _verified.center = CGPointMake(_icon.frame.size.width, _icon.frame.size.height);
      _verified.bounds = CGRectMake(0, 0, kVerifiedW, kVerifiedH);
    }
      break;
      
    default:
      break;
  }
}

- (void)setUser:(WDUser *)user
{
  _user = user;
  
  [WDStatusTool statusToolInsteadView:_icon setImageWithURLString:user.profileImageUrl placeholderImage:[UIImage imageNamed:@"avatar_default"]];
  
  switch (user.verifiedType)
  {
    case kVerifiedTypeNone:
      _verified.hidden = YES;
      break;
      
    case kVerifiedTypePersonal:
      _verified.hidden = NO;
      _verified.image = [UIImage imageNamed:@"avatar_vip"];
      break;
      
    case kVerifiedTypeDaren:
      _verified.hidden = NO;
      _verified.image = [UIImage imageNamed:@"avatar_grassroot"];
      break;
      
    default:
      _verified.hidden = NO;
      _verified.image = [UIImage imageNamed:@"avatar_enterprise_vip"];
      break;
  }
}

- (UIImage *)placeImageWithAvataType:(WDAvataType)avataType
{
  switch (avataType)
  {
    case kAvataTypeSmall:
      return [UIImage imageNamed:@"avatar_default_small"];
      break;
      
    case kAvataTypeBig:
      return [UIImage imageNamed:@"avatar_default_big"];
      break;
      
    default:
      return [UIImage imageNamed:@"avatar_default"];
      break;
  }
}

+ (CGSize)sizeOfAvataType:(WDAvataType)avataType
{
  switch (avataType)
  {
    case kAvataTypeSmall:
      return CGSizeMake(kAvataSmallW + kVerifiedW * 0.5, kAvataSmallH + kVerifiedH * 0.5);
      break;
      
    case kAvataTypeDefault:
      return CGSizeMake(kAvataDefaultW + kVerifiedW * 0.5, kAvataDefaultH + kVerifiedH * 0.5);
      break;
      
    case kAvataTypeBig:
      return CGSizeMake(kAvataBigW + kVerifiedW * 0.5, kAvataBigH + kVerifiedH * 0.5);
      break;
      
    default:
      break;
  }
}

@end
