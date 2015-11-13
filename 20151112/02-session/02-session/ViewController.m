//
//  ViewController.m
//  02-session
//
//  Created by qingyun on 15/11/12.
//  Copyright (c) 2015年 hnqingyun. All rights reserved.
//

#import "ViewController.h"

#define baseURl @"http://www.weather.com.cn/adat/sk/101180101.html"
#define BaseSong @"http://218.77.2.26/ws.cdn.baidupcs.com/file/793d1de985847d5855a29689dd1f4ec8?bkt=p2-qd-568&xcode=304abe713ce0046129bc04e9100a708a507e49d11a874b4ad796109456bd1356&fid=625766978-250528-973351029273363&time=1447315299&sign=FDTAXGERLBH-DCb740ccc5511e5e8fedcff06b081203-X69Ph8OlVHyCe9OBvza5Ip6fyiY%3D&to=lc&fm=Nan,B,U,ny&sta_dx=3&sta_cs=1221&sta_ft=mp3&sta_ct=7&fm2=Nanjing,B,U,ny&newver=1&newfm=1&secfm=1&flow_ver=3&pkey=1400793d1de985847d5855a29689dd1f4ec83b41f47100000035c501&sl=67371086&expires=8h&rt=sh&r=530593505&mlogid=7321227922486734757&vuk=-&vbdid=2404003493&fin=mp3.mp3&slt=pm&uta=0&rtype=1&iv=0&isw=0&dp-logid=7321227922486734757&dp-callid=0.1.1&wshc_tag=0&wsts_tag=56444764&wsid_tag=7b9556fc&wsiphost=ipdbm"
@interface ViewController ()

@end

@implementation ViewController

-(void)clickLoadTask:(id)sender{
 //1 创建 seesion
  //1 创建配置文件
   NSURLSessionConfiguration *config=[NSURLSessionConfiguration defaultSessionConfiguration];
    
    //2创建session
    NSURLSession *seesion=[NSURLSession sessionWithConfiguration:config];
  
    //3创建加载任务(内存)
    NSURLSessionDataTask * task=[seesion dataTaskWithURL:[NSURL URLWithString:BaseSong] completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
        [data writeToFile:@"/Users/guofudiyi/Desktop/map.mp3" atomically:YES];
        
    }];
    //4启动任务
    [task resume];
}

-(void)clickDownTask:(id)sender{
  
   //1创建session
    NSURLSession *session=[NSURLSession sharedSession];
    //2 创建task 任务
    
     NSURLSessionDownloadTask *task=[session downloadTaskWithURL:[NSURL URLWithString:BaseSong] completionHandler:^(NSURL *location, NSURLResponse *response, NSError *error) {
         NSLog(@"======%@",location.absoluteString);
         
         //文件管理器
         NSFileManager *manger=[NSFileManager defaultManager];
         
         NSString *saveName=response.suggestedFilename;
         
         NSString *dstStr=@"/Users/guofudiyi/Desktop/";

         NSString *filePath=[dstStr stringByAppendingPathComponent:saveName];
         //文件复制
         
//         if (![manger copyItemAtURL:location toURL:[NSURL fileURLWithPath:filePath] error:&error]) {
//             NSLog(@"error===%@",error);
//
//         }
         
         NSString *filesrc=[location.absoluteString substringFromIndex:6];
         
         
         if (![manger copyItemAtPath:filesrc toPath:filePath error:&error]) {
             NSLog(@"error===%@",error);
         };
         
     }];
    //启动任务
    [task resume];
}

-(void)addsubBtn{

    UIButton *btn=[UIButton buttonWithType:UIButtonTypeCustom];
    [btn setBackgroundColor:[UIColor blueColor]];
    btn.frame=CGRectMake(100, 100, 150, 40);
    [btn setTitle:@"dataLoadTask" forState:UIControlStateNormal];
    [btn addTarget:self
            action:@selector(clickLoadTask:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
    

    UIButton *btn1=[UIButton buttonWithType:UIButtonTypeCustom];
    [btn1 setBackgroundColor:[UIColor blueColor]];
    btn1.frame=CGRectMake(100, 160, 150, 40);
    [btn1 setTitle:@"downLoadTask" forState:UIControlStateNormal];
    [btn1 addTarget:self
            action:@selector(clickDownTask:) forControlEvents:UIControlEventTouchUpInside];
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
