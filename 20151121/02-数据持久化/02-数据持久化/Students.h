//
//  Students.h
//  02-数据持久化
//
//  Created by qingyun on 15/11/23.
//  Copyright (c) 2015年 hnqingyun. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Students : NSObject<NSCoding>
@property (nonatomic,strong) NSString *name;
@property (nonatomic) NSInteger age;
@property (nonatomic,strong) NSString *sex;
@end
