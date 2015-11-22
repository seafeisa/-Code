//
//  AFURLsessionMagViewController.m
//  01-AFnetWorkingDemo
//
//  Created by qingyun on 15/11/17.
//  Copyright (c) 2015年 hnqingyun. All rights reserved.
//

#import "AFURLsessionMagViewController.h"
#import "AFNetworking.h"
#define musicURL @"http://dlsw.baidu.com/sw-search-sp/soft/b8/25870/Wireshark1.10.6Intel64.1396001840.dmg"

#define upLoadURL @"http://afnetworking.sinaapp.com/upload2server.json"

@interface AFURLsessionMagViewController ()
@property (weak, nonatomic) IBOutlet UIProgressView *downProgress;
@property (weak, nonatomic) IBOutlet UIProgressView *upLoadProgress;

@end

@implementation AFURLsessionMagViewController
- (IBAction)downAction:(id)sender {
   //创建配置文件
    NSURLSessionConfiguration *config=[NSURLSessionConfiguration defaultSessionConfiguration];
   //AFURLSessionManager 管理者
    AFURLSessionManager *manger=[[AFURLSessionManager alloc] initWithSessionConfiguration:config];
   
    //下载任务
    NSURLRequest *request=[NSURLRequest requestWithURL:[NSURL URLWithString:musicURL]];

    NSProgress *progress;
    NSURLSessionDownloadTask *task=[manger downloadTaskWithRequest:request progress:&progress destination:^ NSURL *(NSURL *targetUrl, NSURLResponse * response) {
        //返回最终的文件存储路径
        //文件路径
        return[NSURL fileURLWithPath:[NSString stringWithFormat:@"/Users/qingyun/Desktop/%@",response.suggestedFilename]];
    } completionHandler:^void(NSURLResponse * response, NSURL * filePath, NSError * error) {
        NSLog(@"filepath=%@",filePath.absoluteString);

    }];
    //kvo
    [progress addObserver:self forKeyPath:@"completedUnitCount" options:(NSKeyValueObservingOptionNew) context:(__bridge void*)(_downProgress)];
    //启动任务
    [task resume];
    
}

-(void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context{
  //判断keyPath
    if([keyPath isEqualToString:@"completedUnitCount"]){
    //取出当前完成的进度
    int64_t completedUnitCount =[change[@"new"] longLongValue];
    NSProgress *progress=(NSProgress *)object;
    int64_t totalCount=progress.totalUnitCount;
    //算比例
        float progreValue=(float)completedUnitCount/(float)totalCount;
    //更新进度条
        dispatch_async(dispatch_get_main_queue(), ^{
            UIProgressView *proger=(__bridge UIProgressView*)(context);
            proger.progress=progreValue;
        });
        
    }

}
- (IBAction)upLoadAction:(id)sender {
  //1创建配置文件
    NSURLSessionConfiguration *config=[NSURLSessionConfiguration defaultSessionConfiguration];
    
  //2创建manger
    AFURLSessionManager *manger=[[AFURLSessionManager alloc] initWithSessionConfiguration:config];
    
  //3上传任务
    
    
//    NSMutableURLRequest *request=[NSMutableURLRequest requestWithURL:[NSURL URLWithString:upLoadURL]];
//    request.HTTPMethod=@"post";
  //通过请求序列化封装请求
    NSURLRequest *request=[[AFHTTPRequestSerializer serializer]multipartFormRequestWithMethod:@"post" URLString:upLoadURL parameters:nil constructingBodyWithBlock:^void(id<AFMultipartFormData> formData) {
        [formData appendPartWithFileURL:[[NSBundle mainBundle] URLForResource:@"2" withExtension:@"jpg"] name:@"image" fileName:@"new1.jpg" mimeType:@"image/jpeg" error:nil];
    } error:nil];
    
    
    NSProgress *progress;
    NSURLSessionUploadTask *Task=[manger uploadTaskWithStreamedRequest:request progress:&progress completionHandler:^void(NSURLResponse * response, id objc, NSError * error) {
        NSLog(@"=====objc====%@",objc);
    }];
    //设置kvo
    [progress addObserver:self forKeyPath:@"completedUnitCount" options:NSKeyValueObservingOptionNew context:(__bridge void*)(_upLoadProgress)];
    [Task resume];
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
