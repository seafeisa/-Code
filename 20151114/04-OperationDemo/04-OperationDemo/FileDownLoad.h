//
//  FileDownLoad.h
//  04-OperationDemo
//
//  Created by qingyun on 15/11/14.
//  Copyright (c) 2015年 hnqingyun. All rights reserved.
//任务类

#import <Foundation/Foundation.h>
#import "ViewController.h"
@protocol DownLoadPro <NSObject>
-(void)sendObjcValue:(id)value;
@end

@interface FileDownLoad : NSOperation
//下载图片的url
@property(nonatomic,strong)NSURL *downUrl;
//回调时找到cell标示
@property(nonatomic,strong)NSIndexPath *indexPath;
@property(nonatomic,assign)NSObject<DownLoadPro> *delegate;


-(instancetype)initWith:(NSString *)url;



@end
