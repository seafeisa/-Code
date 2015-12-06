//
//  QYView.m
//  06-FlyStar
//
//  Created by qingyun on 15/12/5.
//  Copyright (c) 2015年 hnqingyun. All rights reserved.
//

#import "QYView.h"

@interface QYView ()
@property (nonatomic, assign) CGFloat starX;
@property (nonatomic, assign) CGFloat starY;
@end


@implementation QYView


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
    
    _starX += 2;
    _starY += 5;
    
    if (_starY > rect.size.height) {
        _starX = 0;
        _starY = 0;
    }
    
    UIImage *star = [UIImage imageNamed:@"star"];
    [star drawAtPoint:CGPointMake(_starX, _starY)];
}

@end
