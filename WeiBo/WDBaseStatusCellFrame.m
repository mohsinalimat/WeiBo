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
  CGSize timeSize   = [dataModel.createAt sizeWithFont:kTimeFont];
  self.timeRect     = CGRectMake(timeX, timeY, timeSize.width, timeSize.height);
  
  CGFloat sourceX   = CGRectGetMaxX(self.timeRect) + kInterval;
  CGFloat sourceY   = timeY;
  CGSize sourceSize = [dataModel.source sizeWithFont:kSourceFont];
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
    _image           = CGRectMake(imageX, imageY, imageSize.width, imageSize.height);
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
    _reScreenName           = CGRectMake(reScreenNameX, reScreenNameY, reScreenNameSize.width, reScreenNameSize.height);
    
    CGFloat reTextX = reScreenNameX;
    CGFloat reTextY = CGRectGetMaxY(_reScreenName) + kInterval;
    CGSize reTextSize = [dataModel.retweetedStatus.text sizeWithFont:kReTextFont constrainedToSize:CGSizeMake((retweetW - 2 * kInterval), MAXFLOAT)];
    _retext = (CGRect){{reTextX, reTextY}, reTextSize};
    
    // 8、设置转发体配图尺寸位置
    if (dataModel.retweetedStatus.picUrls.count)
    {        // 第二种情况：1、转发的微博带图
      CGFloat reImageX = reScreenNameX;
      CGFloat reImageY = CGRectGetMaxY(_retext) + kInterval;
      CGSize reImageSize = [WDImageListView sizeOfViewWithImageCount:dataModel.retweetedStatus.picUrls.count];
      _reImage = (CGRect){{reImageX, reImageY}, reImageSize};
      
      // 转发体有配图转发体尺寸
      CGFloat retweetH = CGRectGetMaxY(_reImage) + kInterval;
      _retweet = CGRectMake(retweetX, retweetY, retweetW, retweetH);
    }
    else
    {
      // 转发体无配图转发体尺寸
      CGFloat retweetH = CGRectGetMaxY(_retext) + kInterval;
      _retweet = CGRectMake(retweetX, retweetY, retweetW, retweetH);
    }
    self.cellHeight = CGRectGetMaxY(_retweet) + kInterval + kCellMargins;
  }
  else
  {
    // 9、设置单元格高度尺寸位置
    // 无配图，无转发体单元格高度
    self.cellHeight = CGRectGetMaxY(self.textRect) + kInterval + kCellMargins;
  }
}

@end
