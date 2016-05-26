//
//  LoginViewController.m
//  Address Book
//
//  Created by aloes on 16/5/26.
//  Copyright © 2016年 aloes. All rights reserved.
//

#import "LoginViewController.h"
#import "MBProgressHUD+XMG.h"

@interface LoginViewController ()

@end

@implementation LoginViewController

- (IBAction)login:(UIButton *)sender
{
    // 正在登录蒙板
    [MBProgressHUD showMessage:@"Logging in..."];
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        
        // 取消蒙板
        [MBProgressHUD hideHUD];
        
        if ([_idTextField.text isEqualToString:@"gcx"] && [_pwdTextField.text isEqualToString:@"123"] )
        {
            [self performSegueWithIdentifier:@"login2contact" sender:nil];
        }
        else
        {
            [MBProgressHUD showError:@"User id or password is wrong"];
        }
        
    });
}

- (IBAction)rmbChange:(UISwitch *)sender
{
    if (_rmbSwitch.on == NO)
    {
        [_autologinSwitch setOn:NO animated:YES];
    }
}

- (IBAction)autologinChange:(UISwitch *)sender
{
    if (_autologinSwitch.on == YES)
    {
        [_rmbSwitch setOn:YES animated:YES];
    }
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [_idTextField addTarget:self action:@selector(textChange) forControlEvents:UIControlEventEditingChanged];
    [_pwdTextField addTarget:self action:@selector(textChange) forControlEvents:UIControlEventEditingChanged];
}


- (void)textChange
{
    _loginButton.enabled = _idTextField.text.length && _pwdTextField.text.length;
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
