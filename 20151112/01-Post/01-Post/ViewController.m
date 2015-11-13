//
//  ViewController.m
//  01-Post
//
//  Created by qingyun on 15/11/12.
//  Copyright (c) 2015年 hnqingyun. All rights reserved.
//

#import "ViewController.h"
#define baseURL @"http://web.you07.com/zhanhui/zhanhui/zhtDengji?"
@interface ViewController ()
@end

@implementation ViewController


-(void)clickBtn{
  //1创建ulr
    NSURL *url=[NSURL URLWithString:baseURL];
    
  //2创建request
    NSMutableURLRequest *request=[NSMutableURLRequest requestWithURL:url cachePolicy:NSURLRequestUseProtocolCachePolicy timeoutInterval:10];
    //2.1 设置method
    
    // [NSString stringWithFormat:@"name=%@&phone=%@&model=%@",self.userName,self.content,self.desc];
    
      request.HTTPMethod=@"POST";
    
    //2.2 body 参数
      NSString *bodyStr=@"name=mars&phone=13790098084&model=0";
      NSData *bodyData=[bodyStr dataUsingEncoding:NSUTF8StringEncoding];
      request.HTTPBody=bodyData;
    
    //2.3 设置请求头
    [request setValue:[NSString stringWithFormat:@"%ld",bodyData.length] forHTTPHeaderField:@"Content-Length"];
    
    
    //3创建链接
    NSHTTPURLResponse *response;
    NSError *error;
    
    NSData*data=[NSURLConnection sendSynchronousRequest:request returningResponse:  &response error:&error];
    if (error) {

        NSLog(@"=======%@",error);
    }
    if (response.statusCode==200) {
        NSLog(@"=======%@",[[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding]);
    }
}

-(void)addsubBtn{
    UIButton *btn=[UIButton buttonWithType:UIButtonTypeCustom];
    btn.backgroundColor=[UIColor blueColor];
    btn.frame=CGRectMake(100, 100, 100, 40);
    [btn setTitle:@"Post" forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(clickBtn) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];

}

- (void)viewDidLoad {
    [self addsubBtn];
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
