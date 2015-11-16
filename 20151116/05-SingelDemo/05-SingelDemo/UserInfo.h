//
//  UserInfo.h
//  05-SingelDemo
//
//  Created by qingyun on 15/11/16.
//  Copyright (c) 2015年 hnqingyun. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface UserInfo : NSObject
@property(nonatomic,strong)NSString *userName;
@property(nonatomic,assign)int uid;
/* share****
 * default***
 * standard***
 */
+(instancetype)shareUserInfo;


@end
