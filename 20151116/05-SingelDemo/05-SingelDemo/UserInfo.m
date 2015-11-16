//
//  UserInfo.m
//  05-SingelDemo
//
//  Created by qingyun on 15/11/16.
//  Copyright (c) 2015年 hnqingyun. All rights reserved.
//

#import "UserInfo.h"
@implementation UserInfo
+(instancetype)shareUserInfo{
    static UserInfo *userInfo;
#if 0
    if (userInfo==nil) {
    userInfo=[[UserInfo alloc] init];
    }
#endif
    
    static dispatch_once_t once;
    dispatch_once(&once, ^{
        userInfo=[[UserInfo alloc] init];
    });
    return userInfo;
    
}
@end
