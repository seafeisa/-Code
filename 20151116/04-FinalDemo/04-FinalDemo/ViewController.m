//
//  ViewController.m
//  04-FinalDemo
//
//  Created by qingyun on 15/11/16.
//  Copyright (c) 2015年 hnqingyun. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}
- (IBAction)clickVlaue:(id)sender {
  //串行队列
    dispatch_queue_t  queue=dispatch_queue_create("com.qingyun.final", DISPATCH_QUEUE_SERIAL);
    
    dispatch_async(queue, ^{
        [NSThread  sleepForTimeInterval:2];
        NSLog(@"=====休息2s");
      //在串行队列内部，进行同步派发，串行队列任务，必然死锁
      // dispatch_sync 同步派发
       dispatch_async(queue, ^{
          [NSThread  sleepForTimeInterval:2];
          NSLog(@"=====休息2s");
        });
      dispatch_async(queue, ^{
          [NSThread sleepForTimeInterval:1];
          NSLog(@"=======1s");
      });
    });
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
