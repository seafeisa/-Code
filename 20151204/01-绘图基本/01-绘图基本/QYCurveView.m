//
//  QYCurveView.m
//  01-绘图基本
//
//  Created by qingyun on 15/12/4.
//  Copyright (c) 2015年 hnqingyun. All rights reserved.
//

#import "QYCurveView.h"

@implementation QYCurveView


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
    drawBezierPath();
    drawCubicBezierPath();
}

void drawBezierPath(void) {
    // 1. 获取图形上下文
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    
    // 2. 构建path
    CGContextMoveToPoint(ctx, 30, 30);
    CGContextAddQuadCurveToPoint(ctx, 50, 200, 180, 20);
    
    // 3. 绘制path
    [[UIColor purpleColor] setStroke];
    CGContextStrokePath(ctx);
}

void drawCubicBezierPath(void) {
    // 1. 获取图形上下文
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    
    // 2. 构建path
    CGContextMoveToPoint(ctx, 30, 30);
    CGContextAddCurveToPoint(ctx, 20, 250, 140, 70, 180, 280);
    
    // 3. 绘制path
    [[UIColor yellowColor] setStroke];
    [[UIColor blueColor] setFill];
    CGContextDrawPath(ctx, kCGPathFillStroke);
    
}


@end
