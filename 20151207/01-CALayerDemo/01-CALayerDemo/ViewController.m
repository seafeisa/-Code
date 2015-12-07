//
//  ViewController.m
//  01-CALayerDemo
//
//  Created by qingyun on 15/12/7.
//  Copyright (c) 2015年 hnqingyun. All rights reserved.
//

#import "ViewController.h"
#import "QYLayer.h"

@interface ViewController ()
@property (nonatomic, strong) CALayer *layer;
@property (nonatomic, strong) CALayer *maskLayer;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    CALayer *layer = [CALayer layer];
    
    // 1. 外观
    layer.backgroundColor = [UIColor greenColor].CGColor;
    
    // 2. 几何尺寸
    layer.bounds = CGRectMake(0, 0, 200, 200);
    layer.position = CGPointMake(180, 330);
    
    // 3. 添加layer
    [self.view.layer addSublayer:layer];
    _layer = layer;
    
    _maskLayer = [CALayer layer];
    _maskLayer.contents = (__bridge id)([UIImage imageNamed:@"opacity"].CGImage);
    _maskLayer.bounds = CGRectMake(0, 0, 100, 100);
    _maskLayer.position = CGPointMake(100, 100);
}

- (IBAction)triggerBorder:(id)sender {
    if (_layer.borderWidth > 0) {
        _layer.borderWidth = 0;
    } else {
        _layer.borderWidth = 5;
        _layer.borderColor = [UIColor blueColor].CGColor;
    }
}

- (IBAction)triggerCornerRadius:(id)sender {
    if (_layer.cornerRadius > 0) {
        _layer.cornerRadius = 0;
    } else {
        _layer.cornerRadius = 25;
    }
}


- (IBAction)triggerOpacity:(id)sender {
    if (_layer.opacity < 1) {
        _layer.opacity = 1;
    } else {
        _layer.opacity = 0.3;
    }
}


- (IBAction)triggerShadow:(id)sender {
    if (_layer.shadowOpacity > 0) {
        _layer.shadowOpacity = 0;
    } else {
        _layer.shadowColor = [UIColor darkGrayColor].CGColor;
        _layer.shadowOpacity = 1;
        _layer.shadowRadius = 20;
        NSLog(@"width:%.2f, height:%.2f", _layer.shadowOffset.width, _layer.shadowOffset.height);
    }
}

- (IBAction)triggerMaskLayer:(id)sender {
    _layer.mask = _layer.mask == nil ? _maskLayer : nil;
}

- (IBAction)triggerSubLayer:(id)sender {
    if (_layer.sublayers == nil) {
        QYLayer *subLayer = [QYLayer layer];
        subLayer.bounds = CGRectMake(0, 0, 100, 100);
        subLayer.position = CGPointMake(100, 100);
//        [subLayer setNeedsDisplay];
        [subLayer display];
        [_layer addSublayer:subLayer];
    } else {
        for (CALayer *layer in _layer.sublayers) {
            if ([layer isKindOfClass:[QYLayer class]]) {
                [layer removeFromSuperlayer];
            }
        }
    }
}


@end
