//
//  ViewController.m
//  09-水印图片
//
//  Created by qingyun on 15/12/5.
//  Copyright (c) 2015年 hnqingyun. All rights reserved.
//

#import "ViewController.h"
#import "UIImage+Drawing.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *waterImage;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (IBAction)createWaterImage:(id)sender {
    UIImage *image = [UIImage imageNamed:@"pic.jpg"];
    UIImage *logo = [UIImage imageNamed:@"logo.jpg"];
    _waterImage.image = [image waterImageWithLogo:logo];
}

@end
