//
//  ViewController.m
//  08-画图生成图片
//
//  Created by qingyun on 15/12/5.
//  Copyright (c) 2015年 hnqingyun. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *imageView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (IBAction)画吧:(id)sender {
    // 1. 开启位图上下文
    CGSize size = CGSizeMake(100, 100);
    UIGraphicsBeginImageContextWithOptions(size, NO, 0);
    
    // 2. 获取位图上下文
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    
    // 3. 绘制
    CGContextMoveToPoint(ctx, 50, 0);
    CGContextAddLineToPoint(ctx, 0, 100);
    CGContextAddLineToPoint(ctx, 100, 100);
    
    CGContextSetRGBFillColor(ctx, 0, 1, 0, 1);
    CGContextFillPath(ctx);
    
    // 4. 从当前上下文，取得图片
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    
    // 5. 关闭位图上下文
    UIGraphicsEndImageContext();
    
    // 6. 更新_imageView的image
    _imageView.image = image;
    
    // 7. 把图片保存到桌面
    NSData *data = UIImagePNGRepresentation(image);
    [data writeToFile:@"/Users/guofudiyi/Desktop/test.png" atomically:YES];
}

@end
