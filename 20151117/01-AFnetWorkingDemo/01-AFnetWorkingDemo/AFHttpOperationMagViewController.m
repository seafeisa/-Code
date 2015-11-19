//
//  AFHttpOperationMagViewController.m
//  01-AFnetWorkingDemo
//
//  Created by qingyun on 15/11/17.
//  Copyright (c) 2015年 hnqingyun. All rights reserved.
//

#import "AFHttpOperationMagViewController.h"
#import "AFNetworking.h"

#define baseUrl @"http://afnetworking.sinaapp.com"
@interface AFHttpOperationMagViewController ()

@end

@implementation AFHttpOperationMagViewController
- (IBAction)getAction:(id)sender {
 //url
    NSString *url=[baseUrl stringByAppendingPathComponent:@"request_get.json"];
 //创建 AFHTTPRequestOperationManager
    AFHTTPRequestOperationManager *manger=[AFHTTPRequestOperationManager manager];
  //执行网络请求
    NSDictionary *dic=@{@"foo":@"bar"};
    
    [manger GET:url parameters:dic success:^void(AFHTTPRequestOperation *Operation , id objc) {
        NSLog(@"===%@====%@",objc,Operation.response.allHeaderFields);
        
    } failure:^void(AFHTTPRequestOperation * Operation, NSError * error) {
        NSLog(@"=====%@",error);
    }];
}
- (IBAction)postAction:(id)sender {
  //创建url
    NSString *url=[baseUrl stringByAppendingPathComponent:@"request_post_body_json.json"];
  //创建manger
    AFHTTPRequestOperationManager *manger=[AFHTTPRequestOperationManager manager];
    //设置请求序列化 json序列化，将参数转化成json格式
    manger.requestSerializer=[AFJSONRequestSerializer serializer];
  //post请求
    NSDictionary *parmers=@{@"foo":@"bar"};
  //@"foo=bar";
  //@““foo”：“bar””
    
   [manger POST:url parameters:parmers success:^ void(AFHTTPRequestOperation * operation, id objc) {
       NSLog(@"======%@",objc);
   } failure:^void(AFHTTPRequestOperation * operation, NSError * error) {
       NSLog(@"=======%@",error);
   }];
}
- (IBAction)postMuPartAction:(id)sender{
  //url 上传的路径
    NSString *url=[baseUrl stringByAppendingPathComponent:@"upload2server.json"];
   //创建manger
    AFHTTPRequestOperationManager *manger=[AFHTTPRequestOperationManager manager];
   
    //上传
    NSURL *fileURL=[[NSBundle mainBundle]URLForResource:@"1" withExtension:@"jpg" ];
    [manger POST:url parameters:nil constructingBodyWithBlock:^void(id<AFMultipartFormData> formData) {
   //追加数据
        NSError *error;
        if (![formData appendPartWithFileURL:fileURL name:@"image" fileName:@"15081.jpg" mimeType:@"image/jpeg" error:&error]) {
            NSLog(@"======%@",error);
        }
        
    } success:^ void(AFHTTPRequestOperation * operation, id objc) {
        NSLog(@"======%@",objc);
    } failure:^void(AFHTTPRequestOperation * operation, NSError * error) {
        NSLog(@"=======%@",error);
    }];
    
    
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
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
