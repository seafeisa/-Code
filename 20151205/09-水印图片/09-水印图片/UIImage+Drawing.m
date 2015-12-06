//
//  UIImage+Drawing.m
//  09-水印图片
//
//  Created by qingyun on 15/12/5.
//  Copyright (c) 2015年 hnqingyun. All rights reserved.
//

#import "UIImage+Drawing.h"

@implementation UIImage (Drawing)

- (UIImage *)waterImageWithLogo:(UIImage *)logo {
    // 1. 开启位图上下文
    CGSize size = self.size;
    UIGraphicsBeginImageContextWithOptions(size, YES, 0);
    
    // 2. 绘制母版图片
    [self drawInRect:CGRectMake(0, 0, size.width, size.height)];
    
    // 3. 绘制水印图片
    CGFloat scale = 0.2;
    CGFloat margin = 5;
    CGFloat logoW = logo.size.width * scale;
    CGFloat logoH = logo.size.height * scale;
    CGFloat logoX = size.width - logoW - margin;
    CGFloat logoY = size.height - logoH - margin;
    
    [logo drawInRect:CGRectMake(logoX, logoY, logoW, logoH)];
    
    // 4. 取出最终的水印
    UIImage *waterImage = UIGraphicsGetImageFromCurrentImageContext();
    
    // 5. 关闭位图上下文
    UIGraphicsEndImageContext();
    
    return waterImage;
}

@end
