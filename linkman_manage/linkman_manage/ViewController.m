//
//  ViewController.m
//  linkman_manage
//
//  Created by aloes on 16/2/18.
//  Copyright (c) 2016年 aloes. All rights reserved.
//

#import "ViewController.h"
#define kRowH 44
#define kDuration 0.3

@interface ViewController ()
{
    NSArray *_name;
}

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    _name = @[@"祝思涵",@"屈子濯",@"申姝娴",@"朱玥昕",@"宋晨曦",@"袁梓棋",@"程煦涵",@"刘易轩"];
}

#pragma mark 删除行
- (IBAction)btnClick:(UIButton *)sender
{
    [UIView animateWithDuration:kDuration animations:^{
        sender.superview.frame = CGRectMake(0, sender.superview.frame.origin.y - kRowH - 1, 0, 0);
        sender.superview.alpha = 0;
    } completion:^(BOOL finished) {
        int start = (int)[self.view.subviews indexOfObject:sender.superview];
        [sender.superview removeFromSuperview];
        _trash.enabled = self.view.subviews.count > 1;
        [UIView animateWithDuration:kDuration animations:^{
            for (int i = start; i < self.view.subviews.count; i++)
            {
                UIView *temp = self.view.subviews[i];
                temp.frame = CGRectMake(0, temp.frame.origin.y - kRowH - 1, 320, kRowH);
            }
        }];
    }];
}

#pragma mark 添加一行
- (IBAction)add:(UIBarButtonItem *)sender
{
//    NSString *image = [NSString stringWithFormat:@"01%d.png",arc4random_uniform(9)];
//    NSString *name = _name[arc4random_uniform((u_int32_t)_name.count)];
    RowView *rowView = [RowView rowViewIcon];
    
    UIView *last = [self.view.subviews lastObject];
    
    rowView.frame = CGRectMake(0, last.frame.origin.y, 0, 0);
    rowView.alpha = 0;
    
    [UIView animateWithDuration:kDuration animations:^{
        [self.view addSubview:rowView];
        rowView.frame = CGRectMake(0, last.frame.origin.y + kRowH + 1, 320, kRowH);
        rowView.alpha = 1;
    } completion:^(BOOL finished) {
        _trash.enabled = YES;
    }];
   
}

#pragma mark 删除最后一行
- (IBAction)remove:(UIBarButtonItem *)sender
{
    RowView *last = [self.view.subviews lastObject];
    
    [UIView animateWithDuration:kDuration animations:^{
        last.frame = CGRectMake(0, last.frame.origin.y - kRowH - 1, 0, 0);
        last.alpha = 0;
    } completion:^(BOOL finished) {
        [last removeFromSuperview];
        _trash.enabled = self.view.subviews.count > 1;
    }];
}
@end
