//
//  ViewController.h
//  linkman_manage
//
//  Created by aloes on 16/2/18.
//  Copyright (c) 2016年 aloes. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RowView.h"

@interface ViewController : UIViewController

@property (weak, nonatomic) IBOutlet UIBarButtonItem *trash;

- (IBAction)btnClick:(UIButton *)sender;

- (IBAction)add:(UIBarButtonItem *)sender;

- (IBAction)remove:(UIBarButtonItem *)sender;
@end

