//
//  QYImageTextView.m
//  01-绘图基本
//
//  Created by qingyun on 15/12/4.
//  Copyright (c) 2015年 hnqingyun. All rights reserved.
//

#import "QYImageTextView.h"

@implementation QYImageTextView


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code

    NSString *string = @"好好学习，天天向上";
    
    NSDictionary *attr = @{NSForegroundColorAttributeName:[UIColor redColor], NSStrikethroughStyleAttributeName:@1};
    [string drawInRect:CGRectMake(50, 100, 175, 30) withAttributes:attr];
    
    UIImage *image = [UIImage imageNamed:@"123.png"];
    [image drawInRect:CGRectMake(100, 100, 100, 100)];
}


@end
