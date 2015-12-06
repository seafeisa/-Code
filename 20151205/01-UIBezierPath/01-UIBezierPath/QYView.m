//
//  QYView.m
//  01-UIBezierPath
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
    // 1. 创建UIBezierPath对象 （隐含了一个圆角矩形path）
    UIBezierPath *p = [UIBezierPath bezierPathWithRoundedRect:rect byRoundingCorners:UIRectCornerTopLeft|UIRectCornerBottomRight cornerRadii:CGSizeMake(100, 60)];
    // 2. 设置绘制属性
    [[UIColor greenColor] setFill];
    
    // 3. 绘制
    [p fill];
    
    // 清空path
    // [p removeAllPoints];
    [p moveToPoint:CGPointMake(30, 30)];
    [p addCurveToPoint:CGPointMake(180, 280) controlPoint1:CGPointMake(180, 50) controlPoint2:CGPointMake(60, 250)];
    
    [[UIColor purpleColor] setStroke];
    [p stroke];
    
    
}




@end


















