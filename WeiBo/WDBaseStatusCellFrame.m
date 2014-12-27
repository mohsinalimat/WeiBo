//
//  WDBaseStatusCellFrame.m
//  WeiBo
//
//  Created by chenjiang on 14-12-12.
//  Copyright (c) 2014年 wind. All rights reserved.
//

#import "WDBaseStatusCellFrame.h"
#import "WDMacro.h"
#import "WDImageListView.h"

@implementation WDBaseStatusCellFrame

@synthesize image         = _image;
@synthesize retweet       = _retweet;
@synthesize retext        = _retext;
@synthesize reScreenName  = _reScreenName;
@synthesize reImage       = _reImage;

- (void)setDataModel:(WDStatus *)dataModel
{
  [super setDataModel:dataModel];
  
  CGFloat timeX     = self.screenNameRect.origin.x;
  CGFloat timeY     = CGRectGetMaxY(self.screenNameRect) + kInterval * 0.5;
  CGSize timeSize   = CGSizeZero;
  if (SYSTEMVERSION >= 7.0f)
  {
    timeSize = [dataModel.createAt sizeWithAttributes:@{NSFontAttributeName : kTimeFont}];
  }
  else
  {
    timeSize = [dataModel.createAt sizeWithFont:kTimeFont];
  }
  self.timeRect     = CGRectMake(timeX, timeY, timeSize.width, timeSize.height);
  
  CGFloat sourceX   = CGRectGetMaxX(self.timeRect) + kInterval;
  CGFloat sourceY   = timeY;
  CGSize sourceSize = CGSizeZero;
  if (SYSTEMVERSION >= 7.0f)
  {
    sourceSize = [dataModel.source sizeWithAttributes:@{NSFontAttributeName : kSourceFont}];
  }
  else
  {
    sourceSize = [dataModel.source sizeWithFont:kSourceFont];
  }
  self.sourceRect   = CGRectMake(sourceX, sourceY, sourceSize.width, sourceSize.height);
  
  CGFloat textX     = self.avataRect.origin.x;
  CGFloat textY     = MAX(CGRectGetMaxY(self.avataRect), CGRectGetMaxY(self.timeRect));
  CGFloat textW     = self.cellWidth - 2 * kInterval;
  CGSize textSize   = [dataModel.text sizeWithFont:kTextFount constrainedToSize:CGSizeMake(textW, MAXFLOAT)];
  self.textRect     = CGRectMake(textX, textY, textSize.width, textSize.height);
  
  if (dataModel.picUrls.count)
  {
    CGFloat imageX   = kInterval;
    CGFloat imageY   = CGRectGetMaxY(self.textRect) + kInterval;
    CGSize imageSize = [WDImageListView sizeOfViewWithImageCount:dataModel.picUrls.count];
    self.image           = CGRectMake(imageX, imageY, imageSize.width, imageSize.height);
    self.cellHeight  = CGRectGetMaxY(_image) + kInterval + kCellMargins;
  }
  else if(dataModel.retweetedStatus)//有转发微博
  {
    CGFloat retweetX = kInterval;
    CGFloat retweetY = CGRectGetMaxY(self.textRect) + kInterval;
    CGFloat retweetW = self.cellWidth - 2 * kInterval;
    
    CGFloat reScreenNameX   = kInterval;
    CGFloat reScreenNameY   = kInterval;
    CGSize reScreenNameSize = [[NSString stringWithFormat:@"@%@", dataModel.retweetedStatus.user.screenName] sizeWithFont:kReScreenNameFont];
    self.reScreenName           = CGRectMake(reScreenNameX, reScreenNameY, reScreenNameSize.width, reScreenNameSize.height);
    
    CGFloat reTextX = reScreenNameX;
    CGFloat reTextY = CGRectGetMaxY(_reScreenName) + kInterval;
    CGSize reTextSize = [dataModel.retweetedStatus.text sizeWithFont:kReTextFont constrainedToSize:CGSizeMake((retweetW - 2 * kInterval), MAXFLOAT)];
    self.retext = (CGRect){{reTextX, reTextY}, reTextSize};
    
    if (dataModel.retweetedStatus.picUrls.count)
    {
      CGFloat reImageX = reScreenNameX;
      CGFloat reImageY = CGRectGetMaxY(_retext) + kInterval;
      CGSize reImageSize = [WDImageListView sizeOfViewWithImageCount:dataModel.retweetedStatus.picUrls.count];
      self.reImage = (CGRect){{reImageX, reImageY}, reImageSize};
      
      CGFloat retweetH = CGRectGetMaxY(_reImage) + kInterval;
      self.retweet = CGRectMake(retweetX, retweetY, retweetW, retweetH);
    }
    else
    {
      CGFloat retweetH = CGRectGetMaxY(_retext) + kInterval;
      _retweet = CGRectMake(retweetX, retweetY, retweetW, retweetH);
    }
    self.cellHeight = CGRectGetMaxY(_retweet) + kInterval + kCellMargins;
  }
  else
  {
    self.cellHeight = CGRectGetMaxY(self.textRect) + kInterval + kCellMargins;
  }
}

@end
