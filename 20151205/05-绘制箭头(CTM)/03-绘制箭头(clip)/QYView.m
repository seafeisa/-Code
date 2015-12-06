//
//  QYView.m
//  03-绘制箭头(clip)
//
//  Created by qingyun on 15/12/5.
//  Copyright (c) 2015年 hnqingyun. All rights reserved.
//

#import "QYView.h"

@implementation QYView


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
    // 1. 获取绘图上下文
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    
    /**
     *  改变CTM
     */
    CGContextTranslateCTM(ctx, 80, 0);
    CGContextRotateCTM(ctx, M_PI_4);
//    CGContextScaleCTM(ctx, 0.2, 0.2);

    /**
     *  设置裁剪区域
     */
    CGContextMoveToPoint(ctx, 10, 100);
    CGContextAddLineToPoint(ctx, 30, 100);
    CGContextAddLineToPoint(ctx, 20, 80);
    CGContextClosePath(ctx);
    
    CGContextAddRect(ctx, rect);
    CGContextEOClip(ctx);
    
    // 2.1 绘制轴
    CGContextMoveToPoint(ctx, 20, 100);
    CGContextAddLineToPoint(ctx, 20, 25);
    
    CGContextSetLineWidth(ctx, 20);
    /*
     CGContextSetRGBStrokeColor(ctx, 0, 0, 0, 1);
     CGContextStrokePath(ctx);
     */
    
    /**
     * 确定不施加渐变规则的区域 (clip area)
     */
    // 将stroked path -> fill path
    CGContextReplacePathWithStrokedPath(ctx);
    // 首先保存之前的裁剪区域
    CGContextSaveGState(ctx);
    // 再确定新的裁剪区域
    CGContextClip(ctx);
    
    // 绘制渐变
    // 创建颜色空间
    CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceRGB();
    // 颜色components
    const CGFloat components[] = {
        0.2, 0.6, 0.8, 0.6,
        0.6, 0.1, 0.7, 0.8,
        0.3, 0.7, 0.4, 0.5
    };
    // locations
    const CGFloat locations[] = {0, 0.382, 1};
    // 创建渐变对象
    CGGradientRef gradient = CGGradientCreateWithColorComponents(colorSpace, components, locations, 3);
    CGContextDrawLinearGradient(ctx, gradient, CGPointMake(10, 100), CGPointMake(30, 100), 0);
    
    // 释放颜色颜色空间对象
    CGColorSpaceRelease(colorSpace);
    // 释放渐变对象
    CGGradientRelease(gradient);
    // 恢复之前的裁剪区域
    CGContextRestoreGState(ctx);
    
    // 2.2 绘制箭头
    CGContextMoveToPoint(ctx, 0, 25);
    CGContextAddLineToPoint(ctx, 40, 25);
    CGContextAddLineToPoint(ctx, 20, 0);
    
    CGContextSetRGBFillColor(ctx, 1, 0, 0, 1);
    CGContextFillPath(ctx);
}


@end
















