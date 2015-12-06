//
//  ViewController.m
//  断点续传
//
//  Created by qingyun on 15/12/1.
//  Copyright (c) 2015年 qingyun.com. All rights reserved.
//

#import "ViewController.h"
#define kDownloadURLStr @"http://cdn.tutsplus.com/mobile/uploads/2014/01/5a3f1-sample.jpg"
@interface ViewController ()<NSURLSessionDelegate,NSURLSessionDownloadDelegate>
@property (weak, nonatomic) IBOutlet UIProgressView *progress;
@property (weak, nonatomic) IBOutlet UIButton *cancelBtn;
@property (weak, nonatomic) IBOutlet UIButton *starBtn;
@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@property(nonatomic,strong) NSURLSession *session;
@property(nonatomic,strong) NSURLSessionDownloadTask *downloadTask;
@property(nonatomic,strong) NSData *data;
@end

@implementation ViewController

-(NSURLSession *)session
{
    if (_session == nil) {
        NSURLSessionConfiguration *configuration = [NSURLSessionConfiguration defaultSessionConfiguration];
        _session = [NSURLSession sessionWithConfiguration:configuration delegate:self delegateQueue:nil];
    }
    return _session;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    [self addObserver:self forKeyPath:@"downloadTask" options: NSKeyValueObservingOptionNew context:NULL];
    [self addObserver:self forKeyPath:@"data" options:NSKeyValueObservingOptionNew context:NULL];
    self.downloadTask = [self.session downloadTaskWithURL:[NSURL URLWithString:kDownloadURLStr]];
    [self.downloadTask resume];
    
}
-(void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context
{
    if ([keyPath isEqualToString:@"downloadTask"]) {
        dispatch_async(dispatch_get_main_queue(), ^{
            _cancelBtn.hidden = (self.downloadTask == nil);
        });
    }else if([keyPath isEqualToString:@"data"]){
        dispatch_async(dispatch_get_main_queue(), ^{
            _starBtn.hidden = (self.data == nil);
        });
    }else{
        NSLog(@"ti will not go here!");
    }
        
}
//-(void)removeObserver:(NSObject *)observer forKeyPath:(NSString *)keyPath
//{
//    
//}
-(void)dealloc
{
    [self removeObserver:self forKeyPath:@"downloadTask"];
    [self removeObserver:self forKeyPath:@"data"];
}
- (IBAction)cancelBtn:(id)sender {
    if (!self.downloadTask) {
        return;
    }
    self.cancelBtn.hidden = YES;
    
    [self.downloadTask cancelByProducingResumeData:^(NSData *resumeData) {
        if (!resumeData) {
            return ;
        }
        self.data = resumeData;
        self.downloadTask = nil;
    }];
}
- (IBAction)startBtn:(id)sender {
    if (!self.data) {
        return;
    }
    self.starBtn.hidden = YES;
    
    self.downloadTask = [self.session downloadTaskWithResumeData:self.data];
    
    [self.downloadTask resume];
    
    self.data = nil;
}

-(void)URLSession:(NSURLSession *)session downloadTask:(NSURLSessionDownloadTask *)downloadTask didFinishDownloadingToURL:(NSURL *)location
{
    NSData *data = [NSData dataWithContentsOfURL:location];
    UIImage *image = [UIImage imageWithData:data];
    dispatch_async(dispatch_get_main_queue(), ^{
        _imageView.image = image;
        _cancelBtn.hidden = YES;
        _starBtn.hidden = YES;
        _progress.hidden = YES;
    });
    
    [self.session invalidateAndCancel];
}
- (void)URLSession:(NSURLSession *)session downloadTask:(NSURLSessionDownloadTask *)downloadTask
      didWriteData:(int64_t)bytesWritten
 totalBytesWritten:(int64_t)totalBytesWritten
totalBytesExpectedToWrite:(int64_t)totalBytesExpectedToWrite
{
    float proValues = (double)totalBytesWritten / (double)totalBytesExpectedToWrite;
    dispatch_async(dispatch_get_main_queue(), ^{
        _progress.progress = proValues;
    });
}
@end
