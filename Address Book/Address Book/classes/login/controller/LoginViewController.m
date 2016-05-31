//
//  LoginViewController.m
//  Address Book
//
//  Created by aloes on 16/5/26.
//  Copyright © 2016年 aloes. All rights reserved.
//

#import "LoginViewController.h"
#import "MBProgressHUD+XMG.h"

#define keyId @"id"
#define keyPwd @"password"
#define keyRmb @"remember"
#define keyAutoLogin @"autoLogin"


@interface LoginViewController ()

@end

@implementation LoginViewController

// 跳转之前调用
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    segue.destinationViewController.title = [NSString stringWithFormat:@"%@'s Contact List",_idTextField.text];
}

- (IBAction)login:(UIButton *)sender
{
    // 正在登录蒙板
    [MBProgressHUD showMessage:@"Login..."];
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.1* NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        
        // 取消蒙板
        [MBProgressHUD hideHUD];
        
        if ([_idTextField.text isEqualToString:@"gcx"] && [_pwdTextField.text isEqualToString:@"123"] )
        {
            // 存储数据，用户名，密码，记住密码，自动登录
            // 偏好设置
            NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
            [defaults setObject:_idTextField.text forKey:keyId];
            [defaults setObject:_pwdTextField.text forKey:keyPwd];
            [defaults setBool:_rmbSwitch.on forKey:keyRmb];
            [defaults setBool:_autologinSwitch.on forKey:keyAutoLogin];
            
            // 跳转到联系人界面
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
    // 读取存储数据
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    NSString *id = [defaults stringForKey:keyId];
    NSString *pwd = [defaults stringForKey:keyPwd];
    BOOL rmbp = [defaults boolForKey:keyRmb];
    BOOL autol = [defaults boolForKey:keyAutoLogin];
    
    _idTextField.text = id;
    
    if (rmbp == YES) {
        _pwdTextField.text = pwd;
    }
    
    _rmbSwitch.on = rmbp;
    _autologinSwitch.on = autol;
    
    if (autol == YES) {
        [self login:nil];
    }
    
    
    [_idTextField addTarget:self action:@selector(textChange) forControlEvents:UIControlEventEditingChanged];
    [_pwdTextField addTarget:self action:@selector(textChange) forControlEvents:UIControlEventEditingChanged];
    
    [self textChange];
    
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
