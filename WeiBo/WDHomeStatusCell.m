//
//  WDHomeStatusCell.m
//  WeiBo
//
//  Created by chenjiang on 14-12-15.
//  Copyright (c) 2014年 wind. All rights reserved.
//

#import "WDHomeStatusCell.h"
#import "WDStatusDock.h"

@interface WDHomeStatusCell()
{
  WDStatusDock *_statusDock;
}

@end

@implementation WDHomeStatusCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
  if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier])
  {
    _statusDock = [[WDStatusDock alloc] init];
    [self.contentView addSubview:_statusDock];
    
//    self.backgroundColor = [UIColor redColor];
  }
  return self;
}

- (void)setCellFrame:(WDBaseStatusCellFrame *)cellFrame
{
  [super setCellFrame:cellFrame];
  _statusDock.status = cellFrame.dataModel;
}

- (void)setFrame:(CGRect)frame
{
  [super setFrame:frame];
}

+ (NSString *)ID
{
  return @"HomeStatusCell";
}


@end
