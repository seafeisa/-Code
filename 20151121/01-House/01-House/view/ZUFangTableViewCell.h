//
//  ZUFangTableViewCell.h
//  01-House
//
//  Created by qingyun on 15/11/20.
//  Copyright (c) 2015年 hnqingyun. All rights reserved.
//

#import <UIKit/UIKit.h>
@class HouseInfo;
@interface ZUFangTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *titleLab;         //标题
@property (weak, nonatomic) IBOutlet UILabel *priceLab;         //价格
@property (weak, nonatomic) IBOutlet UIImageView *iconImageView; //icon
@property (weak, nonatomic) IBOutlet UILabel *QuLab;            //小区
@property (weak, nonatomic) IBOutlet UILabel *pLab;             //片区
@property (weak, nonatomic) IBOutlet UILabel *htypeLab;         //户型
@property(nonatomic,strong)HouseInfo *mode;
@end
