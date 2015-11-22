//
//  HttpSeesionMagViewController.m
//  01-AFnetWorkingDemo
//
//  Created by qingyun on 15/11/19.
//  Copyright (c) 2015年 hnqingyun. All rights reserved.
//

#import "HttpSeesionMagViewController.h"
#import "AFNetworking.h"
#define  baseurl @"http://afnetworking.sinaapp.com"
@interface HttpSeesionMagViewController ()

@end

@implementation HttpSeesionMagViewController

- (IBAction)getAction:(id)sender {
    NSString *url=[baseurl stringByAppendingPathComponent:@"request_get.json"];
    NSString *url1=[NSString stringWithFormat:@"%@/%@",baseurl,@"request_get.json"];
    NSLog(@"=====>%@",url);
    NSLog(@"=====>%@",url1);
    
    // AFHTTPSessionManager 对象
    AFHTTPSessionManager *manger=[AFHTTPSessionManager manager];
    //2Get请求
    NSDictionary *parmers=@{@"foo":@"bar"};
    [manger GET:url1 parameters:parmers success:^void(NSURLSessionDataTask * task, id objc) {
        NSLog(@"=====obj=====%@",objc);
    } failure:^void(NSURLSessionDataTask * task, NSError * error) {
        NSLog(@"=====%@",error);
    }];
}


- (IBAction)postAction:(id)sender {
   //1ulr
    NSString *url=[baseurl stringByAppendingPathComponent:@"request_post_body_http.json"];
    
    AFHTTPSessionManager *manger=[AFHTTPSessionManager manager];
   //设置http请求序列化
    //manger.requestSerializer=[AFHTTPRequestSerializer serializer];
    
    //post请求
    NSDictionary *parmer=@{@"foo":@"bar"};
   [manger POST:url parameters:parmer success:^void(NSURLSessionDataTask * task, id objc) {
       NSLog(@"========>%@",objc);
   } failure:^ void(NSURLSessionDataTask * task, NSError * error) {
       NSLog(@"=====%@",error);
       
   }];
}
- (IBAction)PostMultAction:(id)sender {
   //1url 上传文件路径
    NSString *url=[baseurl stringByAppendingPathComponent:@"upload2server.json"];
    
   //2manger
    AFHTTPSessionManager *manger=[AFHTTPSessionManager manager];
   //3POST-mutl-part
    [manger POST:url parameters:nil constructingBodyWithBlock:^void(id<AFMultipartFormData> formData) {
        [formData appendPartWithFileURL:[[NSBundle mainBundle]URLForResource:@"1" withExtension:@"jpg"] name:@"image" fileName:@"new11.jpg" mimeType:@"image/jpeg" error:nil];
        [formData appendPartWithFileURL:[[NSBundle mainBundle]URLForResource:@"1" withExtension:@"jpg"] name:@"image" fileName:@"new22.jpg" mimeType:@"image/jpeg" error:nil];
        
    } success:^void(NSURLSessionDataTask * task, id objc){
        NSLog(@"====%@",objc);
    } failure:^void(NSURLSessionDataTask * task, NSError * error) {
        NSLog(@"======%@",error);
        
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
