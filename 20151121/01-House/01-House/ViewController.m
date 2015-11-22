//
//  ViewController.m
//  01-House
//
//  Created by qingyun on 15/11/20.
//  Copyright (c) 2015年 hnqingyun. All rights reserved.
//

#import "ViewController.h"
#import "ZUFangTableViewCell.h"
#import "common.h"
#import "HouseInfo.h"
#import "AFNetworking.h"
#import "FileHander.h"

@interface ViewController ()<UITableViewDataSource,UITableViewDelegate>
@property(nonatomic,strong)NSMutableArray *dataArr;
@property(nonatomic,strong)UITableView *table;
@end

@implementation ViewController

//解析数据 dic====》mode insertinto _dataArr
-(void)encodeData:(NSDictionary *)dic{
    //取出list字典列表
    NSArray *tempArr=dic[@"RESPONSE_BODY"][@"list"];
    //清空模型
    [_dataArr removeAllObjects];
    //字典转模型
    for (NSDictionary *dic in tempArr) {
        [_dataArr addObject:[[HouseInfo alloc] initWithDic:dic]];
    }
}


-(void)requset{
//HEAD_INFO={"commandcode":108,"REQUEST_BODY":{"city":"昆明","desc":"0" ,"p":1,"lat":24.973079315636,"lng":102.69840055824}}
    AFHTTPSessionManager *manger=[AFHTTPSessionManager manager];
    
    //设置响应序列化  返回数据是NSData
    manger.responseSerializer=[AFHTTPResponseSerializer serializer];
    //设置请求参数
    NSDictionary *parameter=@{@"HEAD_INFO":@"{\"commandcode\":108,\"REQUEST_BODY\":{\"city\":\"昆明\",\"desc\":\"0\",\"p\":1,\"lat\":24.973079315636,\"lng\":102.69840055824}}"};
    [manger GET:URL parameters:parameter success:^void(NSURLSessionDataTask * task, id objc){
        if ([NSThread currentThread].isMainThread) {
            NSLog(@"主线程");
        }
       // objc====>NSDictionary json 用类别json解析
        NSDictionary *dic=[(NSData*)objc jsonSererror:nil];
        NSNumber *statNuber=dic[@"RESPONSE_CODE: "];
        if (statNuber.intValue==200) {
         //网络请求数据存在本地
            FileHander *hander=[FileHander shardFileHand];
            if(![hander saveFile:dic withForName:@"houseInfo.plist" withError:nil]){
                NSLog(@"====存储失败");
            }
            [self encodeData:dic];
            //刷新ui
            [_table reloadData];
        }
 
    } failure:^void(NSURLSessionDataTask * task, NSError * error) {
        NSLog(@"====%@",error);
    }];
}

-(void)loadData{
 //把字典的数据读取出来
    FileHander *handler=[FileHander shardFileHand];
    NSDictionary *dic=[handler readFile:@"houseInfo.plist"];
    //解析数据
    [self encodeData:dic];
  //刷新ui
    [_table reloadData];
}

-(void)addSubView{
    _table=[[UITableView alloc] initWithFrame:self.view.frame style:UITableViewStylePlain];
    _table.delegate=self;
    _table.dataSource=self;
    _table.rowHeight=100;
    [self.view addSubview:_table];
}

-(void)downLoadImgeView:(NSString *)imageURL ForCell:(ZUFangTableViewCell *)cell{
   
    AFHTTPSessionManager *manger=[AFHTTPSessionManager manager];
    //最终要一个图片的对象 设置响应序列化
//    manger.responseSerializer=[AFImageResponseSerializer serializer];
    manger.responseSerializer=[AFHTTPResponseSerializer serializer];
    [manger GET:imageURL parameters:nil success:^ void(NSURLSessionDataTask * task, id ojbc) {
        //文件存储在本地
         NSString *fileName=task.response.suggestedFilename;
         NSLog(@"========%@",fileName);
        //05afe4a12a034f0ea5d86e4ecd59c11a.jpg
        NSArray *secondArr=[fileName componentsSeparatedByString:@"."];
        NSString *imagName=secondArr[0];
         FileHander *hander=[FileHander shardFileHand];
         [hander  saveImage:(NSData *)ojbc imageWithName:imagName];
        cell.iconImageView.image=[(NSData *)ojbc imageFromdata];
//        cell.imageView.image = ojbc;
//        NSLog(@"%@",ojbc);
        
    } failure:^void(NSURLSessionDataTask * task, NSError * error) {
        NSLog(@"====失败===%@",error);
    }];
}



#pragma mark tableDelegate tableDataSource

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{

    return _dataArr.count;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    ZUFangTableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (!cell) {
        cell=[[NSBundle mainBundle] loadNibNamed:@"ZUFangTableViewCell" owner:nil options:nil][0];
    }
    cell.mode=_dataArr[indexPath.row];
    //下载图片 先读取本地缓存
    // @"Photos/201510/39e1f6c740744de3a2f3099b805fd2ca.jpg"
    NSArray *first1ARR=[cell.mode.iconurl componentsSeparatedByString:@"/"];
    NSString *lastStr=[first1ARR lastObject];
    NSArray *secondArr=[lastStr componentsSeparatedByString:@"."];
    NSString *imagName=secondArr[0];
    NSData *data=[[FileHander shardFileHand] readImage:imagName];
    if (data) {
        cell.iconImageView.image =[UIImage imageWithData:data];
    }else{
      NSString *imgurl=[IMAGEURL stringByAppendingPathComponent:cell.mode.iconurl];
        [self downLoadImgeView:imgurl ForCell:cell];
    }
    return cell;
}

- (void)viewDidLoad {
    _dataArr=[NSMutableArray array];
    [self loadData];
    self.title=@"租房";
    [self addSubView];
    [super viewDidLoad];
    [self requset];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}

@end
