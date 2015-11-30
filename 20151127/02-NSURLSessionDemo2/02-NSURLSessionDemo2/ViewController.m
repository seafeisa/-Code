//
//  ViewController.m
//  02-NSURLSessionDemo2
//
//  Created by qingyun on 15/11/27.
//  Copyright (c) 2015年 hnqingyun. All rights reserved.
//

#import "ViewController.h"

#define kDownloadURLStr @"http://cdn.tutsplus.com/mobile/uploads/2014/01/5a3f1-sample.jpg"

@interface ViewController () <NSURLSessionDelegate, NSURLSessionDownloadDelegate>
@property (weak, nonatomic) IBOutlet UIProgressView *progressView;
@property (weak, nonatomic) IBOutlet UIImageView *imageView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSURLSessionConfiguration *SessionConfig = [NSURLSessionConfiguration defaultSessionConfiguration];
    NSURLSession *session = [NSURLSession sessionWithConfiguration:SessionConfig delegate:self delegateQueue:nil];

    NSURLSessionDownloadTask *downloadTask = [session downloadTaskWithURL:[NSURL URLWithString:kDownloadURLStr]];
    
    [downloadTask resume];
}

#pragma mark - NSURLSession delegate
// 下载完成之后的处理方法
- (void)URLSession:(NSURLSession *)session downloadTask:(NSURLSessionDownloadTask *)downloadTask
didFinishDownloadingToURL:(NSURL *)location {
    NSData *data = [NSData dataWithContentsOfURL:location];
    UIImage *image = [UIImage imageWithData:data];
    
    NSLog(@"%@", location);
    // 主线程更新UI (更新图片、隐藏进度条)
    dispatch_async(dispatch_get_main_queue(), ^{
        _imageView.image = image;
        _progressView.hidden = YES;
    });
}

// 可以计算进度的委托方法
- (void)URLSession:(NSURLSession *)session downloadTask:(NSURLSessionDownloadTask *)downloadTask
      didWriteData:(int64_t)bytesWritten
 totalBytesWritten:(int64_t)totalBytesWritten
totalBytesExpectedToWrite:(int64_t)totalBytesExpectedToWrite {
    
    float progress = (double)totalBytesWritten / (double)totalBytesExpectedToWrite;
    NSLog(@"progress:%.2f", progress);
    // 主线程更新UI
    dispatch_async(dispatch_get_main_queue(), ^{
        _progressView.progress = progress;
    });
}

@end
