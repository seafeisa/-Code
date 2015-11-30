//
//  UPDateViewController.m
//  02-数据持久化
//
//  Created by qingyun on 15/11/26.
//  Copyright (c) 2015年 hnqingyun. All rights reserved.
//

#import "UPDateViewController.h"
#import "DBOperation.h"
#import "Student.h"

@interface UPDateViewController ()<UINavigationControllerDelegate,UIImagePickerControllerDelegate>
@property (weak, nonatomic) IBOutlet UITextField *tfID;
@property (weak, nonatomic) IBOutlet UITextField *tfName;
@property (weak, nonatomic) IBOutlet UIImageView *iconImage;
@property (weak, nonatomic) IBOutlet UITextField *tfAge;
@end

@implementation UPDateViewController
- (IBAction)upDateAction:(id)sender {
   //值赋给模型
    Student *mode=[Student studentsWithID:_tfID.text.integerValue name:_tfName.text age:_tfAge.text.integerValue icon:_iconImage.image];
    //执行更新操作
    if ([[DBOperation sharderHandle] upDateFromMode:mode]) {
        UIAlertView *alter=[[UIAlertView alloc] initWithTitle:@"提示" message:@"更新成功" delegate:nil cancelButtonTitle:@"取消" otherButtonTitles:nil, nil];
        [alter show];
    }
}

-(void)tapAction:(UITapGestureRecognizer*)tap{
 //调用相机或者相册
    UIImagePickerController *picKerView=[[UIImagePickerController alloc] init];
    picKerView.sourceType=UIImagePickerControllerSourceTypeSavedPhotosAlbum;
    //设置pickView delegate
    picKerView.delegate=self;
    [self presentViewController:picKerView animated:YES completion:nil];
}

-(void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info{
    //取出image
    UIImage *image=info[@"UIImagePickerControllerOriginalImage"];
    
    _iconImage.image=image;
    
    //取消模态
    [self dismissViewControllerAnimated:YES completion:nil];
}


- (void)viewDidLoad {
    _iconImage.userInteractionEnabled=YES;
    UITapGestureRecognizer *tapGesture=[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapAction:)];
    //
    tapGesture.numberOfTapsRequired=1;
    [_iconImage addGestureRecognizer:tapGesture];
    
    
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
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
