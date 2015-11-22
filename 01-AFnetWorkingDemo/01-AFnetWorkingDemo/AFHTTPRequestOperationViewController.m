//
//  AFHTTPRequestOperationViewController.m
//  01-AFnetWorkingDemo
//
//  Created by qingyun on 15/11/17.
//  Copyright (c) 2015年 hnqingyun. All rights reserved.
//

#import "AFHTTPRequestOperationViewController.h"
#import "AFNetworking.h"

@interface AFHTTPRequestOperationViewController ()

@end

@implementation AFHTTPRequestOperationViewController

-(void)clickGetAction{
//创建url
  NSString *urlStr=@"http://afnetworking.sinaapp.com/response.json";
  NSURL *url=[NSURL URLWithString:urlStr];
//创建request
    NSURLRequest *request=[NSURLRequest requestWithURL:url];
   //创建AFHTTPRequestOperation 对象
    AFHTTPRequestOperation  *op=[[AFHTTPRequestOperation alloc] initWithRequest:request];
  //执行op 设置响应序列化
//op.responseSerializer=[AFJSONResponseSerializer serializer];
    
    [op setCompletionBlockWithSuccess:^(AFHTTPRequestOperation *operation, id objc) {
        NSLog(@"=======%@",[[NSString alloc] initWithData:objc encoding:NSUTF8StringEncoding]);
    } failure:^(AFHTTPRequestOperation * operation, NSError * error) {
        NSLog(@"======%@",error);
    }];
    [[NSOperationQueue mainQueue] addOperation:op];
    
}

- (void)viewDidLoad {
    UIButton *btn=[UIButton  buttonWithType:UIButtonTypeCustom];
    btn.frame=CGRectMake(100, 100, 100, 40);
    [btn setBackgroundColor:[UIColor blueColor]];
    [btn setTitle:@"Get" forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(clickGetAction) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
    [super viewDidLoad];
    // Do any additional setup after loading the view.
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
