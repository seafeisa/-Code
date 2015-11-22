//
//  HouseInfo.m
//  01-House
//
//  Created by qingyun on 15/11/20.
//  Copyright (c) 2015年 hnqingyun. All rights reserved.
//

#import "HouseInfo.h"

@implementation HouseInfo

-(instancetype)initWithDic:(NSDictionary *)dic{
    if (self=[super init]) {
        //kvc
        [self setValuesForKeysWithDictionary:dic];
    }
    return self;
}


+(instancetype)initWithDic:(NSDictionary *)dic{
    return [[self alloc] initWithDic:dic];
}



@end
