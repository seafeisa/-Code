//
//  AppDelegate.h
//  05-SingelDemo
//
//  Created by qingyun on 15/11/16.
//  Copyright (c) 2015年 hnqingyun. All rights reserved.
//

#import <UIKit/UIKit.h>
@class UserInfo;
@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;
@property(strong,nonatomic)UserInfo *mode;

-(void)shareValue;
@end

