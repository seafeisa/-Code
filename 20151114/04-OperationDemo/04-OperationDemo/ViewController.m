//
//  ViewController.m
//  04-OperationDemo
//
//  Created by qingyun on 15/11/14.
//  Copyright (c) 2015年 hnqingyun. All rights reserved.
//

#import "ViewController.h"
#import "FileDownLoad.h"

@interface ViewController ()<UITableViewDataSource,UITableViewDelegate,DownLoadPro
>

@property(nonatomic,strong)NSMutableArray *dataArr;
@end

@implementation ViewController

#pragma mark DownPRO
-(void)sendObjcValue:(id)value{
    if ([[NSThread currentThread]isMainThread]) {
        NSLog(@"=======主线程");
    }
    
  //取出字典
    NSDictionary *dic=(NSDictionary *)value;
  //找到tableviewcell
    NSIndexPath *path=dic[@"indexPath"];
    UITableView *tableView=(UITableView *)[self.view viewWithTag:10];
    UITableViewCell *cell=[tableView cellForRowAtIndexPath:path];
   //cell imageView 赋值
    NSData *data=dic[@"data"];
    UIImageView *imageView=(UIImageView *)[cell viewWithTag:100];
    imageView.image=[UIImage imageWithData:data];
}


-(void)addsubView{
    UITableView *tableView=[[UITableView alloc] initWithFrame:self.view.frame style:UITableViewStylePlain];
    tableView.delegate=self;
    tableView.dataSource=self;
    tableView.tag=10;
    tableView.rowHeight=100;
    [self.view addSubview: tableView];
}

- (void)viewDidLoad {
    //初始化数据源
    _dataArr=[NSMutableArray array];
    for (int i=0; i<10; i++) {
        [_dataArr addObject:@"http://image.baidu.com/search/down?tn=download&word=download&ie=utf8&fr=detail&url=http%3A%2F%2Fpic14.nipic.com%2F20110522%2F7411759_164157418126_2.jpg&thumburl=http%3A%2F%2Fimg3.imgtn.bdimg.com%2Fit%2Fu%3D1183223528%2C3058066243%26fm%3D21%26gp%3D0.jpg"];
    }
    [self addsubView];
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

#pragma mark tableview DataSource


-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return _dataArr.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *Identifier=@"cell";
    UITableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:Identifier];
    if (cell==nil) {
        cell=[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:Identifier];
        UIImageView *iamgeView=[[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 100, 100)];
        iamgeView.tag=100;
        [cell addSubview:iamgeView];
    }
    //开始下载图片
    
    //1取出的下载的路径
     NSString*url=_dataArr[indexPath.row];
    //2创建operation对象
    FileDownLoad *operation=[[FileDownLoad alloc] initWith:url];
    operation.name=[NSString stringWithFormat:@"%ld",(long)indexPath.row];
    //设置代理
    operation.delegate=self;
    // 设置indexpath
    operation.indexPath=indexPath;
    //3.将operation对象添加到队列
    [[NSOperationQueue currentQueue] addOperation:operation];

    return cell;

}






@end
