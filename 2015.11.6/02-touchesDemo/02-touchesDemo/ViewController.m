//
//  ViewController.m
//  02-touchesDemo
//
//  Created by qingyun on 15/11/6.
//  Copyright (c) 2015年 hnqingyun. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}


-(void)singleTap{
    NSLog(@"======单击了");
}

-(void)doubleTap{
    [NSObject cancelPreviousPerformRequestsWithTarget:self selector:@selector(singleTap) object:nil];
    NSLog(@"======双击");
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{

    UITouch *touche=[touches anyObject];
    NSLog(@"=====>%ld",touche.tapCount);
    NSUInteger tapCount=touche.tapCount;
    if( tapCount==1){
        [self performSelector:@selector(singleTap) withObject:nil afterDelay:.3];
    }else{
        [self doubleTap];
    }

}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
