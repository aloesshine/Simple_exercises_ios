//
//  AddViewController.h
//  Address Book
//
//  Created by aloes on 16/5/28.
//  Copyright © 2016年 aloes. All rights reserved.
//

#import <UIKit/UIKit.h>
@class Contact;

typedef void(^AddViewControllerBlock)(Contact *);

@interface AddViewController : UIViewController

@property (nonatomic, strong) AddViewControllerBlock block;

@end
