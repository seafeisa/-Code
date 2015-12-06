//
//  QYView.m
//  02-绘制箭头
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
    /**
     * 确定裁剪区域
     */
    UIBezierPath *clipPath = [UIBezierPath bezierPath];
    
    [clipPath moveToPoint:CGPointMake(90, 100)];
    [clipPath addLineToPoint:CGPointMake(110, 100)];
    [clipPath addLineToPoint:CGPointMake(100, 80)];
    
    [clipPath closePath];
    
    // 再增加一个整个画布的rect的path，方便用奇偶法则判断裁剪区域
    [clipPath appendPath:[UIBezierPath bezierPathWithRect:rect]];
    
    clipPath.usesEvenOddFillRule = YES;
    [clipPath addClip];
    
    // 1. 创建 bezierpath对象
    UIBezierPath *p = [UIBezierPath bezierPath];
    
    // 2.1 绘制轴 (shaft)
    // 移动画笔到（100,100）
    [p moveToPoint:CGPointMake(100, 100)];
    
    // 连接一条线
    [p addLineToPoint:CGPointMake(100, 25)];
    
    //    
    // 2.2 绘制箭头 (arrow)
    [p removeAllPoints];
    
    [p moveToPoint:CGPointMake(80, 25)];
    [p addLineToPoint:CGPointMake(120, 25)];
    [p addLineToPoint:CGPointMake(100, 0)];
    
    [[UIColor redColor] setFill];
    [p fill];
}


@end















