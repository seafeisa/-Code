//
//  ViewController.m
//  01-UIgestureDemo
//
//  Created by qingyun on 15/11/7.
//  Copyright (c) 2015年 hnqingyun. All rights reserved.
//

#import "ViewController.h"

/*
 点击手势 (UITapGestureRecognizer)
 滑动手势 (UISwipeGestureRecognizer)
 旋转手势 (UIRotationGestureRecognizer)
 捏合手势 (UIPinchGestureRecognizer)
 长按手势 (UILongPressGestureRecognizer)
 平移手势 (UIPanGestureRecognizer) 
 屏幕边缘平移手势 (UIScreenEdgePanGestureRecognizer)
 */

@interface ViewController ()

@end

@implementation ViewController



//单击手势
-(void)singTap:(UITapGestureRecognizer *)recognize{
    NSLog(@"=====单击了");
}
-(void)doubleTap:(UITapGestureRecognizer *)Recognizer{

    NSLog(@"双击了");
}

-(void)swipeAction:(UISwipeGestureRecognizer *)gesture{

    NSLog(@"======滑动了");

}

-(void)rotationAction:(UIRotationGestureRecognizer *)gesture{
   NSLog(@"======旋转了===%f",gesture.rotation);
}

-(void)pinchAction:(UIPinchGestureRecognizer*)gesture{
    NSLog(@"==捏合了=====%f",gesture.scale);

}

-(void)longPressAction:(UILongPressGestureRecognizer  *)gesture{
    
    if (gesture.state==UIGestureRecognizerStateBegan) {
        NSLog(@"=======长按了");

    }
}

-(void)panAction:(UIPanGestureRecognizer *)gesture{

    NSLog(@"=======移动了");
}


-(void)screenedge:(UIScreenEdgePanGestureRecognizer *)gesture{

    NSLog(@"=====屏幕边缘移动了");
}

- (void)viewDidLoad {
    [super viewDidLoad];
   //1 单击手势
    //创建单击手势对象
    UITapGestureRecognizer *tapGesture=[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(singTap:)];
    //设置手指数量
    tapGesture.numberOfTapsRequired=1;
    tapGesture.numberOfTouchesRequired=1;
    [self.view addGestureRecognizer:tapGesture];
    
   //2双击手势
   // 创建双击对象
    UITapGestureRecognizer *doubleGesture=[[UITapGestureRecognizer alloc] init];
    //添加手势识别器对象的消息
    [doubleGesture addTarget:self action:@selector(doubleTap:)];
    //点击次数
    doubleGesture.numberOfTapsRequired=2;
    //添加手势
    [self.view addGestureRecognizer:doubleGesture];
    //doubleGesture 执行失败，再执行TapGesture；
    [tapGesture requireGestureRecognizerToFail:doubleGesture];
//   
    //3滑动手势
    UISwipeGestureRecognizer *swipeGesture=[[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(swipeAction:)];
    //设置滑动方向
    swipeGesture.direction=UISwipeGestureRecognizerDirectionLeft|UISwipeGestureRecognizerDirectionRight;
    [self.view addGestureRecognizer:swipeGesture];
    
    //4旋转手势
    //创建旋转手势对象
    UIRotationGestureRecognizer *rotation=[[UIRotationGestureRecognizer alloc] initWithTarget:self action:@selector(rotationAction:)];
    [self.view addGestureRecognizer:rotation];
    
    //5捏合手势
    UIPinchGestureRecognizer *pinchGesture=[[UIPinchGestureRecognizer alloc] initWithTarget:self action:@selector(pinchAction:)];
    
    [self.view addGestureRecognizer:pinchGesture];
    
    //6长按手势
    UILongPressGestureRecognizer *longPress=[[UILongPressGestureRecognizer alloc] initWithTarget:self action:@selector(longPressAction:)];
    longPress.minimumPressDuration=1;
    [self.view addGestureRecognizer:longPress];
    
//    //7平移手势
//    //创建平移对象
//    UIPanGestureRecognizer *panGesture=[[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(panAction:)];
//    [self.view addGestureRecognizer:panGesture];
    
    //8屏幕边缘手势
    UIScreenEdgePanGestureRecognizer *screenEdge=[[UIScreenEdgePanGestureRecognizer alloc] initWithTarget:self action:@selector(screenedge:)];
    //设置方向
    screenEdge.edges=UIRectEdgeAll;
    
    [self.view addGestureRecognizer:screenEdge];
    
    
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
