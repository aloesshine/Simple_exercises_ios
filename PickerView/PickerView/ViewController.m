//
//  ViewController.m
//  PickerView
//
//  Created by aloes on 16/4/29.
//  Copyright © 2016年 aloes. All rights reserved.
//

#import "ViewController.h"
#import "Province.h"

@interface ViewController () <UITextFieldDelegate,UIPickerViewDataSource,UIPickerViewDelegate>

@property (nonatomic, strong) NSMutableArray *provinces;
@property (nonatomic, assign) NSInteger proIndex; // 选中省的角标

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    _birthdayText.delegate = self;
    _cityText.delegate = self;
    
    // 自定义生日,城市键盘
    [self setUpBirthdayKeyboard];
    [self setUpCityKeyboard];
    
    
}

// 懒加载plist文件
- (NSMutableArray *)provinces
{
    if (_provinces == nil) {
        _provinces = [NSMutableArray array];
        // 加载plist文件
        NSArray *pro = [NSArray arrayWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"provinces.plist" ofType:nil]];
        for (NSDictionary *dict in pro) {
            Province *p = [Province provinceWithDict:dict];
            [_provinces addObject:p];
        }
    }
    
    return _provinces;
}

#pragma mark - city
- (void)setUpCityKeyboard
{
    UIPickerView *picker = [[UIPickerView alloc] init];
    _citiesPicker = picker;
    
    picker.dataSource = self;
    picker.delegate = self;
    _cityText.inputView = picker;
}

// 选择了某行某列时调用
- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component
{
    if (component == 0) {
        _proIndex = [pickerView selectedRowInComponent:0];
        [pickerView reloadComponent:1];
        
    }
        NSInteger index = [pickerView selectedRowInComponent:1];
        _cityText.text = [NSString stringWithFormat:@"%@ %@",[self.provinces[_proIndex] name],[self.provinces[_proIndex] cities][index]];
    
}

// 返回列数
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    return 2;
}

// 返回每一列的行数
- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    if (component == 0) { //第0列，省
        return self.provinces.count;
    } else { // 第1列，城市数
        // 获取选中的第0列行数
        _proIndex = [pickerView selectedRowInComponent:0];
        return [self.provinces[_proIndex] cities].count;
    }
}

// 返回每一行每一列所显示的内容
- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    if (component == 0) {
        return [self.provinces[row] name];
    } else {
        _proIndex = [pickerView selectedRowInComponent:0];
        Province *p = self.provinces[_proIndex];
        return p.cities[row];
    }
}

#pragma mark - birthday
// 文本框是否可以输入文字
- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string
{
    return NO;
}

// 文本框开始编辑时调用
- (void)textFieldDidBeginEditing:(UITextField *)textField
{
    if (textField == _birthdayText) {
        [self changeDate:_picker];
    } else {
        [self pickerView:_citiesPicker didSelectRow:0 inComponent:0];
    }
}

- (void)setUpBirthdayKeyboard
{
    UIDatePicker *picker = [[UIDatePicker alloc] init];
    
    // 设置地区
    picker.locale = [NSLocale localeWithLocaleIdentifier:@"zh"];
    
    //设置格式
    picker.datePickerMode = UIDatePickerModeDate;
    
    _picker = picker;
    
    // 监听滚动事件
    [_picker addTarget:self action:@selector(changeDate:) forControlEvents:UIControlEventValueChanged];
    
    // 设置文本框编辑时弹出日期选择器
    _birthdayText.inputView = _picker;
    
}

- (void)changeDate:(UIDatePicker *)picker
{
    // 设置日期格式
    NSDateFormatter *fmt = [[NSDateFormatter alloc] init];
    fmt.dateFormat = @"yyyy-MM-dd";
    
    _birthdayText.text = [fmt stringFromDate:picker.date];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
