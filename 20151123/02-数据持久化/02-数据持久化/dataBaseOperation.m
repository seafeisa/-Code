//
//  dataBaseOperation.m
//  02-数据持久化
//
//  Created by qingyun on 15/11/24.
//  Copyright (c) 2015年 hnqingyun. All rights reserved.
//

#import "dataBaseOperation.h"
#import "studentsModel.h"
#include <sqlite3.h>
//#import <sqlite3.h>

// 全局静态变量  ，只能在。m中访问
//_DB是数据库链接对象
static sqlite3 *_DB;
#define DBName @"student.db"
@implementation dataBaseOperation
+(instancetype)sharderHandle
{
    static dataBaseOperation *operation;
    static dispatch_once_t once;
    dispatch_once(&once, ^{
        operation = [[dataBaseOperation alloc] init];
        //该方法只调用一次
        //创建表
        [operation createTable];
    });
    return operation;
}
-(NSString *)getPath
{
    NSLog(@"%@",NSSearchPathForDirectoriesInDomains(NSLibraryDirectory, NSUserDomainMask, YES)[0]);
    return NSSearchPathForDirectoriesInDomains(NSLibraryDirectory, NSUserDomainMask, YES)[0];
    
}

//打开数据库？
-(BOOL)openDB

{
    if (_DB) {
        return YES;
    }
    NSString *path = [[self getPath] stringByAppendingPathComponent:DBName];
    //NSLog(@"path>>>>>>>",path);
    int result = sqlite3_open([path UTF8String], &_DB);
    if (result != SQLITE_OK) {
        NSLog(@"打开失败");
        return NO;
    }
    return YES;
}
//关闭数据可？
-(BOOL)closeDB
{
    if (sqlite3_close(_DB)!= SQLITE_OK) {
        NSLog(@"关闭失败");
        return NO;
    }
    // 将DB清空为零，为了openDB的判断
    _DB = NULL;
    return YES;
}

-(BOOL)createTable
{
    //1.打开数据库
    if (![self openDB]) {
        return NO;
    }
    //2.SQL语句
    NSString *sql = @"create table if not exists student(ID INTEGER PRIMARY KEY,username text,age integer,icon blob)";
    //3.将SQL转化为预编译语句
    char *errmsg;
    if (sqlite3_exec(_DB, [sql UTF8String], NULL, NULL, &errmsg) != SQLITE_OK) {
        NSLog(@"%s",errmsg);
    }
    
    [self closeDB];
    //释放errmsg
    sqlite3_free(errmsg);
    return NO;
    
    //4.关闭数据可
    
}

-(BOOL)insertInto:(studentsModel *)model
{
    //1.打开数据库
    if (![self openDB]) {
        return NO;
    }
    
    //2.sql语句
    NSString *sql = @"insert into student values(?,?,?,?)";
    
    //3. 将sql转化为预编译对象(第三个参数，-1表示编译内容的总长度。第五个参数代表sql的地址，老师说没用)
    sqlite3_stmt *stmt;
     int result =  sqlite3_prepare_v2(_DB, [sql UTF8String], -1, &stmt, NULL);
    if (result!=SQLITE_OK) {
        NSLog(@"编译失败");
        [self closeDB];
        return NO;
    }
       //绑定参数bind
          // 第二各参数是位置  最后一个参数代表要传的值
    sqlite3_bind_int(stmt, 1, (int)model.ID);
          // 第四个参数代表要穿的字符串的长度 -1 代表全部
           //最后一个参数传一个析构函数，老师说对我们没用 传NULL
    sqlite3_bind_text(stmt, 2, [model.userName UTF8String], -1, NULL);
    sqlite3_bind_int(stmt, 3, (int)model.age );
    
    // 将UIImage 转化为data
    NSData *data = UIImageJPEGRepresentation(model.iconImage, 1);
    sqlite3_bind_blob(stmt, 4, data.bytes, (int)data.length, NULL);
    
    //4. 执行预编译
    if (sqlite3_step(stmt)!=SQLITE_DONE) {
        NSLog(@"插入失败");
        // 销毁预编译对象
        sqlite3_finalize(stmt);
        // 关闭数据库
        [self closeDB];
        return NO;
    }
    
    //5. 销毁预编译对象
    sqlite3_finalize(stmt);
    
    // 6.关闭数据库
    [self closeDB];
    return YES;
}













@end
