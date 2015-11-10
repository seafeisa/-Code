//
//  ViewController.m
//  02-手势识别器练习
//
//  Created by qingyun on 15/11/7.
//  Copyright (c) 2015年 hnqingyun. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()<UIGestureRecognizerDelegate>

@property(nonatomic,strong)UIImageView *tempImageView;
@end

@implementation ViewController
//平移方法

- (IBAction)panImageView:(UIPanGestureRecognizer *)sender {
    //获取点  sender.view.superview 移动的相对视图的点
    CGPoint point=[sender translationInView:sender.view.superview];
    NSLog(@"======%@",NSStringFromCGPoint(point));
   //中心点偏移
    sender.view.center=CGPointMake(sender.view.center.x+point.x, sender.view.center.y+point.y);
    //重新归零变成曾量值
   [sender setTranslation:CGPointZero inView:sender.view];
}

//捏合手势
- (IBAction)pinchAction:(UIPinchGestureRecognizer *)sender {
    //放大视图
    UIImageView *iamgeView=(UIImageView *)sender.view;
    
    //放大比例 绝对值
    CGFloat scale=sender.scale;
    NSLog(@"=====>%f",scale);
    
    iamgeView.transform=CGAffineTransformScale(iamgeView.transform,sender.scale, sender.scale);
    //scale 归零 设置为增量值
    sender.scale=1.0;
    
    
}



//旋转视图
- (IBAction)rotationImageViewAction:(UIRotationGestureRecognizer *)sender {
    NSLog(@"======%f",sender.rotation);
    //获取旋转视图
    UIImageView *ImageView=(UIImageView *)sender.view;
    //旋转(在之前transform基础上进行旋转) 注意区分:CGAffineTransformMakeRotation(旋转角度)
    ImageView.transform=CGAffineTransformRotate(ImageView.transform,sender.rotation);
     //绝对值 设置成增量值 归零
    sender.rotation=0;
    //ImageView.transform=CGAffineTransformMakeRotation(sender.rotation);
}

//允许其他手势同步执行
- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldRecognizeSimultaneouslyWithGestureRecognizer:(UIGestureRecognizer *)otherGestureRecognizer{
    
    if ([gestureRecognizer isKindOfClass:[UILongPressGestureRecognizer class]]||[otherGestureRecognizer isKindOfClass:[UILongPressGestureRecognizer class]]) {
        return NO;
        }
    return YES;
}

////复原
//-(void)resetRect{
//   [UIView animateWithDuration:.3 animations:^{
//       _tempImageView.transform=CGAffineTransformIdentity;
//   
//   }];
//}

- (IBAction)longPressAction:(UILongPressGestureRecognizer *)sender {
    if (sender.state==UIGestureRecognizerStateBegan) {
        
    //1创建UIMenuItem 对象
    UIMenuItem *menuItem=[[UIMenuItem alloc] initWithTitle:@"还原" action:@selector(resetRect)];
        
    //2获取 UIMenuController 单例对象
    UIMenuController *menuControll=[UIMenuController sharedMenuController];

    //2.1设置items
    menuControll.menuItems=@[menuItem];
    
    //2.2 显示位置
    CGPoint point=[sender locationInView:sender.view];
        
    [menuControll setTargetRect:CGRectMake(point.x, point.y, 0, 0) inView:sender.view];
        
        
//    //接受第一响应
    [sender.view becomeFirstResponder];

    //显示出来
    [menuControll setMenuVisible:YES animated:YES];
    //点击view赋值给_tempImageView
    _tempImageView=(UIImageView *)sender.view;
    }
    
}

//还原图片
-(void)resetRect
{
    NSLog(@"还原图形");
    [UIView animateWithDuration:.3 animations:^{
        _tempImageView.transform = CGAffineTransformIdentity;
    }];
}



- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
