//
//  WDAddController.m
//  WeiBo
//
//  Created by chenjiang on 14-12-10.
//  Copyright (c) 2014年 wind. All rights reserved.
//

#import "WDAddController.h"
#import "WDMacro.h"

#define kTitleHeight 20
#define kHorizontalMargin 15

#define kAnimationTime 0.25

@interface WDComposeButton()
{
  UIImageView *_iconView;
  UILabel *_titleLabel;
}

@end

@implementation WDComposeButton

- (instancetype)initWithTitle:(NSString *)title icon:(UIImage *)icon
{
  if (self = [super init])
  {
    _iconView = [[UIImageView alloc] initWithImage:icon];
    [self addSubview:_iconView];
    
    _titleLabel = [[UILabel alloc] init];
    [self addSubview:_titleLabel];
    _titleLabel.textAlignment = NSTextAlignmentCenter;
    _titleLabel.backgroundColor = [UIColor clearColor];
    _titleLabel.textColor = [UIColor grayColor];
    _titleLabel.text = title;
    [self addSubview:_titleLabel];
  }
  return self;
}

- (void)setFrame:(CGRect)frame
{
  [super setFrame:frame];
  _iconView.frame = CGRectMake(0, 0, _iconView.frame.size.width, _iconView.frame.size.height);
  _titleLabel.frame = CGRectMake(0, _iconView.frame.size.height, _iconView.frame.size.width, kTitleHeight);
}

- (CGSize)getIconSize
{
  return _iconView.frame.size;
}

@end

@interface WDAddController()

@property(nonatomic, strong) UIButton *btnIdea;
@property(nonatomic, strong) UIButton *btnBackground;
@property(nonatomic, strong) UIImageView *addImage;

@property(nonatomic, strong) NSMutableArray *arrButtons;

@end

@implementation WDAddController

@synthesize arrButtons = _arrButtons;

- (NSMutableArray *)arrButtons
{
  if (!_arrButtons)
  {
    _arrButtons = [[NSMutableArray alloc] init];
  }
  return _arrButtons;
}

- (void)viewDidLoad
{
  [super viewDidLoad];
  self.view.backgroundColor = [UIColor greenColor];
  
  _btnBackground = [UIButton buttonWithType:UIButtonTypeCustom];
  [self.view addSubview:_btnBackground];
  _btnBackground.frame = [UIScreen mainScreen].bounds;
  [_btnBackground setBackgroundColor:[UIColor whiteColor]];
  [_btnBackground addTarget:self action:@selector(dispearClick:) forControlEvents:UIControlEventTouchUpInside];
  
  UIImageView *bottomView = [[UIImageView alloc] init];
  bottomView.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"tabbar_background"]];
  [self.view addSubview:bottomView];
  CGSize winSize = [UIScreen mainScreen].bounds.size;
  bottomView.frame = CGRectMake(0, winSize.height - 44, winSize.width, 44);
  
  _addImage = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"tabbar_compose_background_icon_add"]];
  [bottomView addSubview:_addImage];
  _addImage.center = CGPointMake(bottomView.bounds.size.width / 2.0f, bottomView.bounds.size.height / 2.0f);
  
  [UIView beginAnimations:@"addImageOn" context:nil];
  [_addImage setAnimationDuration:1.0f];
  CGAffineTransform transform = CGAffineTransformIdentity;
  _addImage.transform = CGAffineTransformRotate(transform, 45.0f * M_PI / 180.0f);
  [UIView commitAnimations];
  
  [self addButtons:@"文字" image:[UIImage imageNamed:@"tabbar_compose_idea"]];
  [self addButtons:@"相册" image:[UIImage imageNamed:@"tabbar_compose_photo"]];
  [self addButtons:@"拍摄" image:[UIImage imageNamed:@"tabbar_compose_camera"]];
  [self addButtons:@"签到" image:[UIImage imageNamed:@"tabbar_compose_lbs"]];
  [self addButtons:@"点评" image:[UIImage imageNamed:@"tabbar_compose_review"]];
  [self addButtons:@"更多" image:[UIImage imageNamed:@"tabbar_compose_more"]];
  
  [self popupAnimation];
  
  [self layoutButtons];
}

- (void)layoutButtons
{
  for(NSInteger i = 0; i < _arrButtons.count; i++)
  {
    WDComposeButton *btn = _arrButtons[i];
    btn.frame = [self frameForButtonAtIndex:i];
  }
}

- (CGRect)frameForButtonAtIndex:(NSInteger)index
{
  NSUInteger colCount = 3;
  NSUInteger colIndex = index % colCount;
  
  NSUInteger rowCount = _arrButtons.count / colCount + (_arrButtons.count % colCount > 0 ? 1 : 0);
  NSUInteger rowIndex = index / colCount;
  
  WDComposeButton *btn = _arrButtons[index];
  CGSize imageSize = [btn getIconSize];
  CGFloat itemHeight = (imageSize.height + kTitleHeight) * rowCount + (rowCount > 1 ? (rowCount - 1) * kHorizontalMargin : 0);
  CGFloat offSetY = (self.view.bounds.size.height - itemHeight) / 2.0f;
  CGFloat vPadding = (self.view.bounds.size.width - kHorizontalMargin * 2 - imageSize.width * 3) / 2.0f;
  CGFloat offSetX  = kHorizontalMargin;
  offSetX += (imageSize.width + vPadding) * colIndex;
  offSetY += (imageSize.height + kTitleHeight + kHorizontalMargin) * rowIndex;
  
  return CGRectMake(offSetX, offSetY, imageSize.width, imageSize.height + kTitleHeight);
}

- (void)popupAnimation
{
  NSUInteger colCount = 3;
  NSUInteger rowCount = _arrButtons.count / colCount + (_arrButtons.count % colCount > 0 ? 1 : 0);
  for (NSUInteger index = 0; index < _arrButtons.count; index++)
  {
    WDComposeButton *button = _arrButtons[index];
    CGSize imageSize = [button getIconSize];
    button.layer.opacity = 1;
    CGRect frame = [self frameForButtonAtIndex:index];
    NSUInteger rowIndex = index / colCount;
    NSUInteger columnIndex = index % colCount;
    CGPoint fromPosition = CGPointMake(frame.origin.x + imageSize.width / 2.0, frame.origin.y + (rowCount - rowIndex + 2) * 200 + (imageSize.height + kTitleHeight) / 2.0);
    
    CGPoint toPosition = CGPointMake(frame.origin.x + imageSize.width / 2.0, frame.origin.y + (imageSize.height + kTitleHeight) / 2.0);
    
    double delayInSeconds = rowIndex * colCount * kAnimationTime;
    if (columnIndex == 0)
    {
      delayInSeconds += kAnimationTime;
    }
    else if(columnIndex == 1)
    {
      delayInSeconds += kAnimationTime * 2;
    }
    else
    {
      delayInSeconds += kAnimationTime * 3;
    }
    
    CABasicAnimation *positionAnimation;
    
    positionAnimation = [CABasicAnimation animationWithKeyPath:@"position"];
    positionAnimation.fromValue = [NSValue valueWithCGPoint:fromPosition];
    positionAnimation.toValue = [NSValue valueWithCGPoint:toPosition];
    positionAnimation.timingFunction = [CAMediaTimingFunction functionWithControlPoints:0.45f :1.2f :0.75f :1.0f];
    positionAnimation.duration = kAnimationTime;
    positionAnimation.beginTime = [button.layer convertTime:CACurrentMediaTime() fromLayer:nil] + delayInSeconds;
    [positionAnimation setValue:[NSNumber numberWithUnsignedInteger:index] forKey:@"popupAnimation"];
//    positionAnimation.delegate = self;
    
    [button.layer addAnimation:positionAnimation forKey:@"popupAnimation"];
  }
}

- (void)addButtons:(NSString *)title image:(UIImage *)image
{
  WDComposeButton *btn = [[WDComposeButton alloc] initWithTitle:title icon:image];
  [self.view addSubview:btn];
  [btn addTarget:self action:@selector(buttonTapped:) forControlEvents:UIControlEventTouchUpInside];
  [self.arrButtons addObject:btn];
}

- (void)buttonTapped:(UIButton *)sender
{
  MyLog(@"ideaEvent");
}

- (void)dispearClick:(UIButton *)sender
{
  if (_navController)
  {
    [UIView animateWithDuration:0.3f
                     animations:^{
                       CGAffineTransform transform = CGAffineTransformIdentity;
                       _addImage.transform = CGAffineTransformRotate(transform, -45.0f * M_PI / 180.0f);
                     }
                     completion:^(BOOL finished) {
                       [_navController dismissViewControllerAnimated:NO completion:nil];
                     }];
  }
}

- (void)addButton
{
  CGSize screenSize = [UIScreen mainScreen].bounds.size;
  UIButton *btn = [[UIButton alloc] initWithFrame:CGRectMake(0, screenSize.height - 44, screenSize.width, 44)];
  [self.view addSubview:btn];
  btn.backgroundColor = [UIColor redColor];
}

@end
