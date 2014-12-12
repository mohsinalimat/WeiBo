//
//  NSString+WD.m
//  WeiBo
//
//  Created by chenjiang on 14-12-12.
//  Copyright (c) 2014年 wind. All rights reserved.
//

#import "NSString+WD.h"

@implementation NSString (WD)

- (NSString *)fileAppend:(NSString *)string
{
    NSString *ext = [self pathExtension];
    NSString *str = [self stringByDeletingPathExtension];
    str = [str stringByAppendingString:string];
    str = [str stringByAppendingString:ext];
    return str;
}

@end
