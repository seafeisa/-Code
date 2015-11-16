//
//  ViewController.m
//  05-SingelDemo
//
//  Created by qingyun on 15/11/16.
//  Copyright (c) 2015年 hnqingyun. All rights reserved.
//

#import "ViewController.h"
#import "UserInfo.h"
#import "AppDelegate.h"

@interface ViewController ()
@property(nonatomic,strong) UserInfo *mode;
@end

@implementation ViewController

- (IBAction)clickValueSend:(id)sender {
    //入口类调用 入口类对象
   AppDelegate *app=[UIApplication sharedApplication].delegate;
    [app shareValue];
    
}

- (void)viewDidLoad {
   //初始化赋值
//    UserInfo *user=[UserInfo shareUserInfo];
//    user.userName=@"张三";
//    user.uid=2;
//    NSLog(@"=======%@",user);
    
    
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
       UserInfo *user=[UserInfo shareUserInfo];
        NSLog(@"=======%@",user);

    });
    
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        UserInfo *user=[UserInfo shareUserInfo];
        NSLog(@"=======%@",user);
        
    });

    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        UserInfo *user=[UserInfo shareUserInfo];
        NSLog(@"=======%@",user);
    });
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        UserInfo *user=[UserInfo shareUserInfo];
        NSLog(@"=======%@",user);
    });

    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        UserInfo *user=[UserInfo shareUserInfo];
        NSLog(@"=======%@",user);
    });
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        UserInfo *user=[UserInfo shareUserInfo];
        NSLog(@"=======%@",user);
        
    });

    
    
    
    
    
  [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
