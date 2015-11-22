//
//  HouseInfo.h
//  01-House
//
//  Created by qingyun on 15/11/20.
//  Copyright (c) 2015年 hnqingyun. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HouseInfo : NSObject
@property(nonatomic,strong)NSString *title;
@property(nonatomic,strong)NSString *housetype;
@property(nonatomic,strong)NSString *simpleadd;
@property(nonatomic,strong)NSString *cid;
@property(nonatomic,strong)NSString *nid;
@property(nonatomic,strong)NSString *iconurl;
@property(nonatomic,strong)NSString *community;
@property(nonatomic,assign)NSNumber *temprownumber;
@property(nonatomic,assign)NSNumber *price;
@property(nonatomic,strong)NSString *camera;

-(instancetype)initWithDic:(NSDictionary *)dic;

+(instancetype)initWithDic:(NSDictionary *)dic;


@end
