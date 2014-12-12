//
//  WDImageListView.m
//  WeiBo
//
//  Created by chenjiang on 14-12-12.
//  Copyright (c) 2014年 wind. All rights reserved.
//

#import "WDImageListView.h"
#import "WDImageView.h"

#define kImageCount 9
#define kStatusImageOneWH   100                                             // 一张配图尺寸
#define kStatusImageMuWH    80                                              // 多张配图尺寸
#define kImageInterval      5                                               // 微博配图间隔

@implementation WDImageListView

- (instancetype)initWithFrame:(CGRect)frame
{
  if (self = [super initWithFrame:frame])
  {
    for(int i = 0; i < kImageCount; i++)
    {
      WDImageView *image = [[WDImageView alloc] init];
      [self addSubview:image];
    }
  }
  return self;
}

- (void)setImageList:(NSArray *)imageList
{
  _imageList = imageList;
  NSInteger imageCount = imageList.count;
  for(int i = 0; i < kImageCount; i++)
  {
    WDImageView *statusImage = self.subviews[i];
    if (i < imageCount)
    {
      statusImage.hidden = NO;
      statusImage.picUrl = [imageList[i] valueForKey:@"thumbnail_pic"];
      if (imageCount == 1)
      {
        self.backgroundColor = [UIColor clearColor];
        statusImage.contentMode = UIViewContentModeScaleAspectFit;
        statusImage.frame = CGRectMake(0, 0, kStatusImageOneWH, kStatusImageOneWH);
      }
      else
      {
        self.backgroundColor = [UIColor colorWithWhite:0.9 alpha:1];
        statusImage.contentMode = UIViewContentModeScaleAspectFill;
        statusImage.clipsToBounds = YES;
        
        NSInteger count = (imageCount == 4) ? 2 : 3;
        CGFloat multipleWidth = kStatusImageMuWH;
        CGFloat multipleHeight = kStatusImageMuWH;
        NSInteger row = i / count;
        NSInteger col = i % count;
        statusImage.frame = CGRectMake(col * (kImageInterval + multipleWidth) + kImageInterval, row * (kImageInterval + multipleHeight) + kImageInterval, multipleWidth, multipleHeight);
      }
    }
    else
    {
      statusImage.hidden = YES;
    }
  }
}

+ (CGSize)sizeOfViewWithImageCount:(NSInteger)count
{
  if (count == 1)
  {
    return CGSizeMake(kStatusImageOneWH, kStatusImageOneWH);
  }
  else
  {
    NSInteger columns = (count > 2 && count != 4) ? 3 : 2;
    NSInteger rows = (count + columns - 1) / columns;
    
    return CGSizeMake(columns * (kStatusImageMuWH + kImageInterval) + kImageInterval, rows * (kStatusImageMuWH + kImageInterval) + kImageInterval);
  }
}

@end
