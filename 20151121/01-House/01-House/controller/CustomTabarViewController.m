//
//  CustomTabarViewController.m
//  01-House
//
//  Created by qingyun on 15/11/20.
//  Copyright (c) 2015年 hnqingyun. All rights reserved.
//

#import "CustomTabarViewController.h"
#define RGB(r,g,b,a) [UIColor colorWithRed:r/255.0 green:g/255.0 blue:b/255.0 alpha:a];


@implementation CustomLab

-(void)setIsselect:(BOOL)isselect{
    //设置label的选中状态
    if (isselect) {
        self.textColor=[UIColor blueColor];
    }else{
        self.textColor=RGB(147, 147, 147, 1);
    }
    _isselect=isselect;
}

@end



@implementation CustomView
-(void)setIconImage:(UIImageView *)iconImage{
    
    if (_iconImage!=nil) {
        [_iconImage removeFromSuperview];
        _iconImage=nil;
      }
    _iconImage=iconImage;
    [self addSubview:_iconImage];
}

-(void)setTitleLab:(CustomLab *)titleLab{
    _titleLab=titleLab;
    if (_titleLab!=nil) {
        [_titleLab removeFromSuperview];
        _titleLab=nil;
    }
    _titleLab=titleLab;
    [self addSubview:_titleLab];
}

-(void)setIsSelect:(BOOL)isSelect{
    //if (isSelect) {
        _isSelect=isSelect;
   // }
    _iconImage.highlighted=isSelect;
    _titleLab.isselect=isSelect;
}

@end


@interface CustomTabarViewController ()
@property(nonatomic,assign) NSInteger clickTag;

@end

@implementation CustomTabarViewController
//移除以前所有的视图
-(void)removeViewFormSuperView{
    for (UIView *view in self.tabBar.subviews) {
        [view removeFromSuperview];
    }
}

-(void)clickValue:(CustomView *)custom{
 //设置选中状态
    if (!custom.isSelect) {
        custom.isSelect=YES;
        CustomView *proView=(CustomView *)[self.view viewWithTag:_clickTag];
        proView.isSelect=NO;
        _clickTag=custom.tag;
        self.selectedIndex=_clickTag-1;
    }
}


-(void)addsubView{
//添加视图tabar
    UIView *tabarView=[[UIView alloc] initWithFrame:CGRectMake(0,[UIScreen mainScreen].bounds.size.height-50,[UIScreen mainScreen].bounds.size.width, 50)];
    tabarView.backgroundColor=RGB(241, 244, 244, 1);
    [self.view addSubview:tabarView];
    
    UIView *line=[[UIView alloc] initWithFrame:CGRectMake(0, 0, tabarView.frame.size.width, 2)];
    line.backgroundColor=RGB(87, 156, 255, 1)
    
    
    NSArray *imageArr=@[@"底部导航-租房未点击",@"底部导航-二手未点击",@"底部导航-个人未点击"];
    NSArray *imageClickArr=@[@"底部导航-租房点击",@"底部导航-二手点击",@"底部导航-个人点击"];
    NSArray *titleArr=@[@"租房",@"二手",@"个人"];
    float width=[UIScreen mainScreen].bounds.size.width/imageArr.count;
    for (int i=0; i<imageArr.count; i++) {
      CustomView *bgView=[[CustomView alloc] initWithFrame:CGRectMake(width*i, 0, width, tabarView.frame.size.height)];
     bgView.tag=i+1;
     [bgView addTarget:self action:@selector(clickValue:) forControlEvents:UIControlEventTouchUpInside];
        
    //添加imageView
        UIImage *image=[UIImage imageNamed:imageArr[i]];
        CGSize size=image.size;
        float x=(bgView.frame.size.width-size.width)/2.0;
        float y=(bgView.frame.size.height-14-image.size.height)/2.0;
        UIImageView *imageView=[[UIImageView alloc] initWithFrame:CGRectMake(x,y,size.width, size.height)];
        imageView.image=image;
        imageView.highlightedImage=[UIImage imageNamed:imageClickArr[i]];
        bgView.iconImage=imageView;
    
        
        //添加lable
        CustomLab *lab=[[CustomLab alloc] initWithFrame:CGRectMake(0, bgView.frame.size.height-14, bgView.frame.size.width, 13)];
        lab.textAlignment=NSTextAlignmentCenter;
        lab.backgroundColor=[UIColor clearColor];
        lab.font=[UIFont systemFontOfSize:12];
        lab.text=titleArr[i];
        bgView.titleLab=lab;
    
        
        if(i==0){
            bgView.isSelect=YES;
            _clickTag=bgView.tag;
        }else{
            bgView.isSelect=NO;
        }
        [tabarView addSubview:bgView];
    }
    [tabarView addSubview:line];

}

- (void)viewDidLoad {
    [self removeViewFormSuperView];
    
    
    [self addsubView];
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
