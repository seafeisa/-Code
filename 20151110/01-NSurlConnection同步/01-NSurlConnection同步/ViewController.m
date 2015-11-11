//
//  ViewController.m
//  01-NSurlConnection同步
//
//  Created by qingyun on 15/11/10.
//  Copyright (c) 2015年 hnqingyun. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (IBAction)clickRequest:(id)sender {
  //1创建NSURL  （网址）
    NSURL *URL=[NSURL URLWithString:@"http://www.baidu.com"];
    
  //2创建request（请求）
    NSURLRequest *request=[NSURLRequest requestWithURL:URL];
    
    NSURLResponse *response;
    NSError *error;
   //3创建同步连接  （链接）
   NSData *data=[NSURLConnection sendSynchronousRequest:request returningResponse:&response error:&error];
    if (error) {
        NSLog(@"======>>%@",error);
    }
    
    // 响应
    NSHTTPURLResponse *httpResponse=(NSHTTPURLResponse *)response;
    if (httpResponse.statusCode==200) {
        NSString *str=[[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
        NSLog(@"======>>>%@",str);
        if (![str writeToFile:@"/Users/guofudiyi/Desktop/baidu.html" atomically:YES encoding:NSUTF8StringEncoding error:&error]) {
            NSLog(@"=====%@",error);
            
        }
        
    }
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
