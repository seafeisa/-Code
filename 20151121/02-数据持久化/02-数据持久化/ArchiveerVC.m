//
//  ArchiveerVC.m
//  02-数据持久化
//
//  Created by qingyun on 15/11/23.
//  Copyright (c) 2015年 hnqingyun. All rights reserved.
//

#import "ArchiveerVC.h"
#import "Students.h"

@interface ArchiveerVC ()
@property (weak, nonatomic) IBOutlet UITextField *name;
@property (weak, nonatomic) IBOutlet UITextField *sex;
@property (weak, nonatomic) IBOutlet UITextField *age;

@property (nonatomic,strong) Students *student;
@property (nonatomic,strong) NSString *path;
@end

@implementation ArchiveerVC

- (void)viewDidLoad {
    [super viewDidLoad];
    [self miscInit];
    [self loadData];
}
- (IBAction)Save:(id)sender {
    _student = [[Students alloc] init];
    
    _student.name = _name.text;
    _student.age = [_age.text integerValue];
    _student.sex = _sex.text;
    
    // 将模型序列化后存入本地
    if ([NSKeyedArchiver archiveRootObject:_student toFile:_path]) {
        NSLog(@"ok..");
    }
}

-(void)miscInit
{
    NSString *docmentPath = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES)[0];
    _path = [docmentPath stringByAppendingPathComponent:@"student.data"];
    NSLog(@"%@",_path);
}
-(void)loadData
{
    NSFileManager *manage = [NSFileManager defaultManager];
    if (![manage fileExistsAtPath:_path]) {
        NSLog(@"错我");
        return;
    }
    _student = [NSKeyedUnarchiver unarchiveObjectWithFile:_path];
    if (_student == nil) {
        NSLog(@"NO DATA");
        return;
    }
    NSLog(@"OK!");
    _name.text = _student.name;
    _age.text =[@(_student.age) stringValue] ;
    _sex.text = _student.sex;
}
-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [self.view endEditing:YES];
}
@end
