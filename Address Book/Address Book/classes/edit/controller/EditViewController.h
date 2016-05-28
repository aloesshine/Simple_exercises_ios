//
//  EditViewController.h
//  Address Book
//
//  Created by aloes on 16/5/28.
//  Copyright © 2016年 aloes. All rights reserved.
//

#import <UIKit/UIKit.h>
@class Contact;
typedef void(^EditViewControllerBlock)();

@interface EditViewController : UIViewController

@property (nonatomic, strong) Contact *contact;
@property (nonatomic, strong) EditViewControllerBlock block;

@end
