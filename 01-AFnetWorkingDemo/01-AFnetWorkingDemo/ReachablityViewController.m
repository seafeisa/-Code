//
//  ReachablityViewController.m
//  01-AFnetWorkingDemo
//
//  Created by qingyun on 15/11/19.
//  Copyright (c) 2015年 hnqingyun. All rights reserved.
//

#import "ReachablityViewController.h"
#import "AFNetworking.h"

@interface ReachablityViewController ()

@end

@implementation ReachablityViewController
- (IBAction)StartingAction:(id)sender {
    //启动监听开始
    [[AFNetworkReachabilityManager sharedManager] startMonitoring];
}

- (void)viewDidLoad {
    
    [[AFNetworkReachabilityManager sharedManager] setReachabilityStatusChangeBlock:^void(AFNetworkReachabilityStatus state) {
    NSString *str=AFStringFromNetworkReachabilityStatus(state);
        UIAlertView *alter=[[UIAlertView alloc] initWithTitle:@"提示" message:str delegate:nil cancelButtonTitle:@"取消" otherButtonTitles:nil, nil];
        [alter show];
    }];
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
