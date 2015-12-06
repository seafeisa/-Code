//
//  AppDelegate.m
//  01-setingBundle
//
//  Created by qingyun on 15/11/23.
//  Copyright (c) 2015年 hnqingyun. All rights reserved.
//

#import "AppDelegate.h"

@interface AppDelegate ()

@end

@implementation AppDelegate
- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    //读取setings bundle 文件
    NSString *setinsurl=[[NSBundle mainBundle] pathForResource:@"Settings" ofType:@"bundle"];
    //root.Plist文件
    NSString *rootUrl=[setinsurl stringByAppendingPathComponent:@"Root.plist"];

    //2读取plist文件
    NSDictionary *rootDic=[[NSDictionary alloc] initWithContentsOfFile:rootUrl];
    NSLog(@"%@",rootDic);
    //读取配置信息
    NSArray *arr=rootDic[@"PreferenceSpecifiers"];
    //读取配置信息用
    NSMutableDictionary *defaulDic=[NSMutableDictionary dictionary];
    for (NSDictionary *dic in arr) {
        NSLog(@"=====%@",dic);
        NSString *key=dic[@"Key"];
        if (key) {
            //Key的value作为defaulDic的key
            //DefaultValue的value作为defaulDic的value
            [defaulDic setObject:key forKey:dic[@"DefaultValue"]];
//            NSUserDefaults *users = [NSUserDefaults standardUserDefaults];
//            [users setObject:dic[@"DefaultValue"] forKey:key];
        }
    }
    
    //1.将配置注册到我们的注册域上 registerDefaults:方法是在NSRegiseterationDomain域上进行配置的，所以仅仅存在于内存中，是易失的。每次运行程序，都要重新去读取，其读取优先级顺序是NSArgumentDomain(volatile)-->Application(persistent)-->NSGlobalDomain(persistent)-->Languages(volatile)-->NSRegistrationDomain(volatile)
    //2.若已经在用户界面更改过setting.bundle 则会把更改过的内容存在Applocation（persistent）持久化保存起来。下次加载会加载更改过的存在Applocation（persistent）中的数据。所以可以认为NSRegistrationDomain(volatile)注册域是sett.bundle 的默认设置。
    [[NSUserDefaults standardUserDefaults] registerDefaults:defaulDic];
    
    
    
    
    
    
    
    
    // Override point for customization after application launch.
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
