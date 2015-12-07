//
//  QYLayer.m
//  01-CALayerDemo
//
//  Created by qingyun on 15/12/7.
//  Copyright (c) 2015年 hnqingyun. All rights reserved.
//

#import "QYLayer.h"

@implementation QYLayer
- (void)drawInContext:(CGContextRef)ctx
{
    CGContextMoveToPoint(ctx, 0, 0);
    CGContextAddLineToPoint(ctx, 0, 50);
    CGContextAddLineToPoint(ctx, 100, 50);
    
    CGContextSetRGBFillColor(ctx, 0, 0, 1, 1);
    
    CGContextDrawPath(ctx, kCGPathFillStroke);
}

@end
