//
//  ViewController.m
//  03-JsonDemo
//
//  Created by qingyun on 15/11/13.
//  Copyright (c) 2015年 hnqingyun. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController


-(void)jsonClick{
  //json 系统类封装
    NSMutableDictionary *dic=[NSMutableDictionary dictionary];
    [dic setObject:@"张三" forKey:@"name"];
    [dic setObject:[NSNumber numberWithInt:10] forKey:@"age"];
    NSArray *arr=@[@"hanmeimei",@"lisi",@"wangwu"];
    [dic setObject:arr forKey:@"friends"];
    
  //封装系统类 ======》序列化
   NSData *data=[NSJSONSerialization dataWithJSONObject:dic options:NSJSONWritingPrettyPrinted error:nil];
    NSLog(@"=========>%@",[[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding]);
    
   //解析nsdata=======》反序列化
    
  id objct=[NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:nil];
    if ([objct isKindOfClass:[NSDictionary class]]) {
        NSLog(@"=======>%@",objct);
    }

}



-(void)addsubView{
    UIButton *btn=[UIButton  buttonWithType:UIButtonTypeCustom];
    btn.frame=CGRectMake(100, 100, 100, 40);
    btn.backgroundColor=[UIColor blueColor];
    [btn addTarget:self action:@selector(jsonClick) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
}




- (void)viewDidLoad {
    [self addsubView];
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
