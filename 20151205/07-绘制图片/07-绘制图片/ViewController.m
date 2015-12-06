//
//  ViewController.m
//  07-绘制图片
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
    // Do any additional setup after loading the view, typically from a nib.

}

- (IBAction)createImage:(id)sender {
    CGSize size = CGSizeMake(200, 200);
  
    /**
     * 如果，想程序生成图片，就开启位图上下文
     */
    // 1. 开启位图上下文
    UIGraphicsBeginImageContextWithOptions(size, YES, 0);
    
    // 2. 获取当前的图形上下文
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    
    /**
     *  改变CTM
     */
    CGContextScaleCTM(ctx, 1, -1);
    CGContextTranslateCTM(ctx, 0, -200);
    
    UIImage *icon = [UIImage imageNamed:@"dorayo.jpeg"];
    
    // 3. 绘制了图片
    /**
     *  Quartz2d 绘制
     */
    CGContextDrawImage(ctx, CGRectMake(0, 0, 200, 200), icon.CGImage);
    
    /**
     *  UIKit 绘制
     */
    // [icon drawInRect:CGRectMake(0, 0, 200, 200)];

    // 4. 从当前图形上下文中获取一张图片
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    
    // 5. 关闭位图上下文
    UIGraphicsEndImageContext();
    
    // 6. 使用刚才绘制的图片
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(100, 100, 200, 200)];
    imageView.image = image;
    [self.view addSubview:imageView];
}

@end








