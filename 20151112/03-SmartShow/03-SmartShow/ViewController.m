//
//  ViewController.m
//  03-SmartShow
//
//  Created by qingyun on 15/11/12.
//  Copyright (c) 2015年 hnqingyun. All rights reserved.
//

#import "ViewController.h"
#import "InfoTableViewCell.h"
#import "heardInfo.h"
#import "InfoMode.h"


@interface ViewController ()<UITableViewDataSource,UITableViewDelegate>
@property(nonatomic,strong)NSMutableArray *sourceArr;
@end

@implementation ViewController

-(void)addsubView{
    UITableView *table=[[UITableView alloc] initWithFrame:self.view.frame style:UITableViewStylePlain];
    table.delegate=self;
    table.dataSource=self;
    table.rowHeight=110;
    table.tag=10;
    [self.view addSubview:table];
}

-(void)reloadView{
    //刷新tableview
    UITableView *table=(UITableView *)[self.view viewWithTag:10];
    [table reloadData];

}


#pragma mark requestNetWork
-(void)requestNetWork{
//1 创建配置文件 模式
    NSURLSessionConfiguration *config=[NSURLSessionConfiguration defaultSessionConfiguration];
//2 创建session
    NSURLSession *session=[NSURLSession sessionWithConfiguration:config];

//3 创建task
    NSMutableURLRequest *request=[NSMutableURLRequest requestWithURL:[NSURL URLWithString:baseUrl]];
    //3.2设置method
    request.HTTPMethod=@"post";
    
    //3.3 设置body
    NSString *body=[NSString stringWithFormat:@"page=%d&pageSize=%d",1,20];
    request.HTTPBody=[body dataUsingEncoding:NSUTF8StringEncoding];
    
  NSURLSessionDataTask *task=[session dataTaskWithRequest:request completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
      //data 转换成json对象 （数组，字典）
      NSHTTPURLResponse *httpResponse=(NSHTTPURLResponse *)response;
      if (httpResponse.statusCode==200) {
        //data---->json
      id objc=[NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:&error];
          NSArray *dataArr=objc[@"data"];
          //json->mode
          //存在数据源
          for (NSDictionary *dic in dataArr) {
              [_sourceArr addObject:[[InfoMode alloc] initWith:dic]];
          }
      }
      
//      if ([NSThread isMainThread]) {
//          NSLog(@"=-======");
//      }
     
      [self performSelectorOnMainThread:@selector(reloadView) withObject:nil waitUntilDone:YES];
  }];
    
  //4.执行请求
    [task resume];
}




#pragma mark tableview DataSource delegate
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return _sourceArr.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    InfoTableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (cell==nil) {
        cell=[[NSBundle mainBundle]loadNibNamed:@"InfoTableViewCell" owner:self options:nil][0];

    }
    //给cell赋值
    InfoMode *mode=_sourceArr[indexPath.row];
    
    cell.titleLab.text=mode.title;
    cell.contentLab.text=mode.content;
    cell.timeLab.text=mode.time;
    
    return cell;
}


- (void)viewDidLoad {
    //添加tableView
    [self addsubView];
    _sourceArr=[NSMutableArray array];
    //2 网络请求
    [self requestNetWork];
    
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
