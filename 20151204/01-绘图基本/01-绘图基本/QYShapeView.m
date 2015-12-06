//
//  QYShapeView.m
//  01-绘图基本
//
//  Created by qingyun on 15/12/4.
//  Copyright (c) 2015年 hnqingyun. All rights reserved.
//

#import "QYShapeView.h"

@implementation QYShapeView


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
//    drawRectangle();
    drawTriangle();
}

void drawRectangle(void) {
    // 1. 获取图形上下文
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    
    // 2. 构建path 矩形
//    CGContextAddRect(ctx, CGRectMake(20, 20, 150, 120));
    
    // 3. 绘制
//    [[UIColor purpleColor] set];
    
    // 填充
//    CGContextSetRGBFillColor(ctx, 1, 0, 0, 1);
    [[UIColor redColor] setFill];
    
    // 描边
//    CGContextSetRGBStrokeColor(ctx, 0, 0, 1, 1);
    [[UIColor blueColor] setStroke];
    CGContextSetLineWidth(ctx, 5);

//    CGContextDrawPath(ctx, kCGPathFillStroke);
    CGContextStrokeRect(ctx, CGRectMake(20, 20, 150, 120));
}

void drawTriangle(void) {
    // 1. 获取图形上下文
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    
    // 2. 构建path 三角形
    CGContextMoveToPoint(ctx, 100, 10);
    CGContextAddLineToPoint(ctx, 10, 100);
    CGContextAddLineToPoint(ctx, 180, 180);
    
    // 手动闭合一个path
    /**
     *  如果我们用CGContextFillPath，就不用手动掉CGContextClosePath了
     */
    CGContextClosePath(ctx);
    
    // 3. 绘制
    [[UIColor yellowColor] setFill];
    CGContextFillPath(ctx);

}

@end
