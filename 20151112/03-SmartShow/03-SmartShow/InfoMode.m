//
//  InfoMode.m
//  03-SmartShow
//
//  Created by qingyun on 15/11/12.
//  Copyright (c) 2015年 hnqingyun. All rights reserved.
//

#import "InfoMode.h"

@implementation InfoMode
-(instancetype)initWith:(NSDictionary *)dicValue{
    if (self=[super init]) {
        //kvc
        NSArray *arr=[dicValue allKeys];
        for (NSString *key in arr) {
            if ([key isEqualToString:@"id"]) {
                _Id=dicValue[@"id"];
            }else{
                [self setValue:dicValue[key] forKey:key];
            }
        }
    }
    return self;
}


@end
