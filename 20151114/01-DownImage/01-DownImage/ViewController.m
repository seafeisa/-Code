//
//  ViewController.m
//  01-DownImage
//
//  Created by qingyun on 15/11/14.
//  Copyright (c) 2015年 hnqingyun. All rights reserved.
//

#import "ViewController.h"
#define baseurl @"http://image.baidu.com/search/down?tn=download&ipn=dwnl&word=download&ie=utf8&fr=result&url=http%3A%2F%2Fpic14.nipic.com%2F20110522%2F7411759_164157418126_2.jpg"
@interface ViewController ()

@property (weak, nonatomic) IBOutlet UIImageView *tempImageView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

-(void)loadimageView{
    sleep(2);
    NSData *data=[NSData dataWithContentsOfURL:[NSURL URLWithString:baseurl]];
    _tempImageView.image=[UIImage imageWithData:data];

}
-(void)viewDidAppear:(BOOL)animated{
    [self loadimageView];

}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
