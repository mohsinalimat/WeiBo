//
//  WDImageListView.h
//  WeiBo
//
//  Created by chenjiang on 14-12-12.
//  Copyright (c) 2014年 wind. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WDImageListView : UIView

@property(nonatomic, strong) NSArray *imageList;

+ (CGSize)sizeOfViewWithImageCount:(NSInteger)count;

@end
