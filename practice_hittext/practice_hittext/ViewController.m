//
//  ViewController.m
//  practice_hittext
//
//  Created by aloes on 16/6/2.
//  Copyright © 2016年 aloes. All rights reserved.
//

#import "ViewController.h"
#import "PopButton.h"

@interface ViewController ()

@property (nonatomic, weak) IBOutlet PopButton *popbtn;

@end

@implementation ViewController

- (IBAction)popBtn:(PopButton *)sender
{
    UIButton *chatView = [UIButton buttonWithType:UIButtonTypeCustom];
    chatView.bounds = CGRectMake(0, 0, 200, 200);
    chatView.center = CGPointMake(100, -100);
    [chatView setBackgroundImage:[UIImage imageNamed:@"对话框"] forState:UIControlStateNormal];
    [chatView setBackgroundImage:[UIImage imageNamed:@"小孩"] forState:UIControlStateHighlighted];
    sender.chatBtn = chatView;
    
    [sender addSubview:chatView];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
