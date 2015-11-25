//
//  dataBaseOperation.h
//  02-数据持久化
//
//  Created by qingyun on 15/11/24.
//  Copyright (c) 2015年 hnqingyun. All rights reserved.
//

#import <Foundation/Foundation.h>
@class studentsModel;
@interface dataBaseOperation : NSObject
+(instancetype)sharderHandle;

-(BOOL)insertInto:(studentsModel *)model;


@end
