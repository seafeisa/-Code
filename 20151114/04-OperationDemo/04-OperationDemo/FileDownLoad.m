//
//  FileDownLoad.m
//  04-OperationDemo
//
//  Created by qingyun on 15/11/14.
//  Copyright (c) 2015年 hnqingyun. All rights reserved.
//

#import "FileDownLoad.h"

@implementation FileDownLoad

-(instancetype)initWith:(NSString *)url{
    if (self=[super init]) {
        
        _downUrl=[NSURL URLWithString:url];
    }
    return self;
}
//默认main方法会自动执行一次
- (void)main{
    NSLog(@"========%s=======%@",__func__,self.name);
    //开始下载任务
    [self downLoad];

}

//下载任务 图片
-(void)downLoad{
    //图片的data
    NSData *data=[NSData dataWithContentsOfURL:_downUrl];
    if (self.delegate) {
        //用字典封装 DATA ,indexPath
        NSMutableDictionary  *dic=[NSMutableDictionary dictionary];
        [dic setObject:data forKey:@"data"];
        [dic setObject:_indexPath forKey:@"indexPath"];

        [_delegate performSelectorOnMainThread:@selector(sendObjcValue:) withObject:dic waitUntilDone:YES];
        
      //  [_delegate sendObjcValue:dic];
    }
    
     
}


@end
