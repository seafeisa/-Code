//
//  ViewController.m
//  03-JsonDemo
//
//  Created by qingyun on 15/11/13.
//  Copyright (c) 2015年 hnqingyun. All rights reserved.
//

#import "ViewController.h"
#import "JSONKit.h"

#define basurl @"http://www.kuaidi100.com/query?"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UITextField *tfType;
@property (weak, nonatomic) IBOutlet UITextField *tfPid;

@end

@implementation ViewController


-(void)jsonClick{
  //创建url
    NSString *queryStr=[NSString stringWithFormat:@"type=%@&postid=%@",_tfType.text,_tfPid.text];
    
    NSString *str=[basurl stringByAppendingString:queryStr];
    
    //2创建session
    NSURLSession *session=[NSURLSession sessionWithConfiguration:[NSURLSessionConfiguration defaultSessionConfiguration]];
    //3创建任务
    NSURLSessionDataTask *task=[session dataTaskWithURL:[NSURL URLWithString:str] completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
    //判断状态
        NSHTTPURLResponse *httpResponse=(NSHTTPURLResponse *)response;
        if (httpResponse.statusCode==200) {
         //data 转换成对象
            
            id objct=[data objectFromJSONData];
            if ([objct isKindOfClass:[NSDictionary class]]) {
                NSLog(@"====字典====>%@",objct);
            }
            if ([objct isKindOfClass:[NSArray class]]) {
                NSLog(@"====字典====>%@",objct);
            }
            
            
            
        }
        
        
        
        
    }];
    
    //4 启动
    [task resume];
    
    
    
    
    
    

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
