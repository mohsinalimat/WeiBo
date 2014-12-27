//
//  WDProfileController.m
//  WeiBo
//
//  Created by chenjiang on 14-12-10.
//  Copyright (c) 2014年 wind. All rights reserved.
//

#import "WDProfileController.h"

@interface WDProfileController()<UITableViewDataSource, UITableViewDelegate>

@property(nonatomic, strong) UITableView *tableView;
@property(nonatomic, strong) NSMutableArray *data;

@end

@implementation WDProfileController

+ (NSArray*)getConfigData
{
  NSMutableArray *sections = [[NSMutableArray alloc] init];
  
}

- (UITableView *)tableView
{
  if (!_tableView)
  {
    _tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStyleGrouped];
  }
  return _tableView;
}

- (void)viewDidLoad
{
  [super viewDidLoad];
  self.view.backgroundColor = [UIColor whiteColor];
  self.title = @"我";
  
  _data = [[NSMutableArray alloc] init];
  
  CGSize viewSize = self.view.frame.size;
  [self.view addSubview:self.tableView];
//  _tableView.backgroundColor = [UIColor redColor];
//  _tableView.frame = CGRectMake(0, 0, <#CGFloat width#>, <#CGFloat height#>)
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
  return 5;
}

//- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
//{
//  
//}

@end
