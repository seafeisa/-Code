//
//  ViewController.m
//  03-NSURLSessionDemo3
//
//  Created by qingyun on 15/11/27.
//  Copyright (c) 2015年 hnqingyun. All rights reserved.
//

#import "ViewController.h"

#define kDownloadURLStr @"http://cdn.tutsplus.com/mobile/uploads/2014/01/5a3f1-sample.jpg"

@interface ViewController () <NSURLSessionDelegate, NSURLSessionDownloadDelegate>
@property (weak, nonatomic) IBOutlet UIProgressView *progressView;
@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@property (weak, nonatomic) IBOutlet UIButton *cancelBtn;
@property (weak, nonatomic) IBOutlet UIButton *resumeBtn;

@property (nonatomic, strong) NSURLSession *session;
@property (nonatomic, strong) NSURLSessionDownloadTask *downloadTask;

@property (nonatomic, strong) NSData *resumeData;
@end

@implementation ViewController

- (NSURLSession *)session
{
    if (_session == nil) {
        NSURLSessionConfiguration *sessionConfig = [NSURLSessionConfiguration defaultSessionConfiguration];
        _session = [NSURLSession sessionWithConfiguration:sessionConfig delegate:self delegateQueue:nil];
    }
    return _session;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self addObserver:self forKeyPath:@"resumeData" options:NSKeyValueObservingOptionNew context:NULL];
    
    [self addObserver:self forKeyPath:@"downloadTask" options:NSKeyValueObservingOptionNew context:NULL];
    
    // 1. 创建下载任务
    self.downloadTask = [self.session downloadTaskWithURL:[NSURL URLWithString:kDownloadURLStr]];
    
    // 2. 启动下载任务
    [self.downloadTask resume];
}

#pragma mark - session delegate
- (void)URLSession:(NSURLSession *)session downloadTask:(NSURLSessionDownloadTask *)downloadTask
didFinishDownloadingToURL:(NSURL *)location {
    NSData *data = [NSData dataWithContentsOfURL:location];
    UIImage *image = [UIImage imageWithData:data];
    
    dispatch_async(dispatch_get_main_queue(), ^{
        // 更新图片
        _imageView.image = image;
        _cancelBtn.hidden = YES;
        _resumeBtn.hidden = YES;
        _progressView.hidden = YES;
    });
    
    // 销毁session
    [self.session invalidateAndCancel];
}

- (void)URLSession:(NSURLSession *)session downloadTask:(NSURLSessionDownloadTask *)downloadTask
      didWriteData:(int64_t)bytesWritten
 totalBytesWritten:(int64_t)totalBytesWritten
totalBytesExpectedToWrite:(int64_t)totalBytesExpectedToWrite {
    
    float progress = (double)totalBytesWritten / (double)totalBytesExpectedToWrite;
    
    dispatch_async(dispatch_get_main_queue(), ^{
        _progressView.progress = progress;
    });
}
- (IBAction)cancel:(id)sender {
    // 下载任务存在，才有取消的必要
    if (!self.downloadTask) {
        return;
    }
    
    self.cancelBtn.hidden = YES;
    
    // 取消下载任务，并保存已经下载的数据
    [self.downloadTask cancelByProducingResumeData:^(NSData *resumeData) {
        if (!resumeData) {
            return;
        }
        self.resumeData = resumeData;
        self.downloadTask = nil;
    }];
}

- (IBAction)resume:(id)sender {
    // 已经有下载的数据，采用继续下载的必要
    if (!self.resumeData) {
        return;
    }
    
    self.resumeBtn.hidden = YES;
    
    // 根据已经保存的数据，重新创建下载任务
    self.downloadTask = [self.session downloadTaskWithResumeData:self.resumeData];
    
    // 重新开始下载任务
    [self.downloadTask resume];
    
    // 清空已经保存的下载数据
    self.resumeData = nil;
}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context {
    if ([keyPath isEqualToString:@"resumeData"]) {
        dispatch_async(dispatch_get_main_queue(), ^{
            _resumeBtn.hidden = (self.resumeData == nil);
        });
    } else if ([keyPath isEqualToString:@"downloadTask"]) {
        dispatch_async(dispatch_get_main_queue(), ^{
            _cancelBtn.hidden = (self.downloadTask == nil);
        });

    } else {
        NSLog(@"It will not go here!");
    }
}


@end
