

//
//  DBOperation.m
//  02-数据持久化
//
//  Created by qingyun on 15/11/24.
//  Copyright (c) 2015年 hnqingyun. All rights reserved.
//

#import "DBOperation.h"
#include <sqlite3.h>
#import "Student.h"
//#import <sqlite3.h>


//静态变量，全局的，只能在.m访问
//_db 数据库链接对象；
static sqlite3 *_db;

#define DBNAME @"sutdent.db"

@implementation DBOperation

+(instancetype)sharderHandle{
    static DBOperation *operation;
    static dispatch_once_t once;
    dispatch_once(&once, ^{
         //该方法只调用一次
        operation=[[DBOperation alloc] init];
        //创建表
        [operation createTable];
       
    });
    return operation;
}

-(NSString *)getPath{
    return NSSearchPathForDirectoriesInDomains(NSLibraryDirectory, NSUserDomainMask, YES)[0];
}

-(BOOL)createTable{
   //1打开数据库
    if(![self openDB]){
        return NO;
    }
   //2.sql语句
    NSString *sql=@"create table if not exists student(ID integer PRIMARY KEY,username text,age integer,icon blob)";
    
    
   //3.sql 转换成预编译语句
    char *errmsg;
    if (sqlite3_exec(_db, [sql UTF8String], NULL, NULL, &errmsg)!=SQLITE_OK) {
        NSLog(@"%s",errmsg);
        //关闭数据库、
        [self closeDB];
       // 释放errmsg;
        sqlite3_free(errmsg);
        return NO;
    }
   //4关闭数据库
    [self closeDB];
    return YES;
}

-(BOOL)openDB{
    if (_db) {
     return YES;
    }
    NSString *dbPath=[[self getPath] stringByAppendingPathComponent:DBNAME];
    //打开数据库
    int result =sqlite3_open([dbPath UTF8String], &_db);
    if(result!=SQLITE_OK){
        NSLog(@"===打开失败");
        return NO;
    }
    return YES;
}
-(BOOL)closeDB{
    //关闭数据库操作
    if (sqlite3_close(_db)!=SQLITE_OK) {
        NSLog(@"===关闭失败");
        return NO;
    }
    //将db清空为0 为了openDB的判断
    _db=NULL;
    return YES;
}
-(BOOL)insertInto:(Student *)mode{
//1.打开数据库
    if (![self openDB]) {
        return NO;
    }
//2.sql语句
  NSString *sql=@"insert into student values(?,?,?,?)";
//3.1将SQL语句转换成预编译对象
    sqlite3_stmt*stmt;
    //第三个参数代表sql字符串的长度 －1代表全部
    //第五个参数代表sql的地址，对我们没有传NULL
   int result=sqlite3_prepare_v2(_db, [sql UTF8String], -1,&stmt, NULL);
    if (result!=SQLITE_OK) {
        NSLog(@"======预编译失败");
        [self closeDB];
        return NO;
    }
    
 //3.2bind参数
  // 第二个参数1 代表？位置,最后参数要传的值
   sqlite3_bind_int(stmt, 1,(int)mode.ID);
   //第四个参数 代表字符串的长度 -1 代表全部
   //最后一个参数传个析构函数 对我们没用 NULL
    sqlite3_bind_text(stmt, 2, [mode.userName UTF8String], -1, NULL);
    sqlite3_bind_int(stmt, 3,(int)mode.age);
    //将image转换成nsdata
    NSData *data=UIImageJPEGRepresentation(mode.icon, 1);
    sqlite3_bind_blob(stmt, 4,data.bytes,(int)data.length, NULL);
    
//4执行预编译对象
    int stepR=sqlite3_step(stmt);
    if(stepR!=SQLITE_DONE){
        NSLog(@"插入失败");
      //销毁预编译对象
        sqlite3_finalize(stmt);
      //关闭数据库
        [self closeDB];
        return NO;
    }
//5.销毁预编译对象
    sqlite3_finalize(stmt);

//6.关闭数据库
    [self closeDB];
    return YES;
}

-(BOOL)deleteFrom:(NSInteger)ID{
//1  打开数据库
    if (![self openDB]) {
        return NO;
    }
//2 sql语句
  NSString *sql=@"DELETE FROM student where ID=?";
//3 将sql转换成预编译对象
    //预编译对象的指针
    sqlite3_stmt *stmt;
    //第三个参数是表示sql的长度 -1 全部
    //第五个参数表示sql的地址，传NULL
  int result=sqlite3_prepare_v2(_db, [sql UTF8String],-1, &stmt,NULL);
    if (result!=SQLITE_OK) {
    //关闭数据库
        [self closeDB];
        return NO;
    }
//4bind 参数
    sqlite3_bind_int(stmt, 1,(int)ID);
//5执行预编译对象
   result=sqlite3_step(stmt);
    if (result!=SQLITE_DONE) {
      //释放预编译对象
        sqlite3_finalize(stmt);
      //关闭数据库
        [self closeDB];
        return NO;
    }
//6销毁预编译对象
    sqlite3_finalize(stmt);
//7关闭数据库
    [self closeDB];
 return YES;
}

-(BOOL)upDateFromMode:(Student *)mode{
   //1 打开数据库
    if (![self openDB]) {
        return NO;
    }
   //2 编写sql语句
    NSString *sql=@"update student set username=?,age=?,icon=? where ID=?";
   //3 将sql转换成预编译对象
    sqlite3_stmt *stmt=NULL;
     //第三个参数是sql的长度，-1全部长度
     //第五个参数表示sql地址，对我们用不到 传NULL
     int result=sqlite3_prepare_v2(_db, [sql UTF8String], -1, &stmt, NULL);
    if(result!=SQLITE_OK){
      //关闭数据库
        [self closeDB];
        return NO;
    }
    //3.1bind 参数
      //第四个参数表示字符串的长度 -1 全部
      //第五个参数是个析构函数，传null
    sqlite3_bind_text(stmt, 1, [mode.userName UTF8String], -1, NULL);
    sqlite3_bind_int(stmt, 2,(int)mode.age);
    NSData *iconData=UIImageJPEGRepresentation(mode.icon, 1);
    sqlite3_bind_blob(stmt, 3, iconData.bytes, (int)iconData.length, NULL);
    sqlite3_bind_int(stmt, 4,(int)mode.ID);
   
    //4 执行预编译
    if(sqlite3_step(stmt)!=SQLITE_DONE){
     //销毁预编译对象
        sqlite3_finalize(stmt);
     //关闭数据库
        [self closeDB];
        
        return NO;
    }
   //5销毁预编译对象
    sqlite3_finalize(stmt);
   //6关闭数据库
    [self closeDB];
  return YES;
}




@end
