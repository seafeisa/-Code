//
//  ViewController.m
//  01-AFnetWorkingDemo
//
//  Created by qingyun on 15/11/17.
//  Copyright (c) 2015年 hnqingyun. All rights reserved.
//

#import "ViewController.h"
#import "AFHTTPRequestOperationViewController.h"
#import "AFHttpOperationMagViewController.h"
#import "AFURLsessionMagViewController.h"

@interface ViewController ()<UITableViewDataSource,UITableViewDelegate>
@property(nonatomic ,strong)NSArray *arr;
@end

@implementation ViewController

-(void)viewDidLoad{
   _arr=@[@"AFHTTPRequestOperationViewController",@"AFHttpOperationMagViewController",@"AFURLsessionMagViewController"];
    
    UITableView *tableView=[[UITableView alloc] initWithFrame:self.view.frame];
    tableView.delegate=self;
    tableView.dataSource=self;
    [self.view addSubview:tableView];
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}
#pragma mark tabviewData delegate

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return _arr.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
  static NSString *identifer=@"Cell";
    UITableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:identifer];
    if (cell==nil) {
        cell=[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifer];
    }
    
    cell.textLabel.text=_arr[indexPath.row];
    return cell;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    UIViewController *controller=[NSClassFromString(_arr[indexPath.row]) new];
    [self.navigationController pushViewController:controller animated:YES];
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
