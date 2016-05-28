//
//  LoginViewController.h
//  Address Book
//
//  Created by aloes on 16/5/26.
//  Copyright © 2016年 aloes. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LoginViewController : UIViewController
@property (weak, nonatomic) IBOutlet UITextField *idTextField;
@property (weak, nonatomic) IBOutlet UITextField *pwdTextField;
@property (weak, nonatomic) IBOutlet UISwitch *rmbSwitch;
@property (weak, nonatomic) IBOutlet UISwitch *autologinSwitch;
@property (weak, nonatomic) IBOutlet UIButton *loginButton;

@end
