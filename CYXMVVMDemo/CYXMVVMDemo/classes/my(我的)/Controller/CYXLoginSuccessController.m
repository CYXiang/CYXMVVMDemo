//
//  CYXLoginSuccessController.m
//  CYXMVVMDemo
//
//  Created by apple开发 on 16/4/20.
//  Copyright © 2016年 cyx. All rights reserved.
//

#import "CYXLoginSuccessController.h"
@interface CYXLoginSuccessController ()
@property (strong, nonatomic) IBOutlet UILabel *label;

@end

@implementation CYXLoginSuccessController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    self.label.text = [NSString stringWithFormat:@"%@,%@",self.userName,self.password];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)backClick {
    
    [self dismissViewControllerAnimated:YES completion:nil];
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
