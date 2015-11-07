//
//  ViewController.m
//  03-touchesDemo
//
//  Created by qingyun on 15/11/6.
//  Copyright (c) 2015年 hnqingyun. All rights reserved.
//

#import "ViewController.h"
#import "CustomTf.h"


@interface ViewController ()

@property (weak, nonatomic) IBOutlet UIButton *tempBtn;
@property (weak, nonatomic) IBOutlet CustomTf *tempTF;
@end

@implementation ViewController

-(void)clickMe{
    
    NSLog(@"=====%s",__func__);
}

- (IBAction)tfResgister:(id)sender {
    
    
    [_tempTF resignFirstResponder];
    
}



- (void)viewDidLoad {

    [_tempBtn addTarget:nil action:@selector(clickMe) forControlEvents:UIControlEventTouchUpInside];
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    
    
    NSLog(@"========%s",__func__);
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
