//
//  Students.m
//  02-数据持久化
//
//  Created by qingyun on 15/11/23.
//  Copyright (c) 2015年 hnqingyun. All rights reserved.
//

#import "Students.h"

@implementation Students

#pragma mark - NSCoding

//归档,aCoder 编码器
-(void)encodeWithCoder:(NSCoder *)aCoder
{
    [aCoder encodeObject:_name forKey:@"name"];
    [aCoder encodeInteger:_age forKey:@"age"];
    [aCoder encodeObject:_sex forKey:@"sex"];
}

// 解档，aDecoder解码器
-(instancetype)initWithCoder:(NSCoder *)aDecoder
{
    if (self = [super init]) {
        // 存入啥类型就对应取出什么类型 key值要与存的key一致
        self.name = [aDecoder decodeObjectForKey:@"name"];
        self.age = [aDecoder decodeIntForKey:@"age"];
        self.sex = [aDecoder decodeObjectForKey:@"sex"];
    }
    return self;
}
@end
