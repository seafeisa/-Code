//
//  SQLiteViewController.m
//  02-数据持久化
//
//  Created by qingyun on 15/11/24.
//  Copyright (c) 2015年 hnqingyun. All rights reserved.
//

#import "SQLiteViewController.h"
#import "studentsModel.h"
#import "dataBaseOperation.h"
@interface SQLiteViewController ()
@property (weak, nonatomic) IBOutlet UITextField *tfID;
@property (weak, nonatomic) IBOutlet UITextField *tfName;
@property (weak, nonatomic) IBOutlet UITextField *tfAge;
@property (weak, nonatomic) IBOutlet UIImageView *icon;

@end

@implementation SQLiteViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}
- (IBAction)save:(id)sender {
    studentsModel *studentmodel = [studentsModel studentsWithID:[_tfID.text integerValue] name:_tfName.text age:[_tfAge.text integerValue] icon:_icon.image];
    
    [[dataBaseOperation sharderHandle] insertInto:studentmodel];
}


-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [self.view endEditing:YES];
}

@end
