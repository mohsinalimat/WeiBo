//
//  WDDock.m
//  WeiBo
//
//  Created by chenjiang on 14-12-10.
//  Copyright (c) 2014年 wind. All rights reserved.
//

#import "WDDock.h"

@implementation WDDock

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame])
    {
        self.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"tabbar_background"]];
    }
    return self;
}

- (void)addItemWithIcon:(NSString *)iconName selectedIcon:(NSString *)selected title:(NSString *)title
{
    WDDockItem *item = nil;
    if (title == nil)
    {
      item = [WDDockItem dockItemWithType:DockItemTypeNoTitle];
      [item addOtherImage:@"tabbar_compose_icon_add"];
    }
    else
    {
      item = [[WDDockItem alloc] init];
    }
  
    [self addSubview:item];
    
    [item setTitle:title forState:UIControlStateNormal];
    [item setImage:[UIImage imageNamed:iconName] forState:UIControlStateNormal];
    [item setImage:[UIImage imageNamed:selected] forState:UIControlStateSelected];
    [item addTarget:self action:@selector(itemEvent:) forControlEvents:UIControlEventTouchDown];
    
    NSUInteger count = self.subviews.count;
    CGFloat width = self.frame.size.width / count;
    CGFloat height = self.frame.size.height;
    for(int i = 0; i < count; i++)
    {
        WDDockItem *item = self.subviews[i];
        item.tag = i;
        item.frame = CGRectMake(width * i, 0, width, height);
    }
    
    if (_item == nil)
    {
        [self itemEvent:self.subviews[0]];
    }
}

- (void)itemEvent:(WDDockItem *)item
{
    if (_delegate && [_delegate respondsToSelector:@selector(dock:itemSelectFrom:to:)])
    {
        [_delegate dock:self itemSelectFrom:(NSInteger)_item.tag to:(NSInteger)item.tag];
        _indexSelected = item.tag;
    }
  
    if(item.tag == 2)
    {
      return;
    }
  
    _item.selected = NO;
    item.selected  = YES;
    self.item      = item;
}

- (BOOL)canBecomeFirstResponder
{
  return YES;
}

@end
