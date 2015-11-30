//
//  DeleteDataViewController.m
//  02-数据持久化
//
//  Created by qingyun on 15/11/26.
//  Copyright (c) 2015年 hnqingyun. All rights reserved.
//

#import "DeleteDataViewController.h"
#import "DBOperation.h"

@interface DeleteDataViewController ()
@property (weak, nonatomic) IBOutlet UITextField *tfID;

@end

@implementation DeleteDataViewController
- (IBAction)deleteAction:(id)sender {
    //执行一个删除操作
    [[DBOperation sharderHandle]deleteFrom:_tfID.text.integerValue];
}

- (void)viewDidLoad {
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
