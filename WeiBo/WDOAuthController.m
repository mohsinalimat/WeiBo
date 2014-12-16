//
//  WDOAuthController.m
//  WeiBo
//
//  Created by chenjiang on 14-12-10.
//  Copyright (c) 2014年 wind. All rights reserved.
//

#import "WDOAuthController.h"
#import "WDMacro.h"
#import "WDHttpTool.h"
#import "WDAccountTool.h"
#import "WDAccount.h"
#import "MainController.h"

@interface WDOAuthController ()<UIWebViewDelegate>
{
  UIWebView *_webView;
}

@end

@implementation WDOAuthController

- (void)loadView
{
  _webView = [[UIWebView alloc] initWithFrame:[UIScreen mainScreen].bounds];
  self.view = _webView;
  _webView.delegate = self;
}

- (void)viewDidLoad
{
  [super viewDidLoad];
  NSString *requestURLString = [NSString stringWithFormat:@"%@?client_id=%@&redirect_uri=%@&display=mobile", kOAuthURL, kAppKey, kRedirect_uri];
  NSURL *url = [NSURL URLWithString:requestURLString];
  NSURLRequest *request = [[NSURLRequest alloc] initWithURL:url];
  [_webView loadRequest:request];
}

- (BOOL)webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType
{
  NSString *url = request.URL.absoluteString;
  NSRange range = [url rangeOfString:@"code="];
  if(range.length)
  {
    NSInteger index = range.location + range.length;
    NSString *requestToken = [url substringFromIndex:index];
  
    [self getAccessToken:requestToken];
  }
  return YES;
}

- (void)getAccessToken:(NSString *)requestToken
{
  NSLog(@"%@", requestToken);
  NSDictionary *param = [NSDictionary dictionaryWithObjectsAndKeys:
                         kAppKey, @"client_id",
                         kAppSecret, @"client_secret",
                         @"authorization_code", @"grant_type",
                         requestToken, @"code",
                         kRedirect_uri, @"redirect_uri", nil];

  [WDHttpTool httpToolPostWithBaseUrl:kBaseURL
                                 path:@"oauth2/access_token"
                               params:param
                               sucess:^(id JSON) {
                                 WDAccount *account = [WDAccount accountWithDict:JSON];
                                 [[WDAccountTool sharedAccountTool] saveAccount:account];
                                 
                                 MyLog(@"登陆成功");
                                 
                                 [MBProgressHUD hideHUDForView:self.view animated:YES];
                                 self.view.window.rootViewController = [[MainController alloc] init];
                               }
                              failure:^(NSError *error) {
                                MyLog(@"认证失败....----%@", [error localizedDescription]);
                                [MBProgressHUD hideHUDForView:self.view animated:YES];
                              }
                               method:HttpMethodPost
                          contentType:HttpContentTypeText];
}

- (void)webViewDidStartLoad:(UIWebView *)webView
{
  MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:webView animated:YES];
  hud.labelText = @"登陆中...";
  hud.labelFont = [UIFont systemFontOfSize:14];
}

- (void)webViewDidFinishLoad:(UIWebView *)webView
{
  [MBProgressHUD hideHUDForView:webView animated:YES];
}

@end
