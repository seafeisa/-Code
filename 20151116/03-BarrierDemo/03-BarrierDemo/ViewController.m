//
//  ViewController.m
//  03-BarrierDemo
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

-(IBAction)clickValue:(id)sender{
 //设置屏障
 //1创建队列
   //DISPATCH_QUEUE_SERIAL (or NULL) 串行队列
   //DISPATCH_QUEUE_CONCURRENT 并发队列
    
   //屏障只适用于并发队列（自定义手动创建的队列）
   dispatch_queue_t queue=dispatch_queue_create("com.qingyun.xxx",DISPATCH_QUEUE_SERIAL);
   
   dispatch_async(queue, ^{
       [NSThread sleepForTimeInterval:4];
       NSLog(@"=======1");
   });
   dispatch_async(queue, ^{
       [NSThread sleepForTimeInterval:2];
       NSLog(@"=====2");
   });
   //设置屏障
    dispatch_barrier_async(queue, ^{
        [NSThread sleepForTimeInterval:3];
        NSLog(@"======我是屏障");
    });
    
    dispatch_async(queue, ^{
        
        [NSThread sleepForTimeInterval:1];
        NSLog(@"======3");

    });

    dispatch_async(queue, ^{
        [NSThread sleepForTimeInterval:2];
        NSLog(@"======4");
        
    });
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
