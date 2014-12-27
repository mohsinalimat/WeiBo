//
//  WDHomeController.m
//  WeiBo
//
//  Created by chenjiang on 14-12-10.
//  Copyright (c) 2014年 wind. All rights reserved.
//

#import "WDHomeController.h"
#import "UIBarButtonItem+WD.h"
#import "WDMacro.h"
#import "MJRefresh.h"
#import "WDHomeStatusCellFrame.h"
#import "WDStatusTool.h"
#import "WDHomeStatusCell.h"
#import "WDNickNameButton.h"
#import "WDStatusDetailController.h"
#import "SGPopSelectView.h"
#import "WDPopBackgroundView.h"
#import "WDPopViewController.h"
#import "WDBaseTabBarController.h"
#import "WDStatusViewCell.h"

@interface WDHomeController ()<MJRefreshBaseViewDelegate, UIGestureRecognizerDelegate,
                               UITableViewDataSource, UITableViewDelegate>
{
  MJRefreshBaseView *_head;
  NSMutableArray    *_statusFrameArray;
  SGPopSelectView   *_popView;
}

@property(nonatomic, strong) UITableView *tableView;

@end

@implementation WDHomeController

- (instancetype)init
{
  if (self = [super init])
  {
    MJRefreshHeaderView *head = [MJRefreshHeaderView header];
    head.scrollView = self.tableView;
    head.delegate = self;
    _head = head;
    
    MJRefreshFooterView *foot = [MJRefreshFooterView footer];
    foot.scrollView = self.tableView;
    foot.delegate = self;
  }
  return self;
}

- (UITableView *)tableView
{
  if (!_tableView)
  {
    _tableView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStylePlain];
  }
  return _tableView;
}

- (void)viewDidLoad
{
  [super viewDidLoad];
  
  [self.view addSubview:self.tableView];
  CGSize viewSize = self.view.bounds.size;
  _tableView.delegate = self;
  _tableView.dataSource = self;
  _tableView.frame = CGRectMake(0, 0, viewSize.width, viewSize.height - self.navigationController.navigationBar.frame.size.height);
  self.tableView.separatorStyle = UITableViewCellSelectionStyleNone;
  _statusFrameArray = [[NSMutableArray alloc] init];
  
  self.view.backgroundColor = kBGColor;
  
  [self refresh];
  
  self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithImageName:@"navigationbar_friendsearch" highLightImageName:@"navigationbar_friendsearch_highlighted" addTarget:self action:@selector(leftButtonClick) forContolEvents:UIControlEventTouchUpInside];
  self.navigationItem.rightBarButtonItem = [UIBarButtonItem barButtonItemWithImageName:@"navigationbar_pop" highLightImageName:@"navigationbar_pop_highlighted" addTarget:self action:@selector(rightButtonClick)];
}

- (void)rightButtonClick
{
  
}

- (void)leftButtonClick
{
  [self.navigationController pushViewController:[[WDStatusDetailController alloc] init] animated:YES];
}

- (void)refresh
{
  [_head beginRefreshing];
}

- (void)refreshViewBeginRefreshing:(MJRefreshBaseView *)refreshView
{
  if ([refreshView isKindOfClass:[MJRefreshHeaderView class]])
  {
    [self loadNewStatus:refreshView];
  }
  else
  {
    [self loadMoreStatus:refreshView];
  }
}

- (void)loadNewStatus:(MJRefreshBaseView *)refreshView
{
  WDHomeStatusCellFrame *tempStatus = [_statusFrameArray firstObject];
  long long firstStatusID = tempStatus.dataModel.ID;
  
  [WDStatusTool statusToolGetStatusWithSinceID:firstStatusID
                                         maxID:0
                                        Sucess:^(NSArray *array) {
                                            
                                          NSArray *newFrame = [self statusFrameFromStatusArray:array];
                                          [_statusFrameArray insertObjects:newFrame atIndexes:[NSIndexSet indexSetWithIndexesInRange:NSMakeRange(0, newFrame.count)]];
                                          [self.tableView reloadData];
                                          [refreshView endRefreshing];
                                          
                                          [self showNewStatusMessage:newFrame.count];
                                        } failure:^(NSError *error) {
                                          
                                        }];
}


- (void)loadMoreStatus:(MJRefreshBaseView *)refreshView
{
  WDHomeStatusCellFrame *tempStatus = [_statusFrameArray objectAtIndex:_statusFrameArray.count - 1];
  long long lastStatusID = tempStatus.dataModel.ID;
  
  [WDStatusTool statusToolGetStatusWithSinceID:0
                                         maxID:lastStatusID - 1
                                        Sucess:^(NSArray *array) {
                                          
                                          NSArray *newFrame = [self statusFrameFromStatusArray:array];
                                          [_statusFrameArray addObjectsFromArray:newFrame];
                                          [self.tableView reloadData];
                                          [refreshView endRefreshing];
                                        }
                                       failure:^(NSError *error) {
                                         
                                       }];
}

- (void)showNewStatusMessage:(NSInteger)count
{
  if (count)
  {
    UIButton *msgButton = [UIButton buttonWithType:UIButtonTypeCustom];
    msgButton.enabled = NO;
    msgButton.adjustsImageWhenDisabled = NO;
    NSString *title = [NSString stringWithFormat:@"%ld 条微博", (long)count];
    msgButton.titleLabel.font = [UIFont systemFontOfSize:14];
    [msgButton setTitle:title forState:UIControlStateNormal];
    [msgButton setBackgroundImage:[UIImage imageNamed:@"timeline_new_status_background"] forState:UIControlStateNormal];
    [self.navigationController.view insertSubview:msgButton belowSubview:self.navigationController.navigationBar];
    
    CGFloat height = 44;
    CGFloat y = self.navigationController.navigationBar.frame.origin.y;
    msgButton.frame = CGRectMake(0, y, self.view.frame.size.width, height);
    msgButton.alpha = 1.0;
    
    [UIView animateWithDuration:1
                     animations:^{
                       
                       msgButton.alpha = 0.9;
                       msgButton.transform = CGAffineTransformTranslate(msgButton.transform, 0, height);
                       
                     }
                     completion:^(BOOL finished) {

                       [UIView animateWithDuration:1.0
                                             delay:1.5
                                           options:UIViewAnimationOptionCurveEaseOut
                                        animations:^{
                                          msgButton.transform = CGAffineTransformTranslate(msgButton.transform, 0, -height);
                                          msgButton.alpha = 0;
                                        }
                                        completion:^(BOOL finished) {
                                          [msgButton removeFromSuperview];
                                        }];
                       
                     }];
  }
}

- (NSArray *)statusFrameFromStatusArray:(NSArray *)statusArray
{
  NSMutableArray *statusFrameArray = [NSMutableArray array];
  for(WDStatus *status in statusArray)
  {
    WDHomeStatusCellFrame *statusCellFrame = [[WDHomeStatusCellFrame alloc] init];
    statusCellFrame.dataModel = status;
    [statusFrameArray addObject:statusCellFrame];
  }
  return statusFrameArray;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
  return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
  return _statusFrameArray.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
  return [_statusFrameArray[indexPath.row] cellHeight] + kCellMargins * 4;
}

- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
  WDHomeStatusCell *cell = [tableView dequeueReusableCellWithIdentifier:[WDHomeStatusCell ID]];
//  WDStatusViewCell *cell = [_tableView dequeueReusableCellWithIdentifier:[WDStatusViewCell ID]];
  if (cell == nil)
  {
    cell = [[WDHomeStatusCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:[WDHomeStatusCell ID]];
//    cell = [[WDStatusViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:[WDStatusViewCell ID]];
  }
  
  cell.cellFrame = _statusFrameArray[indexPath.row];
  
  return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
  [self.navigationController pushViewController:[[WDStatusDetailController alloc] init] animated:YES];
}

@end
