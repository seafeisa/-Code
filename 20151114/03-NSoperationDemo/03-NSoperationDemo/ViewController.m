//
//  ViewController.m
//  03-NSoperationDemo
//
//  Created by qingyun on 15/11/14.
//  Copyright (c) 2015年 hnqingyun. All rights reserved.
//

#import "ViewController.h"

#define  baseurl @"http://image.baidu.com/search/down?tn=download&ipn=dwnl&word=download&ie=utf8&fr=result&url=http%3A%2F%2Fpic14.nipic.com%2F20110522%2F7411759_164157418126_2.jpg"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UILabel *tempLab;
@property (weak, nonatomic) IBOutlet UIImageView *tempImageView;

@property(nonatomic,strong) NSOperationQueue *queue;
@end

@implementation ViewController

-(void)updataImageView:(UIImage *)image{
    _tempImageView.image=image;
}

- (IBAction)testClick:(id)sender {
   //1 创建operation 对象 线程
    NSBlockOperation *block=[NSBlockOperation blockOperationWithBlock:^{
      //处理你的任务 子线程
      //下载一个图片
        NSData *data=[NSData dataWithContentsOfURL:[NSURL URLWithString:baseurl]];
        
        UIImage *image=[UIImage imageWithData:data];
        
        if (![[NSThread currentThread] isMainThread]) {
            NSLog(@"====子线程");
            [self performSelectorOnMainThread:@selector(updataImageView:) withObject:image waitUntilDone:YES];
        }else{
            [self updataImageView:image];
        }
    }];
    
    //任务添加到队列中
    [_queue addOperation:block];
}

-(void)upLoadView:(NSString *)name{
    NSLog(@"========主线程刷新ui");
    _tempLab.text=name;
}

-(void)updateLab:(NSString *)name{
 //判断是不是主线程
    
    for (NSOperation *operation in _queue.operations) {
        NSLog(@"=====%@",operation.name);
    };
    
    
    if(![[NSThread currentThread] isMainThread]){
        NSLog(@"子线程===%@",[NSThread currentThread].name);
        [NSThread sleepForTimeInterval:3];
        [self performSelectorOnMainThread:@selector(upLoadView:) withObject:name waitUntilDone:YES];
    }
   
    NSLog(@"========完成");
}

- (void)viewDidLoad {
    [super viewDidLoad];

    //创建NSInvocationOperation 对象 任务 启动线程
    NSInvocationOperation *operataion=[[NSInvocationOperation alloc] initWithTarget:self selector:@selector(updateLab:) object:@"NSInvocationOperation"];
    operataion.name=@"张三";
    //队列
    _queue=[[NSOperationQueue alloc] init];
    //任务添加到队列
    [_queue addOperation:operataion];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
