//
//  ViewController.m
//  00-DemoLayer
//
//  Created by qingyun on 15/12/7.
//  Copyright (c) 2015年 hnqingyun. All rights reserved.
//

#import "ViewController.h"
#import "QYLayer.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    // 1. 创建一个图层
    QYLayer *layer = [QYLayer layer];
    
    // 2. 构建其内容
    // method1:
    layer.contents = (__bridge id)([UIImage imageNamed:@"dorayo.jpeg"].CGImage);
//    layer.delegate = self;
    
    layer.anchorPoint = CGPointZero;
    layer.bounds = CGRectMake(0, 0, 200, 200);
    layer.position = CGPointMake(50, 50);
    layer.masksToBounds = YES;
    
    layer.cornerRadius = 18;
    
//    layer.zPosition = 1;

    // method2:
//    layer.backgroundColor = [UIColor purpleColor].CGColor;
    
    // 3. 加到self.view.layer上
    [self.view.layer addSublayer:layer];
    
    QYLayer *layer2 = [QYLayer layer];
    layer2.anchorPoint = CGPointZero;
    layer2.bounds = CGRectMake(0, 0, 200, 200);
    layer2.position = CGPointMake(100, 100);
    
    layer2.backgroundColor = [UIColor blueColor].CGColor;
    
//    [self.view.layer addSublayer:layer2];
    
    NSLog(@"layer: %f, layer2: %f", layer.zPosition, layer2.zPosition);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//- (void)drawLayer:(CALayer *)layer inContext:(CGContextRef)ctx {
//    CGContextAddEllipseInRect(ctx, CGRectMake(0, 0, 100, 100));
//    
//    CGContextSetRGBFillColor(ctx, 1, 0, 0, 1);
//    CGContextSetRGBStrokeColor(ctx, 0, 1, 0, 1);
//    CGContextSetLineWidth(ctx, 5);
//    
//    CGContextDrawPath(ctx, kCGPathFillStroke);
//}



@end
