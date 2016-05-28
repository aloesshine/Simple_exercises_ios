//
//  EditViewController.m
//  Address Book
//
//  Created by aloes on 16/5/28.
//  Copyright © 2016年 aloes. All rights reserved.
//

#import "EditViewController.h"
#import "Contact.h"

@interface EditViewController ()

@property (weak, nonatomic) IBOutlet UITextField *nameField;
@property (weak, nonatomic) IBOutlet UITextField *phoneField;
@property (weak, nonatomic) IBOutlet UIButton *SaveButton;

@end

@implementation EditViewController

- (IBAction)save:(UIButton *)sender
{
    // 修改模型
    _contact.name = _nameField.text;
    _contact.phone = _phoneField.text;
    
    // 让block刷新表格
    if (_block) {
        _block();
    }
    
    // 返回联系人控制器
    [self.navigationController popViewControllerAnimated:YES];
}

- (IBAction)edit:(UIBarButtonItem *)sender
{
    if ([sender.title isEqualToString:@"Edit"])
    {
        sender.title = @"Cancel";
        
        _nameField.enabled = YES;
        _phoneField.enabled = YES;
        
        [_phoneField becomeFirstResponder];
        
        _SaveButton.hidden = NO;
        
    }
    else
    {
        sender.title = @"Edit";
        
        _nameField.enabled = NO;
        _phoneField.enabled = NO;
        
        _SaveButton.hidden = YES;
        
        _nameField.text = _contact.name;
        _phoneField.text = _contact.phone;

    }
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    _nameField.text = _contact.name;
    _phoneField.text = _contact.phone;
    
    _nameField.enabled = NO;
    _phoneField.enabled = NO;
    
    
    [_nameField addTarget:self action:@selector(textChange) forControlEvents:UIControlEventEditingChanged];
    [_phoneField addTarget:self action:@selector(textChange) forControlEvents:UIControlEventEditingChanged];
    
    [self textChange];
    
}

- (void)textChange
{
    _SaveButton.enabled = _nameField.text.length && _phoneField.text.length;
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
