//
//  QYLineView.m
//  01-绘图基本
//
//  Created by qingyun on 15/12/4.
//  Copyright (c) 2015年 hnqingyun. All rights reserved.
//

#import "QYLineView.h"

@implementation QYLineView


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
    // 1. 获取图形上下文
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    

    // 2. 将画笔移动到(100, 100)
    CGContextMoveToPoint(ctx, 10, 10);
    
    // 3. 连接到 (60, 10）
    CGContextAddLineToPoint(ctx, 80, 100);
    
    CGContextAddLineToPoint(ctx, 20, 200);
    
    // 4. 渲染（绘制）
    CGContextSaveGState(ctx);
//    CGContextSetRGBFillColor(ctx, 1, 0, 0, 0.5);
    CGContextSetRGBStrokeColor(ctx, 1, 0, 0, 1);
    CGContextSetLineWidth(ctx, 10);
    CGContextSetLineJoin(ctx, kCGLineJoinBevel);
    CGContextSetLineCap(ctx, kCGLineCapRound);
    
    CGContextStrokePath(ctx);

    CGContextRestoreGState(ctx);
    const CGFloat lengths[] = {5,1,4,1,3,1,2,1,1,1,1,2,1,3,1,4,1,5};
    CGContextSetLineDash(ctx, 0, lengths, 18);
    CGContextSetRGBStrokeColor(ctx, 0, 0, 1, 1);
    CGContextSetLineWidth(ctx, 3);
    CGContextMoveToPoint(ctx, 150, 150);
    CGContextAddLineToPoint(ctx, 30, 30);
//    CGContextStrokePath(ctx);
    CGContextDrawPath(ctx, kCGPathStroke);
}


@end
