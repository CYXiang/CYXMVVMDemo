//
//  ViewController.m
//  CYXMVVMDemo
//
//  Created by apple开发 on 16/1/6.
//  Copyright © 2016年 cyx. All rights reserved.
//

#import "ViewController.h"
#import "CYXLoginSuccessController.h"
#import "CYXLoginViewModel.h"

@interface ViewController ()
@property (strong, nonatomic) IBOutlet UITextField *userNameTextField;
@property (strong, nonatomic) IBOutlet UITextField *passWordTextField;
@property (strong, nonatomic) IBOutlet UIButton *loginBtn;

@property(nonatomic, strong) CYXLoginViewModel *viewModel;/**<<#注释#>*/
@property(nonatomic, strong) NSArray *dataSource;/**<<#注释#>*/


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self bindModel];
    
    [self onClick];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/**
 *  关联ViewModel
 */
- (void)bindModel{
    _viewModel = [[CYXLoginViewModel alloc]init];
    
    RAC(self.viewModel,userName) = self.userNameTextField.rac_textSignal;
    RAC(self.viewModel,password) = self.passWordTextField.rac_textSignal;
    RAC(self.loginBtn,enabled) = [_viewModel buttonIsValid];
    
    
    @weakify(self);
    [self.viewModel.successObject subscribeNext:^(NSArray *x) {
        @strongify(self);
        CYXLoginSuccessController *vc = [[UIStoryboard storyboardWithName:@"CYXLoginSuccessController" bundle:[NSBundle mainBundle]] instantiateViewControllerWithIdentifier:@"LoginViewController"];
        
        vc.userName = x[0];
        vc.password = x[1];
        [self presentViewController:vc animated:YES completion:^{
            
        }];
        
    }];
    
    [self.viewModel.failureObject subscribeNext:^(id x) {
        
    }];
    
    [self.viewModel.errorObject subscribeNext:^(id x) {
        
    }];
    
}

- (void)onClick{
    
    [[self.loginBtn rac_signalForControlEvents:UIControlEventTouchUpInside] subscribeNext:^(id x) {
        [_viewModel login];
    }];
    
}




@end
