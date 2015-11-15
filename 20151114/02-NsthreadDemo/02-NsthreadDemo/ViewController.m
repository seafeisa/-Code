//
//  ViewController.m
//  02-NsthreadDemo
//
//  Created by qingyun on 15/11/14.
//  Copyright (c) 2015年 hnqingyun. All rights reserved.
//

#import "ViewController.h"
#define baseurl @"http://image.baidu.com/search/down?tn=download&ipn=dwnl&word=download&ie=utf8&fr=result&url=http%3A%2F%2Fpic14.nipic.com%2F20110522%2F7411759_164157418126_2.jpg"
@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *tempImageView;
@property (weak, nonatomic) IBOutlet UILabel *stateLab;

@end

@implementation ViewController

- (void)viewDidLoad {
    NSOperation
    
    UIImageView *image=[[UIImageView alloc] initWithFrame:CGRectMake(100, 100, 100, 100)];
    image.tag=10;
    [self.view addSubview:image];
    
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}



-(void)updataView:(NSData *)data{
    if([NSThread isMainThread]){
        
        NSLog(@"======主线程");
    }
     _stateLab.text=@"完成";
    UIImageView *temp=(UIImageView *)[self.view viewWithTag:10];
    temp.image=[UIImage imageWithData:data];
}

-(void)updataLab{
  _stateLab.text=@"下载中";
}


-(void)feachImage:(NSString *)url{
    @autoreleasepool {
        
    if([NSThread isMainThread]){
    
        NSLog(@"======主线程");
    }
        [self performSelectorOnMainThread:@selector(updataLab) withObject:nil waitUntilDone:YES];
    //休眠 耗时操作
    [NSThread sleepForTimeInterval:3];
    
    //下载图片
    
    NSData *data=[NSData dataWithContentsOfURL:[NSURL URLWithString:url]];
    
    //更新ui
    //调用主线程
        [self performSelectorOnMainThread:@selector(updataView:) withObject:data waitUntilDone:YES];
  }
}


- (IBAction)startAction:(id)sender {
    //1启动线程 显式调用
   // [NSThread detachNewThreadSelector:@selector(feachImage:) toTarget:self withObject:baseurl];
    
    _stateLab.text=@"开始下载";
    NSThread *thread=[[NSThread alloc] initWithTarget:self selector:@selector(feachImage:) object:baseurl];
    thread.name=@"张三";
    //启动线程
    [thread start];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
