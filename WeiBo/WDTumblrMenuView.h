//
//  WDTumblrMenuView.h
//  WeiBo
//
//  Created by chenjiang on 14-12-25.
//  Copyright (c) 2014年 wind. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void (^CHTumblrMenuViewSelectedBlock)(void);

@interface WDTumblrMenuView : UIView<UIGestureRecognizerDelegate>

@property (nonatomic, readonly)UIImageView *backgroundImgView;

- (void)addMenuItemWithTitle:(NSString*)title andIcon:(UIImage*)icon andSelectedBlock:(CHTumblrMenuViewSelectedBlock)block;
- (void)show;
- (void)showInController:(UIViewController*)controller;

@end
