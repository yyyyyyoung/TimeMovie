//
//  WebNewsViewController.m
//  TimeMovie
//
//  Created by mac on 15/8/22.
//  Copyright (c) 2015年 mac. All rights reserved.
//

#import "WebNewsViewController.h"

@interface WebNewsViewController ()

@end

@implementation WebNewsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"网页新闻";
    
    //---------------------UIWebView---------------------
    UIWebView *web = [[UIWebView alloc] initWithFrame:self.view.bounds];
    [self.view addSubview:web];
    

    
    /*
    //---------------------使用UIWebView加载一个网页---------------------
    // URL网络地址
    NSURL *url = [NSURL URLWithString:@"http://www.baidu.com"];
    // 网络请求
    NSURLRequest *request = [[NSURLRequest alloc] initWithURL:url];
    // 使用一个网络请求 来加载网页
    [web loadRequest:request];
     
     */
    
    
    /*
    //---------------------使用HTML字符串加载页面---------------------
    // 1. 读取HTML文件路径
    NSString *filePath = [[NSBundle mainBundle] pathForResource:@"百度一下，你就知道" ofType:@"html"];
    
    // 2. 读取文件数据
    NSString *htmlString = [NSString stringWithContentsOfFile:filePath encoding:NSUTF8StringEncoding error:nil];
    
    // 3. 加载页面
    [web loadHTMLString:htmlString baseURL:nil];
    
    // 页面内容大小自适应
    web.scalesPageToFit = YES;
     */
    
    
    // 1. 读取文件
    // 读取HTML文件路径
    NSString *filePath = [[NSBundle mainBundle] pathForResource:@"news" ofType:@"html"];
    
    // 读取文件数据
    NSString *htmlString = [NSString stringWithContentsOfFile:filePath encoding:NSUTF8StringEncoding error:nil];
    // 读取新闻数据json文件
    NSDictionary *dic = [MovieJSON readJSONFile:@"news_detail"];
    
    // 2. 拼接HTML字符串
    // 读取网页需要使用的相关数据
    NSString *title = dic[@"title"];
    NSString *content = dic[@"content"];
    NSString *time = dic[@"time"];
    NSString *source = dic[@"source"];
    
    htmlString = [NSString stringWithFormat:htmlString, title, content, time, source];
    NSLog(@"%@", htmlString);
    
    // 3. 加载页面
    [web loadHTMLString:htmlString baseURL:nil];
    
    web.scalesPageToFit = YES;
    
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
