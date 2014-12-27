//
//  WDBaseTextCellTableViewCell.m
//  WeiBo
//
//  Created by chenjiang on 14-12-12.
//  Copyright (c) 2014年 wind. All rights reserved.
//

#import "WDBaseTextCell.h"
#import "WDBaseStatusCellFrame.h"
#import "WDAvata.h"
#import "WDBaseText.h"

@interface WDBaseTextCell()
{
    WDAvata *_avata;
    UILabel *_screenName;
    UIImageView *_mbIcon;
    UILabel *_time;
    UILabel *_source;
    UILabel *_text;
}

@end

@implementation WDBaseTextCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier])
    {
        self.backgroundColor = [UIColor clearColor];
        self.backgroundView = nil;
      
        [self createSubView];
    }
    return self;
}

- (void)createSubView
{
    _avata = [[WDAvata alloc] init];
    _avata.backgroundColor = [UIColor clearColor];
    [self.contentView addSubview:_avata];
    
    _screenName = [[UILabel alloc] init];
    _screenName.backgroundColor = [UIColor clearColor];
    _screenName.font = kScreenNameFount;
    [self.contentView addSubview:_screenName];
    
    _mbIcon = [[UIImageView alloc] init];
    _mbIcon.image = [UIImage imageNamed:@"common_icon_membership"];
    [self.contentView addSubview:_mbIcon];
    
    _time = [[UILabel alloc] init];
    _time.backgroundColor = [UIColor clearColor];
    _time.font = kTimeFont;
    _time.textColor = kTimeColor;
    [self.contentView addSubview:_time];
    
    _source = [[UILabel alloc] init];
    _source.backgroundColor = [UIColor clearColor];
    _source.font = kSourceFont;
    _source.textColor = [UIColor grayColor];
    [self.contentView addSubview:_source];
    
    _text = [[UILabel alloc] init];
    _text.backgroundColor = [UIColor clearColor];
    _text.font = kTextFount;
    _text.numberOfLines = 0;
    [self.contentView addSubview:_text];
}

- (void)setCellFrame:(WDBaseTextCellFrame *)cellFrame
{
    _cellFrame = cellFrame;
    [self settingSubViewForContent];
    [self settingSubViewForFrame];
}

- (void)settingSubViewForContent
{
    [_avata setUser:_cellFrame.dataModel.user ofType:_cellFrame.avataType];
    
    _screenName.text = _cellFrame.dataModel.user.screenName;
    if (_cellFrame.dataModel.user.mbType == kMbTypeNone)
    {
        _screenName.textColor = kScreenNameColor;
    }
    else
    {
        _screenName.textColor = kMBScreenNameColor;
    }
    
    if (_cellFrame.dataModel.user.mbType == kMbTypeNone)
    {
        _mbIcon.hidden = YES;
    }
    else
    {
        _mbIcon.hidden = NO;
    }
    
    _time.text = _cellFrame.dataModel.createAt;
    _source.text = _cellFrame.dataModel.source;
    _text.text = _cellFrame.dataModel.text;
}

- (void)settingSubViewForFrame
{
    _avata.frame = _cellFrame.avataRect;
    
    _screenName.frame = _cellFrame.screenNameRect;
    
    _mbIcon.frame = _cellFrame.mbIconRect;
    
    CGRect timeFrame = _cellFrame.timeRect;
    timeFrame.size = [_cellFrame.dataModel.createAt sizeWithFont:kTimeFont];
    _time.frame = timeFrame;
    
    CGRect sourceFrame = _cellFrame.sourceRect;
    sourceFrame.origin.x = CGRectGetMaxX(timeFrame) + kInterval;
    _source.frame = sourceFrame;
    
    _text.frame = _cellFrame.textRect;
}

+ (NSString *)ID
{
    return @"BaseTextCell";
}

@end
