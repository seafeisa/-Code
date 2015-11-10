//
//  ViewController.m
//  02-JsonDemo
//
//  Created by qingyun on 15/11/9.
//  Copyright (c) 2015年 hnqingyun. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    
    //解析jsond对象
    //1读取json数据——————》NSData
    NSData *jsonData=[[NSData alloc] initWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"Address" ofType:@"json"]];
    
    //2解析json
    /* data 解析的数据
     * NSJSONReadingOptions 解析的方式
     */
      NSError *error;
      id pramObjc=[NSJSONSerialization JSONObjectWithData:jsonData options:NSJSONReadingAllowFragments error:&error];
//    NSStringFromClass([pramObjc class]);
    
    if ([pramObjc isKindOfClass:[NSArray class]]) {
        NSLog(@"=====数组==%@",pramObjc);
    }
    
    if ([pramObjc isKindOfClass:[NSDictionary class]]) {
        NSLog(@"=====字典");
    }
    
  // 封装
    
   NSData *data=[NSJSONSerialization dataWithJSONObject:pramObjc options:NSJSONWritingPrettyPrinted error:&error];
   NSLog(@"=======%@",[[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding]);
    
    
    
    
    
    
    
    
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
