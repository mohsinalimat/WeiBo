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

@interface WDHomeController ()<MJRefreshBaseViewDelegate>
{
  MJRefreshBaseView *_head;
  NSMutableArray    *_statusFrameArray;
}

@end

@implementation WDHomeController

- (void)viewDidLoad
{
  [super viewDidLoad];
  
  self.tableView.separatorStyle = UITableViewCellSelectionStyleNone;
  _statusFrameArray = [[NSMutableArray alloc] init];
  
  self.view.backgroundColor = kBGColor;
  self.title = @"首页";
  self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithImageName:@"navigationbar_friendsearch" highLightImageName:@"navigationbar_friendsearch_highlighted" addTarget:self action:@selector(leftButtonClick) forContolEvents:UIControlEventTouchUpInside];
  self.navigationItem.rightBarButtonItem = [UIBarButtonItem barButtonItemWithImageName:@"navigationbar_pop" highLightImageName:@"navigationbar_pop_highlighted" addTarget:self action:@selector(rightButtonClick)];
  
  MJRefreshHeaderView *head = [MJRefreshHeaderView header];
  head.scrollView = self.tableView;
  head.delegate = self;
  _head = head;
  
  MJRefreshFooterView *foot = [MJRefreshFooterView footer];
  foot.scrollView = self.tableView;
  foot.delegate = self;
}

- (void)rightButtonClick
{
  
}

- (void)leftButtonClick
{
  
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

- (void)showNewStatusMessage:(NSInteger)count
{
  if (count)
  {
    UIButton *msgButton = [UIButton buttonWithType:UIButtonTypeCustom];
    msgButton.enabled = NO;
    msgButton.adjustsImageWhenDisabled = NO;
    NSString *title = [NSString stringWithFormat:@"%ld 条微博", count];
    msgButton.titleLabel.font = [UIFont systemFontOfSize:14];
    [msgButton setTitle:title forState:UIControlStateNormal];
    [msgButton setBackgroundImage:[UIImage imageNamed:@"timeline_new_status_background"] forState:UIControlStateNormal];
    [self.navigationController.view insertSubview:msgButton belowSubview:self.navigationController.navigationBar];
    
    CGFloat height = 44;
    CGFloat y = self.navigationController.navigationBar.frame.origin.y;
    msgButton.frame = CGRectMake(0, y, self.view.frame.size.width, height);
    msgButton.alpha = 1.0;
    
    [UIView animateWithDuration:0.5
                     animations:^{
                       
                       msgButton.alpha = 0.9;
                       msgButton.transform = CGAffineTransformTranslate(msgButton.transform, 0, height);
                       
                     }
                     completion:^(BOOL finished) {
                       
                       [msgButton removeFromSuperview];
                       
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

- (void)loadMoreStatus:(MJRefreshBaseView *)refreshView
{
  
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
    return [_statusFrameArray[indexPath.row] cellHeight];
}

- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return nil;
}

@end
