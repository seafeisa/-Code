//
//  ViewController.m
//  03-KVOdemo
//
//  Created by qingyun on 15/11/7.
//  Copyright (c) 2015年 hnqingyun. All rights reserved.
//

#import "ViewController.h"
#import "PersonMode.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UILabel *ageLabe;
@property(nonatomic,strong)PersonMode *mode;
@property(nonatomic,assign)int age;

@end

@implementation ViewController
//int age=10;
- (IBAction)ageAction:(id)sender {
    //_mode.age+=1;
    //[NSNumber numberWithInt:_mode.age++];
    _age+=1;
    [_mode setValue:@(_age) forKey:@"age"];
    
}

- (void)viewDidLoad {
    //1声明person对象
    _mode=[PersonMode new];
    _mode.name=@"mars";
    _mode.age=10;
   
    //添加属性监听方法
    [_mode addObserver:self forKeyPath:@"age" options:NSKeyValueObservingOptionNew|NSKeyValueObservingOptionOld context:NULL];
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

#pragma mark 监听
-(void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context{
    //判断是否那个属性
    if ([keyPath isEqualToString:@"age"]) {
        int age=[change[@"new"] intValue];
        //刷新UI
        _ageLabe.text=[NSString stringWithFormat:@"%d",age];
        
    }
}

-(void)dealloc{
    //移除
    [_mode removeObserver:self forKeyPath:@"age"];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
