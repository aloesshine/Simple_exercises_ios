//
//  AddViewController.m
//  Address Book
//
//  Created by aloes on 16/5/28.
//  Copyright © 2016年 aloes. All rights reserved.
//

#import "AddViewController.h"
#import "Contact.h"

@interface AddViewController ()
@property (weak, nonatomic) IBOutlet UITextField *nameTextField;
@property (weak, nonatomic) IBOutlet UITextField *phoneTextField;
@property (weak, nonatomic) IBOutlet UIButton *addButton;

@end

@implementation AddViewController

// view显示完毕调用
- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:YES];
    [_nameTextField becomeFirstResponder];
}

- (IBAction)add:(UIButton *)sender
{
    // 将文本框内容转化成模型
    Contact *c = [Contact contactWithName:_nameTextField.text Phone:_phoneTextField.text];
    
    // 让block传递模型
    if (_block)
    {
        _block(c);
    }
    
    // 返回
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    
    [_nameTextField addTarget:self action:@selector(textChange) forControlEvents:UIControlEventEditingChanged];
    [_phoneTextField addTarget:self action:@selector(textChange) forControlEvents:UIControlEventEditingChanged];
    
    [self textChange];
    
     
}


- (void)textChange
{
    _addButton.enabled = _nameTextField.text.length && _phoneTextField.text.length;
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
