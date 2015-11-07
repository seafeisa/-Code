//
//  ViewController.m
//  04-touches练习
//
//  Created by qingyun on 15/11/6.
//  Copyright (c) 2015年 hnqingyun. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *cyanImageView;
@property (weak, nonatomic) IBOutlet UIImageView *magentImgeView;
@property (weak, nonatomic) IBOutlet UIImageView *yellowImageView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

-(BOOL)isContainsPoins:(CGPoint)point{

    if(CGRectContainsPoint(_cyanImageView.frame, point)||
       CGRectContainsPoint(_yellowImageView.frame, point)||
       CGRectContainsPoint(_magentImgeView.frame, point)){
        return YES;
    }

    return NO;
}

//获取点
-(CGPoint)getCGpointForTouches:(NSSet *)touches{
    UITouch *touch=[touches anyObject];
    CGPoint point=[touch locationInView:self.view];
    return point;
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
//    UITouch
    UITouch *touch=[touches anyObject];
    CGPoint point=[self getCGpointForTouches:touches];
    //1放大视图//判断点是否在三个视图上，改变中心点
        //判断点在任意imageview上
    if ([self isContainsPoins:point]){
        //取视图
        UIImageView *imageView=(UIImageView *)touch.view;
        
        [UIView animateWithDuration:.3 animations:^{
            imageView.center=point;
            imageView.transform=CGAffineTransformMakeScale(1.2, 1.2);
        }];
    }else{
        //双击还原位置
        if (touch.tapCount==2) {
            [UIView animateWithDuration:.3 animations:^{
                _cyanImageView.frame=CGRectMake(45, 45, 100,100);
                _yellowImageView.frame=CGRectMake(216, 462, 100, 100);
                _magentImgeView.frame=CGRectMake(123, 253, 100, 100);
                
            }];
           
        }
    
    
    }

}
-(void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event{
     //移动视图中心点，判断改点是否在我们的视图上rect
    CGPoint point=[self getCGpointForTouches:touches];
    
    //判断中心点是否在视图区域内
    if (CGRectContainsPoint(_magentImgeView.frame, point)) {
      [UIView animateWithDuration:.3 animations:^{
          _magentImgeView.center=point;
      }];
    }
    if (CGRectContainsPoint(_cyanImageView.frame, point)) {
        _cyanImageView.center=point;
    }
    if (CGRectContainsPoint(_yellowImageView.frame, point)) {
        [UIView animateWithDuration:.3 animations:^{
            _yellowImageView.center=point;
        }];
    }
}

-(void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event{
 
    UITouch *touch=[touches anyObject];
    //获取到点击的view
    UIImageView *toucheView=(UIImageView *)touch.view;
    //恢复视图
    [UIView animateWithDuration:.3 animations:^{
        toucheView.transform=CGAffineTransformIdentity;
    }];
}




- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
