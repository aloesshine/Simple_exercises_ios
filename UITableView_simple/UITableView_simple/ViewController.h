//
//  ViewController.h
//  UITableView_simple
//
//  Created by aloes on 16/3/2.
//  Copyright © 2016年 aloes. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *trash;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *text;

- (IBAction)allSelect:(UIBarButtonItem *)sender;

- (IBAction)remove:(UIBarButtonItem *)sender;
@end

