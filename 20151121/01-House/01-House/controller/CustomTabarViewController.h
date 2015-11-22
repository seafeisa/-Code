//
//  CustomTabarViewController.h
//  01-House
//
//  Created by qingyun on 15/11/20.
//  Copyright (c) 2015年 hnqingyun. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface CustomLab : UILabel
//lab选中状态
@property(nonatomic,assign) BOOL isselect;
@end


@interface  CustomView : UIControl
//是否选中
@property(nonatomic,assign) BOOL isSelect;
//icon图片 tabar图片
@property(nonatomic,strong) UIImageView *iconImage;
//titleLab 标题
@property(nonatomic,strong) CustomLab *titleLab;
@end


@interface CustomTabarViewController : UITabBarController

@end
