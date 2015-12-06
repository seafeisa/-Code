//
//  ViewController.m
//  06-FlyStar
//
//  Created by qingyun on 15/12/5.
//  Copyright (c) 2015年 hnqingyun. All rights reserved.
//

#import "ViewController.h"
#import "QYView.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet QYView *starView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
}

- (IBAction)fly:(id)sender {
//    [NSTimer scheduledTimerWithTimeInterval:0.1 target:_starView selector:@selector(setNeedsDisplay) userInfo:nil repeats:YES];
    
    CADisplayLink *link = [CADisplayLink displayLinkWithTarget:_starView selector:@selector(setNeedsDisplay)];
    [link addToRunLoop:[NSRunLoop currentRunLoop] forMode:NSDefaultRunLoopMode];
}


@end
