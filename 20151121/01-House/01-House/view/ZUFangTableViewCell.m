//
//  ZUFangTableViewCell.m
//  01-House
//
//  Created by qingyun on 15/11/20.
//  Copyright (c) 2015年 hnqingyun. All rights reserved.
//

#import "ZUFangTableViewCell.h"
#import "HouseInfo.h"
@implementation ZUFangTableViewCell

-(void)setMode:(HouseInfo *)mode{
    _mode=mode;
    _titleLab.text=mode.title;
    _QuLab.text=mode.community;
    _pLab.text=mode.simpleadd;
    _htypeLab.text=mode.housetype;
    _priceLab.text=[NSString stringWithFormat:@"%@/月",[mode.price stringValue]];
}


- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
