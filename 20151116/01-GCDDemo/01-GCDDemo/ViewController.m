//
//  ViewController.m
//  01-GCDDemo
//
//  Created by qingyun on 15/11/16.
//  Copyright (c) 2015年 hnqingyun. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController



-(void)dataForLoad{
 //计算数据 耗时操作
  [NSThread sleepForTimeInterval:4];
  NSLog(@"======耗时4s");

}

-(void)requestLoad{
    [NSThread sleepForTimeInterval:5];
    NSLog(@"======网络请求 5s");

}

-(void)updateUI{
    [NSThread sleepForTimeInterval:1];
    NSLog(@"====刷新ui 1s");

}

-(void)downLoadImage{
    [NSThread sleepForTimeInterval:3];
    NSLog(@"下载图片3s");
}
- (IBAction)Async2:(id)sender {
    
    
    //1异步
    //当前时间
    NSDate *date=[NSDate date];
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        //任务耗时操作 3s
        [self downLoadImage];
        
        
        dispatch_sync(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
            //计算数据 4s
            
            dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
                //网络请求 5s
                [self requestLoad];
            });
            
            dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
                //任务 3s
                [NSThread  sleepForTimeInterval:3];
                NSLog(@"耗时 3s");
            });
            [self dataForLoad];

        });
        //刷新ui 1s
        dispatch_sync(dispatch_get_main_queue(), ^{
            [self updateUI];
        });
        
        NSDate *endDate=[NSDate date];
        NSTimeInterval durtion=[endDate timeIntervalSinceDate:date];
        NSLog(@"========%f",durtion);
        
    });
}


- (IBAction)FeachData:(id)sender {
    //计算数据加载计算，网络请求，刷新ui 用的时间
    
    //1异步
    //当前时间
    NSDate *date=[NSDate date];
    
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        //任务耗时操作 3s
     [self downLoadImage];
    
        
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
       //计算数据 4s
         [self dataForLoad];
     });
    
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
         //网络请求 5s
         [self requestLoad];
         NSDate *endDate=[NSDate date];
         NSTimeInterval durtion=[endDate timeIntervalSinceDate:date];
         NSLog(@"========%f",durtion);
     });
      //刷新ui 1s
       dispatch_sync(dispatch_get_main_queue(), ^{
        [self updateUI];
        });
        NSLog(@"=====1");
    });
    NSLog(@"=========wangcheng");
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
