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
     *  设置裁剪区域
     */
    CGContextMoveToPoint(ctx, 90, 100);
    CGContextAddLineToPoint(ctx, 110, 100);
    CGContextAddLineToPoint(ctx, 100, 80);
    CGContextClosePath(ctx);
    
    CGContextAddRect(ctx, rect);
    CGContextEOClip(ctx);
    
    // 2.1 绘制轴
    CGContextMoveToPoint(ctx, 100, 100);
    CGContextAddLineToPoint(ctx, 100, 25);
    
    CGContextSetRGBStrokeColor(ctx, 0, 0, 0, 1);
    CGContextSetLineWidth(ctx, 20);
    CGContextStrokePath(ctx);
    
    // 2.2 绘制箭头
    CGContextMoveToPoint(ctx, 80, 25);
    CGContextAddLineToPoint(ctx, 120, 25);
    CGContextAddLineToPoint(ctx, 100, 0);
    
    CGContextSetRGBFillColor(ctx, 1, 0, 0, 1);
    CGContextFillPath(ctx);
}


@end
















