//
//  studentsModel.m
//  02-数据持久化
//
//  Created by qingyun on 15/11/24.
//  Copyright (c) 2015年 hnqingyun. All rights reserved.
//

#import "studentsModel.h"

@implementation studentsModel

+(instancetype)studentsWithID:(NSInteger)Id name:(NSString *)name age:(NSInteger)age icon:(UIImage *)icon
{
    studentsModel *studentmodel = [studentsModel new];
    studentmodel.ID = Id;
    studentmodel.userName = name;
    studentmodel.age = age;
    studentmodel.iconImage = icon;
    return studentmodel;
}
@end
