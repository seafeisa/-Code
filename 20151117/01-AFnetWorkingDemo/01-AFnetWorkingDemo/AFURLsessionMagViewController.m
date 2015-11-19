//
//  AFURLsessionMagViewController.m
//  01-AFnetWorkingDemo
//
//  Created by qingyun on 15/11/17.
//  Copyright (c) 2015年 hnqingyun. All rights reserved.
//

#import "AFURLsessionMagViewController.h"
#import "AFNetworking.h"
#define musicURL @"http://115.231.171.33/file3.data.weipan.cn/31680808/6ced492d7524b3f841eefff55c5b6782a3d549a4?ip=1447753286,171.15.162.18&ssig=0IFWBX8mw%2B&Expires=1447755076&KID=sae,l30zoo1wmz&fn=Someone%20like%20you-V.mp3&skiprd=2&se_ip_debug=171.15.162.18&corp=2&from=1221134&wsiphost=local"
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
        return[NSURL fileURLWithPath:[NSString stringWithFormat:@"/Users/guofudiyi/Desktop/%@",response.suggestedFilename]];
    } completionHandler:^void(NSURLResponse * response, NSURL * filePath, NSError * error) {
        NSLog(@"filepath=%@",filePath.absoluteString);

    }];
    //kvo
    [progress addObserver:self forKeyPath:@"completedUnitCount" options:(NSKeyValueObservingOptionNew) context:NULL];
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
            _downProgress.progress=progreValue;
        });
        
    }

}


- (IBAction)upLoadAction:(id)sender {
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
