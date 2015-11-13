//
//  ViewController.m
//  04-Head
//
//  Created by qingyun on 15/11/10.
//  Copyright (c) 2015年 hnqingyun. All rights reserved.
//

#import "ViewController.h"
#define baseURL @"https://1.na.dl.wireshark.org/osx/Wireshark%201.12.8%20Intel%2064.dmg"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    //创建url
    NSURL *url=[NSURL URLWithString:baseURL];
    
    //2创建request
    NSMutableURLRequest *request=[NSMutableURLRequest requestWithURL:url];
    //2.1 设置method HEAD 请求方式
     request.HTTPMethod=@"head";
    
    //3.创建contenction
    NSHTTPURLResponse *response;
    NSError *error;
    NSData *data=[NSURLConnection sendSynchronousRequest:request returningResponse:&response error:&error];
    if (response.statusCode==200) {
       NSLog(@"=====>%lld", response.expectedContentLength);
        NSLog(@"====>%@",response.MIMEType);
        NSLog(@"=======>%@",response.URL.absoluteString);
        NSLog(@"=========>%@",response.textEncodingName);
        NSLog(@"========>%ld",data.length);
    }
    
    
    
    
    
    
    
    
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
