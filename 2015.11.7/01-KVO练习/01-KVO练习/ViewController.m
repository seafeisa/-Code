//
//  ViewController.m
//  01-KVO练习
//
//  Created by qingyun on 15/11/9.
//  Copyright (c) 2015年 hnqingyun. All rights reserved.
//

#import "ViewController.h"
#import "QYmode.h"
@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIView *tempView;
@property (strong,nonatomic) QYmode *mode;
@property(nonatomic,assign) CGFloat maxY;
@property(nonatomic,strong) NSArray *colors;
@end

@implementation ViewController



-(void)actionUp:(UISwipeGestureRecognizer*)gesture{
   //修改mode的value值
    if (gesture.direction==UISwipeGestureRecognizerDirectionUp) {
        _mode.value+=100;

    }else{
        if (_mode.value!=100) {
            _mode.value-=100;
        }else if(_mode.value==100){
            UIAlertView *alter=[[UIAlertView alloc] initWithTitle:@"提示" message:@"血量不足请加血!" delegate:nil cancelButtonTitle:@"取消" otherButtonTitles:nil, nil];
            [alter show];
        }
    }
    
}

-(NSArray *)colors{
    if (_colors==nil) {
        
        _colors=@[[UIColor yellowColor],[UIColor greenColor],[UIColor purpleColor],[UIColor redColor]];
    }

    return _colors;
}



- (void)viewDidLoad {
    //1添加手势
    UISwipeGestureRecognizer *swipeUp=[[UISwipeGestureRecognizer  alloc] initWithTarget:self action:@selector(actionUp:)];
    swipeUp.direction=UISwipeGestureRecognizerDirectionUp;
    [_tempView addGestureRecognizer:swipeUp];
    
    UISwipeGestureRecognizer *swipeDown=[[UISwipeGestureRecognizer alloc] initWithTarget:self
                                         action:@selector(actionUp:)];
    swipeDown.direction=UISwipeGestureRecognizerDirectionDown;
    [_tempView addGestureRecognizer:swipeDown];
    
    //2初始化mode 添加kvo 监听
    _mode=[QYmode new];
    //添加监听
    [_mode addObserver:self forKeyPath:@"value" options:NSKeyValueObservingOptionNew context:(__bridge void*)(_tempView)];
    
    //取最大的Y值
    _maxY=CGRectGetMaxY(_tempView.frame);

    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

#pragma mark 实现属性监听  更新ui
-(void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context{
    if ([keyPath isEqualToString:@"value"]) {
    //取出值
        int value=[change[@"new"] intValue];
    //刷新ui
        UIView *temp=(__bridge UIView *)(context);
        CGRect rect=temp.frame;
        rect.size.height=value;
        rect.origin.y=_maxY-rect.size.height;
        temp.frame=rect;
        //设置颜色
        temp.backgroundColor=self.colors[(value/100)-1];
    };
}

-(void)dealloc{
    [_mode removeObserver:self forKeyPath:@"value"];
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
