//
//  ViewController.m
//  03-Range
//
//  Created by qingyun on 15/11/10.
//  Copyright (c) 2015年 hnqingyun. All rights reserved.
//

#import "ViewController.h"

#define baseUrl @"6"

@interface ViewController ()<NSURLConnectionDataDelegate>
@property(nonatomic,strong)NSMutableData *data;
@end

@implementation ViewController




CGSize imageAndFeacthData(NSData *data){
  NSLog(@"=====>%@",data);
  
  int w1=0,w2=0,w3=0,w4=0;
  [data getBytes:&w1 range:NSMakeRange(16, 1)];
  [data getBytes:&w2 range:NSMakeRange(17, 1)];
  [data getBytes:&w3 range:NSMakeRange(18, 1)];
  [data getBytes:&w4 range:NSMakeRange(19, 1)];
  int w=(w1<<24)+(w2<<16)+(w3<<8)+w4;
    
  int h1=0,h2=0,h3=0,h4=0;
  [data getBytes:&h1 range:NSMakeRange(20, 1)];
  [data getBytes:&h2 range:NSMakeRange(21, 1)];
  [data getBytes:&h3 range:NSMakeRange(22, 1)];
  [data getBytes:&h4 range:NSMakeRange(23, 1)];
  int h=(h1<<24)+(h2<<16)+(h3<<8)+h4;
    
    
  return CGSizeMake(w,h);
}
#pragma mark 同步


-(void)clickMe:(UIButton *)btn{
    //1 创建url
    NSURL *url=[NSURL URLWithString:baseUrl];
    
    //2创建request
    NSMutableURLRequest *request=[NSMutableURLRequest requestWithURL:url];
   // range  设置请求的range 放在请求头
   //range bytes=start-end;起始位置 结束位置
   //png 16-23 w h
    //[request setValue:@"bytes=16-23" forHTTPHeaderField:@"Range"];
    //3.创建链接同步的
    
    NSHTTPURLResponse *response;
    NSError *error;
    NSData *imageData=[NSURLConnection sendSynchronousRequest:request returningResponse:&response error:&error];
    
    if (response.statusCode==200) {
        [self addImageViewForData:imageData];
    }
  /*
    NSLog(@"=====%@",error);
    NSLog(@"=====imageData===%ld",imageData.length);
        CGSize size=imageAndFeacthData(imageData);
    NSLog(@"=====%@",NSStringFromCGSize(size));
    //}
   */
};

-(void)addImageViewForData:(NSData *)data{
    //图片宽，高度
    CGSize size=imageAndFeacthData(data);
   
    UIImageView *iamgeView=[[UIImageView alloc] initWithFrame:CGRectMake(100, 200, size.width*.5, size.height*.5)];
    //data转成image对象
    iamgeView.image=[UIImage imageWithData:data];
    [self.view addSubview:iamgeView];
}

#pragma mark 异步
-(void)downImage:(UIButton *)btn{
    //1创建url
    NSURL *url=[NSURL URLWithString:baseUrl];
    
    //2.创建request
    NSURLRequest *request=[[NSURLRequest alloc] initWithURL:url cachePolicy:NSURLRequestReloadIgnoringCacheData timeoutInterval:10];
    //3.创建链接
    NSURLConnection *content=[[NSURLConnection alloc] initWithRequest:request delegate:self];
    //4开始链接
    [content start];
}

#pragma mark delegate
- (void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response{
    
    NSHTTPURLResponse *httpResponse=(NSHTTPURLResponse *)response;
    if (httpResponse.statusCode==200) {
       //初始化 mutableData
        _data=[NSMutableData data];
    }
    
}

-(void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data{
    [_data appendData:data];
    
}

-(void)connectionDidFinishLoading:(NSURLConnection *)connection{
    [self addImageViewForData:_data];

}
-(void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error{


}



-(void)addsubBtn{
    UIButton *btn=[UIButton buttonWithType:UIButtonTypeCustom];
    btn.frame=CGRectMake(100, 100, 100, 40);
    btn.backgroundColor=[UIColor blueColor];
    [btn setTitle:@"clickMe" forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(clickMe:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
    
    UIButton *btn1=[UIButton buttonWithType:UIButtonTypeCustom];
    btn1.frame=CGRectMake(100, 160, 100, 40);
    btn1.backgroundColor=[UIColor blueColor];
    [btn1 setTitle:@"异步" forState:UIControlStateNormal];
    [btn1 addTarget:self action:@selector(downImage:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn1];

    
    
    
    

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
