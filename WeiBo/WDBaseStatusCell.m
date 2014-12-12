//
//  WDBaseStatusCell.m
//  WeiBo
//
//  Created by chenjiang on 14-12-12.
//  Copyright (c) 2014年 wind. All rights reserved.
//

#import "WDBaseStatusCell.h"
#import "WDImageListView.h"
#import "UIImage+WD568h.h"
#import "WDHomeStatusCellFrame.h"

@interface WDBaseStatusCell()
{
    WDImageListView *_image;
    UIImageView *_retweet;
    UILabel *_reScreenName;
    UILabel *_reText;
    WDImageListView *_reImage;
}

@end

@implementation WDBaseStatusCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier])
    {
        UIImage *bgView = [UIImage resizeImage:@"common_card_background.png"];
        self.backgroundView = [[UIImageView alloc] initWithImage:bgView];
        
        UIImage *selectedBgView = [UIImage resizeImage:@"common_card_background_highlighted.png"];
        self.selectedBackgroundView = [[UIImageView alloc] initWithImage:selectedBgView];
        
        [self createBaseStatusView];
    }
    return self;
}

- (void)createBaseStatusView
{
    _image = [[WDImageListView alloc] init];
    _image.contentMode = UIViewContentModeScaleAspectFit;
    [self.contentView addSubview:_image];
    
    _retweet = [[UIImageView alloc] init];
    _retweet.image = [UIImage imageNamed:@"timeline_retweet_background"];
    _retweet.userInteractionEnabled = YES;
    [self.contentView addSubview:_retweet];
    
    _reScreenName = [[UILabel alloc] init];
    _reScreenName.font = kReScreenNameFont;
    _reScreenName.backgroundColor = [UIColor clearColor];
    _reScreenName.textColor = [UIColor blueColor];
    [_retweet addSubview:_reScreenName];
    
    _reText = [[UILabel alloc] init];
    _reText.numberOfLines = 0;
    _reText.font = kReTextFont;
    _reText.backgroundColor = [UIColor clearColor];
    [_retweet addSubview:_reText];
    
    _reImage = [[WDImageListView alloc] init];
    _reImage.contentMode = UIViewContentModeScaleAspectFit;
    [_retweet addSubview:_reImage];
}

- (void)setCellFrame:(WDBaseStatusCellFrame *)cellFrame
{
    [super setCellFrame:cellFrame];
    [self settingBaseStatusSubViewContent];
    [self settingBaseStatusSubViewFrame];
}

- (void)settingBaseStatusSubViewContent
{
    WDStatus *status = self.cellFrame.dataModel;
    if (status.picUrls.count)
    {
        _image.hidden = NO;
        _retweet.hidden = NO;
        _image.imageList = status.picUrls;
    }
}

- (void)settingBaseStatusSubViewFrame
{
    
}

- (void)setFrame:(CGRect)frame
{
    
}

+ (NSString *)ID
{
    return @"BaseStatusCell";
}

@end
