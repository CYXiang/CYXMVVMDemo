//
//  CYXLoginViewModel.h
//  CYXMVVMDemo
//
//  Created by apple开发 on 16/4/20.
//  Copyright © 2016年 cyx. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CYXLoginViewModel : NSObject

@property(nonatomic, strong) NSString *userName;/**<<#注释#>*/
@property(nonatomic, strong) NSString *password;/**<<#注释#>*/

@property(nonatomic, strong) RACSubject *successObject;/**<<#注释#>*/
@property(nonatomic, strong) RACSubject *failureObject;/**<<#注释#>*/
@property(nonatomic, strong) RACSubject *errorObject;/**<<#注释#>*/

- (id)buttonIsValid;
- (void)login;

@end
