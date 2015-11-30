//
//  ViewController.m
//  01-NSURLSessionDemo1
//
//  Created by qingyun on 15/11/27.
//  Copyright (c) 2015年 hnqingyun. All rights reserved.
//

#import "ViewController.h"
#define kItunesSWURLStr @"https://itunes.apple.com/search?term=apple&media=software"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSURLSession *session = [NSURLSession sharedSession];
    
    NSURLSessionDataTask *dataTask = [session dataTaskWithURL:[NSURL URLWithString:kItunesSWURLStr] completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
        if (error) {
            NSLog(@"%@", error);
            return ;
        }
        id result = [NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
        NSLog(@"%@", result);
    }];
    
    [dataTask resume];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
