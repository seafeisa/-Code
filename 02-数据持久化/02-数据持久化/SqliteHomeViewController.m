//
//  SqliteHomeViewController.m
//  02-数据持久化
//
//  Created by qingyun on 15/11/26.
//  Copyright (c) 2015年 hnqingyun. All rights reserved.
//

#import "SqliteHomeViewController.h"
#import "SQLLITEViewController.h"
enum {
 INSERT=10,
 DELETE,
 UPDATE,
 SELECTONE,
 SELECTALL
}typedef DB;

@interface SqliteHomeViewController ()
@property(nonatomic,strong)NSArray *arr;
@end

@implementation SqliteHomeViewController
- (IBAction)TouchUp:(UIButton *)sender {
    UIViewController *controll;
    switch (sender.tag) {
        case INSERT:
        controll=[NSClassFromString(_arr[sender.tag-10]) new];
            break;
        case DELETE:
        controll=[NSClassFromString(_arr[sender.tag-10]) new];

            break;
        case UPDATE:
            controll=[NSClassFromString(_arr[sender.tag-10]) new];

            break;
        case SELECTONE:
            controll=[NSClassFromString(_arr[sender.tag-10]) new];

            break;
        case SELECTALL:
            controll=[NSClassFromString(_arr[sender.tag-10]) new];
            break;
        default:
            break;
    }
    [self.navigationController pushViewController:controll animated:YES];
    
}

- (void)viewDidLoad {
  _arr=@[@"SQLLITEViewController",@"DeleteDataViewController",@"UPDateViewController",@"SlecteViewController"];
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
