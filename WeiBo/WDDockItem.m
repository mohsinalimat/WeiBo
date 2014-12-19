//
//  WDDockItem.m
//  WeiBo
//
//  Created by chenjiang on 14-12-10.
//  Copyright (c) 2014年 wind. All rights reserved.
//

#import "WDDockItem.h"

#define kPercentage 0.6

@interface WDDockItem()
{
  UIImageView *_addImage;
}

@property(nonatomic, assign) DockItemType type;

@end

@implementation WDDockItem

@synthesize type = _type;

+ (WDDockItem *)dockItemWithType:(DockItemType)type
{
  return [[WDDockItem alloc] initWithType:type];
}

- (void)configDockItem
{
  self.imageView.contentMode = UIViewContentModeCenter;
  
  [self setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
  [self setTitleColor:[UIColor orangeColor] forState:UIControlStateSelected];
  self.titleLabel.textAlignment = NSTextAlignmentCenter;
  self.titleLabel.font          = [UIFont systemFontOfSize:12];
}

- (instancetype)initWithType:(DockItemType)type
{
  if (self = [super init])
  {
    _type = type;
    [self configDockItem];
  }
  return self;
}

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame])
    {
      _type = DockItemTypeNormal;
      
      [self configDockItem];
    }
    return self;
}

- (CGRect)imageRectForContentRect:(CGRect)contentRect
{
  CGFloat imageWidth  = contentRect.size.width;
  CGFloat imageHeight = contentRect.size.height * kPercentage;
  if (_type == DockItemTypeNoTitle)
  {
    imageHeight = contentRect.size.height - 4;
    _addImage.center = CGPointMake(self.bounds.size.width / 2.0f, self.bounds.size.height / 2.0f);
  }
  return CGRectMake(0, 2, imageWidth, imageHeight);
}

- (CGRect)titleRectForContentRect:(CGRect)contentRect
{
    CGFloat titleY = contentRect.size.height * kPercentage;
    CGFloat width  = contentRect.size.width;
    CGFloat height = contentRect.size.height * (1 - kPercentage);
    return CGRectMake(0, titleY, width, height);
}

- (void)setHighlighted:(BOOL)highlighted
{
    
}

- (void)addOtherImage:(NSString *)icon
{
  _addImage = [[UIImageView alloc] initWithImage:[UIImage imageNamed:icon]];
  [self addSubview:_addImage];
}

@end
