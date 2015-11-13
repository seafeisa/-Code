//
//  InfoMode.h
//  03-SmartShow
//
//  Created by qingyun on 15/11/12.
//  Copyright (c) 2015年 hnqingyun. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface InfoMode : NSObject
@property(nonatomic,strong)NSString *title;
@property(nonatomic,strong)NSString *content;
@property(nonatomic,strong)NSString *time;
@property(nonatomic,strong)NSString *Id;
-(instancetype)initWith:(NSDictionary *)dicValue;
@end
