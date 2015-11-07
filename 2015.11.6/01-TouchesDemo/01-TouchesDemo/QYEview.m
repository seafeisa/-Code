//
//  QYEview.m
//  01-TouchesDemo
//
//  Created by qingyun on 15/11/6.
//  Copyright (c) 2015年 hnqingyun. All rights reserved.
//

#import "QYEview.h"

@implementation QYEview


//-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
//    
//    NSLog(@"=========>%s",__func__);
//    
//}



/*

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    //手指对象
     UITouch *touch=[touches anyObject];
     NSLog(@"=======%@",NSStringFromCGPoint([touch locationInView:self]));
}
-(void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event{
   //获取UItouch 对象
    UITouch *touch=[touches anyObject];
    CGPoint point=[touch locationInView:self];
    NSLog(@"======move=====%@",NSStringFromCGPoint([touch locationInView:self]));
    
    
    UIView *drawView=[[UIView alloc] initWithFrame:CGRectMake(point.x, point.y, 2, 2)];
    drawView.backgroundColor=[UIColor blackColor];
    [self addSubview:drawView];
    
    
    
    
    
    
}
-(void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event{
    UITouch *touch=[touches anyObject];
    NSLog(@"end=====%@",NSStringFromCGPoint([touch locationInView:self]));
}

*/

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
