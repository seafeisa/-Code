//
//  ViewController.m
//  03-触摸练习
//
//  Created by qingyun on 15/7/24.
//  Copyright (c) 2015年 河南青云信息技术有限公司. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *magentaView;
@property (weak, nonatomic) IBOutlet UIImageView *cyanView;
@property (weak, nonatomic) IBOutlet UIImageView *yellowView;

@end

#define kMagentaViewFrame   (CGRect){53,55,100,100}
#define kCyanViewFrame      (CGRect){132,254,100,100}
#define kYellowViewFrame    (CGRect){223,457,100,100}


@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.multipleTouchEnabled=NO;

}

- (CGPoint)locationInTouches:(NSSet *)touches
{
    // 0. 先取出触摸
    UITouch *touch = [touches anyObject];
    // 1. 返回触摸点（注意：坐标系 self.view）
    return [touch locationInView:self.view];
}

- (BOOL)isImageViewsContainsPoint:(CGPoint)location
{
    if (CGRectContainsPoint(_magentaView.frame, location)
        ||CGRectContainsPoint(_cyanView.frame, location)
        ||CGRectContainsPoint(_yellowView.frame, location)) {
        return YES;
    }
    
    return NO;
}

- (void)resetFrames
{
    [UIView animateWithDuration:0.5 animations:^{
        _cyanView.frame = kCyanViewFrame;
        _magentaView.frame = kMagentaViewFrame;
        _yellowView.frame = kYellowViewFrame;
    }];
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{

    CGPoint location = [self locationInTouches:touches];

    // 0. 先取出触摸
    UITouch *touch = [touches anyObject];

    if ([self isImageViewsContainsPoint:location]) { // 触摸发生在三个视图里
        // 1. 取出触摸发生的视图
        UIImageView *view = (UIImageView *)touch.view;
        
        // 2. 设置触摸的视图的中心点为触摸点并放大触摸的视图
        [UIView animateWithDuration:0.5 animations:^{
            view.center = location;
            view.transform = CGAffineTransformMakeScale(1.2, 1.2);
        }];
    } else { // 执行双击操作
        if (touch.tapCount == 2) { // 双击
            [self resetFrames];
        }
    }
}

- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event
{
    CGPoint location = [self locationInTouches:touches];
    
    // 移动时的触摸点落在哪个视图的矩形区域内，那个视图的中心点就设置为触摸点
    if (CGRectContainsPoint(_magentaView.frame, location)) {
        [UIView animateWithDuration:0.3 animations:^{
            _magentaView.center = location;
        }];
    }
    
    if (CGRectContainsPoint(_cyanView.frame, location)) {
        [UIView animateWithDuration:0.3 animations:^{
            _cyanView.center = location;
        }];
    }
    
    if (CGRectContainsPoint(_yellowView.frame, location)) {
        [UIView animateWithDuration:0.3 animations:^{
            _yellowView.center = location;
        }];
    }
}

- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
    // 0. 先取出触摸
    UITouch *touch = [touches anyObject];
    
    // 1. 取出触摸发生的视图
    UIImageView *view = (UIImageView *)touch.view;

    // 还原触摸的视图
    [UIView animateWithDuration:0.5 animations:^{
        view.transform = CGAffineTransformIdentity;
    }];
}


@end
