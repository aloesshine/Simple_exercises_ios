//
//  ViewController.h
//  PickerView
//
//  Created by aloes on 16/4/29.
//  Copyright © 2016年 aloes. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

@property (weak, nonatomic) IBOutlet UITextField *birthdayText;

@property (weak, nonatomic) IBOutlet UITextField *cityText;

@property (weak, nonatomic) UIDatePicker *picker;

@property (weak, nonatomic) UIPickerView *citiesPicker;

@end

