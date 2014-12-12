//
//  UIImage+WD568h.m
//  WeiBo
//
//  Created by chenjiang on 14-12-12.
//  Copyright (c) 2014年 wind. All rights reserved.
//

#import "UIImage+WD568h.h"
#import "WDMacro.h"
#import "NSString+WD.h"

@implementation UIImage (WD568h)

+ (UIImage *)fullScreenImage:(NSString *)string
{
    if (isIPhone5)
    {
        string = [string fileAppend:@"-568h@2x"];
    }
    return [self imageNamed:string];
}

+ (UIImage *)resizeImage:(NSString *)imageName
{
    UIImage *image = [UIImage imageNamed:imageName];
    return [image stretchableImageWithLeftCapWidth:5 topCapHeight:5];
}

@end
