//
//  QYCircleView.m
//  01-绘图基本
//
//  Created by qingyun on 15/12/4.
//  Copyright (c) 2015年 hnqingyun. All rights reserved.
//

#import "QYCircleView.h"

@implementation QYCircleView


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
   drawQuarterCircle();
    //drawAnotherArc();
    
}

void drawQuarterCircle(void) {
    // 1. 获取图形上下文
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    
    // 2. 构造1/4圆弧的path
    /**
     * x: 圆心的x坐标
     * y: 圆心的y坐标
     * radius: 圆弧所在圆的半径
     * startAngle: 开始的角度
     * endAngle:   结束的角度 （顺时针的角度）
     * clockwise: 0 顺时针，1 逆时针
     */
    //CGContextAddArc(ctx, 100, 100, 50, 0, M_PI_2, 1);
  //CGContextAddArc(ctx, 100, 100, 50, 0, (M_PI_2+M_PI_4), 0);
  // CGContextAddArc(ctx, 100, 100, 50, 0, (M_PI_2+M_PI_4), 0);
//    CGContextAddArc(ctx, 100, 100, 50, 0, (M_PI*2), 1);
//    CGContextAddArc(ctx, 100, 100, 50, 0, (M_PI*2), 0);
  // CGContextAddArc(ctx, 100, 100, 50, 0, M_PI*2-0.1, 1);
    CGContextAddArc(ctx, 100, 100, 50, 0, M_PI*2-0.1, 0);
    
    // 3. 绘制1/4圆弧
//    CGContextStrokePath(ctx);
    CGContextFillPath(ctx);
    
}

void drawAnotherArc(void) {
    // 1. 获取图形上下文
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    
    // 2. 构建path
    CGContextMoveToPoint(ctx, 150, 100);
    CGContextAddArcToPoint(ctx, 150, 50, 100, 50, 50);
    CGContextAddArcToPoint(ctx, 50, 50, 50, 100, 50);
    
    // 3. 绘制pathp
    CGContextStrokePath(ctx);
}


@end

















