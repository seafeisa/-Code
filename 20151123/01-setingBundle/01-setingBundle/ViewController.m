//
//  ViewController.m
//  01-setingBundle
//
//  Created by qingyun on 15/11/23.
//  Copyright (c) 2015年 hnqingyun. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    
    //读取注册域的值
    NSLog(@"======%@",NSHomeDirectory());
    NSLog(@"====11=%@",[[NSUserDefaults standardUserDefaults] objectForKey:@"name_preference"]);
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
