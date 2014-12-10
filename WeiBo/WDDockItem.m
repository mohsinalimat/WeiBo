//
//  WDDockItem.m
//  WeiBo
//
//  Created by chenjiang on 14-12-10.
//  Copyright (c) 2014年 wind. All rights reserved.
//

#import "WDDockItem.h"

#define kPercentage 0.6

@implementation WDDockItem

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame])
    {
        self.imageView.contentMode = UIViewContentModeCenter;
        self.titleLabel.backgroundColor = [UIColor clearColor];
        self.titleLabel.textColor = [UIColor blackColor];
        // 2、文字居中
        self.titleLabel.textAlignment = NSTextAlignmentCenter;
        
        // 3、文字大小
        self.titleLabel.font = [UIFont systemFontOfSize:12];
        
    }
    return self;
}

- (CGRect)imageRectForContentRect:(CGRect)contentRect
{
    CGFloat imageWidth = contentRect.size.width;
    CGFloat imageHeight = contentRect.size.height * kPercentage;
    return CGRectMake(0, 2, imageWidth, imageHeight);
}

- (CGRect)titleRectForContentRect:(CGRect)contentRect
{
    CGFloat titleY = contentRect.size.height * kPercentage;
    CGFloat width = contentRect.size.width;
    CGFloat height = contentRect.size.height * (1 - kPercentage);
    return CGRectMake(0, titleY, width, height);
}

- (void)setHighlighted:(BOOL)highlighted
{
    
}

@end
