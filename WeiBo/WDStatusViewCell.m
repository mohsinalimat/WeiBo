//
//  WDStatusViewCell.m
//  WeiBo
//
//  Created by chenjiang on 14-12-27.
//  Copyright (c) 2014年 wind. All rights reserved.
//

#import "WDStatusViewCell.h"

@interface WDStatusViewCell()

@property(nonatomic, strong) WDHomeStatusCell *cell;

@end
@implementation WDStatusViewCell

- (WDHomeStatusCell *)cell
{
  if (!_cell)
  {
    _cell = [[WDHomeStatusCell alloc] init];
  }
  return _cell;
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
  if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier])
  {
    self.backgroundColor = [UIColor clearColor];
  }
  return self;
}

- (void)setCellFrame:(WDBaseStatusCellFrame *)cellFrame
{
  _cellFrame = cellFrame;
  [self.cell setCellFrame:_cellFrame];
  [self addSubview:_cell];
}

- (void)setFrame:(CGRect)frame
{
  _cell.frame = CGRectMake(0, 0, _cellFrame.cellWidth, _cellFrame.cellHeight);
  frame.size.height += kCellMargins * 4;
  [super setFrame:frame];
}

+ (NSString *)ID
{
  return @"WDStatusViewCellID";
}

@end
