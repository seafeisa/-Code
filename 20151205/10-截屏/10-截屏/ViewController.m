//
//  ViewController.m
//  10-截屏
//
//  Created by qingyun on 15/12/5.
//  Copyright (c) 2015年 hnqingyun. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [NSTimer scheduledTimerWithTimeInterval:5 target:self selector:@selector(saveScreen) userInfo:nil repeats:NO];
}

- (void)saveScreen {
    // 1. 开启位图上下文
    UIGraphicsBeginImageContextWithOptions(self.view.bounds.size, YES, 0);
    
    // 2. 获取位图上下文
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    
    // 3. 将self.view的layer 渲染（绘制）到当前的位图上下文
    [self.view.layer renderInContext:ctx];
    
    // 4. 从当前的上下文中，取出截屏后的图片
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    
    // 5. 将该图片保存到桌面
    NSData *data = UIImagePNGRepresentation(image);
    [data writeToFile:@"/Users/guofudiyi/Desktop/screen.png" atomically:YES];
    
    // 6. 关闭位图上下文
    UIGraphicsEndImageContext();
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
