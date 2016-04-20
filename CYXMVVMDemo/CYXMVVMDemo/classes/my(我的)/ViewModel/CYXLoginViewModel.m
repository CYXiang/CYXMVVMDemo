//
//  CYXLoginViewModel.m
//  CYXMVVMDemo
//
//  Created by apple开发 on 16/4/20.
//  Copyright © 2016年 cyx. All rights reserved.
//

#import "CYXLoginViewModel.h"

@interface CYXLoginViewModel ()

@property(nonatomic, strong) RACSignal *userNameSignal;/**<<#注释#>*/
@property(nonatomic, strong) RACSignal *passwordSignal;/**<<#注释#>*/
@property(nonatomic, strong) NSArray *requestData;/**<<#注释#>*/

@end

@implementation CYXLoginViewModel

- (instancetype)init{
    
    self = [super init];
    if (self) {
        [self initialze];
    }
    return self;
}
/**
 *  初始化
 */
- (void)initialze{
    
    _userNameSignal = RACObserve(self, userName);
    _passwordSignal = RACObserve(self, password);
    _successObject = [RACSubject subject];
    _failureObject = [RACSubject subject];
    _errorObject = [RACSubject subject];
    
}

/**
 *  合并两个输入框信号，并返回按钮bool类型的值
 */
- (id)buttonIsValid{
    
    RACSignal *isVaid = [RACSignal combineLatest:@[_userNameSignal, _passwordSignal] reduce:^id{
        return @(_userName.length >= 3 && _password.length >= 3);
    }];
    
    return isVaid;
}

/**
 *  登录点击
 */
- (void)login{
    
    _requestData = @[_userName, _password];
    
    [_successObject sendNext:_requestData];
    
    
    
}
@end
