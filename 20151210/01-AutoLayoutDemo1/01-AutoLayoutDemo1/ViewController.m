//
//  ViewController.m
//  01-AutoLayoutDemo1
//
//  Created by qingyun on 15/12/10.
//  Copyright (c) 2015年 hnqingyun. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (nonatomic, strong) UIView *redView;
@property (nonatomic, strong) UIView *blueView;
@property (nonatomic, strong) UIView *greenView;
@end

@implementation ViewController

#pragma mark - life cycle
- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.view addSubview:self.redView];
    [self.view addSubview:self.blueView];
    [self.view addSubview:self.greenView];
    
    [self setupLayout];
}

#pragma mark - setters & getters
- (UIView *)redView {
    if (_redView == nil) {
        _redView = [[UIView alloc] init];
        _redView.backgroundColor = [UIColor redColor];
        _redView.translatesAutoresizingMaskIntoConstraints = NO;
    }
    return _redView;
}

- (UIView *)greenView {
    if (_greenView == nil) {
        _greenView = [[UIView alloc] init];
        _greenView.backgroundColor = [UIColor greenColor];
        _greenView.translatesAutoresizingMaskIntoConstraints = NO;
    }
    return _greenView;
}

- (UIView *)blueView {
    if (_blueView == nil) {
        _blueView = [[UIView alloc] init];
        _blueView.backgroundColor = [UIColor blueColor];
        _blueView.translatesAutoresizingMaskIntoConstraints = NO;
    }
    return _blueView;
}

#pragma mark - events handling

#pragma mark - layout
- (void)setupLayout {
//    NSLayoutConstraint *redViewLeft = [NSLayoutConstraint constraintWithItem:self.redView attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeLeft multiplier:1 constant:20];
//    NSLayoutConstraint *redViewTop = [NSLayoutConstraint constraintWithItem:self.redView attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeTop multiplier:1 constant:20];
//    NSLayoutConstraint *redViewRight = [NSLayoutConstraint constraintWithItem:self.redView attribute:NSLayoutAttributeRight relatedBy:NSLayoutRelationEqual toItem:self.blueView attribute:NSLayoutAttributeLeft multiplier:1 constant:-20];
//    NSLayoutConstraint *redViewBottom = [NSLayoutConstraint constraintWithItem:self.redView attribute:NSLayoutAttributeBottom relatedBy:NSLayoutRelationEqual toItem:self.greenView attribute:NSLayoutAttributeTop multiplier:1 constant:-20];
//    NSLayoutConstraint *redViewWidth = [NSLayoutConstraint constraintWithItem:self.redView attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:self.blueView attribute:NSLayoutAttributeWidth multiplier:1 constant:0];
//    NSLayoutConstraint *redViewHeight1 = [NSLayoutConstraint constraintWithItem:self.redView attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:self.blueView attribute:NSLayoutAttributeHeight multiplier:1 constant:0];
//    NSLayoutConstraint *redViewHeight2 = [NSLayoutConstraint constraintWithItem:self.redView attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:self.greenView attribute:NSLayoutAttributeHeight multiplier:1 constant:0];
//    
//    NSLayoutConstraint *blueViewRight = [NSLayoutConstraint constraintWithItem:self.blueView attribute:NSLayoutAttributeRight relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeRight multiplier:1 constant:-20];
//    NSLayoutConstraint *blueViewCenter = [NSLayoutConstraint constraintWithItem:self.blueView attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:self.redView attribute:NSLayoutAttributeCenterY multiplier:1 constant:0];
//    
//    
//    NSLayoutConstraint *greeViewBottom = [NSLayoutConstraint constraintWithItem:self.greenView attribute:NSLayoutAttributeBottom relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeBottom multiplier:1 constant:-20];
//    NSLayoutConstraint *greenViewLeft = [NSLayoutConstraint constraintWithItem:self.greenView attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeLeft multiplier:1 constant:20];
//    NSLayoutConstraint *greenViewRight = [NSLayoutConstraint constraintWithItem:self.greenView attribute:NSLayoutAttributeRight relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeRight multiplier:1 constant:-20];
//    
//    [self.view addConstraints:@[redViewBottom, redViewHeight1, redViewHeight2, redViewLeft, redViewRight, redViewTop, redViewWidth, blueViewCenter, blueViewRight, greenViewLeft, greenViewRight, greeViewBottom]];
}

#pragma mark - misc

@end
