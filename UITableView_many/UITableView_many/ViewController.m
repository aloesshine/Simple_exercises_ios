//
//  ViewController.m
//  UITableView_many
//
//  Created by aloes on 16/3/2.
//  Copyright © 2016年 aloes. All rights reserved.
//

#import "ViewController.h"
#import "Province.h"

@interface ViewController () <UITableViewDataSource>
{
    NSArray *_allCities;
}

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    //添加控件到界面
    UITableView *table = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStyleGrouped];
    table.dataSource = self;
    [self.view addSubview:table];
    
    _allCities = @[
                   [Province provinceWithHeader:@"山西" Footer:@"人说山西好风光" Cities:@[@"太原", @"晋城", @"忻州", @"大同", @"朔州",  @"吕梁", @"运城"]],
                   [Province provinceWithHeader:@"陕西" Footer:@"红色革命根据地" Cities:@[@"西安", @"宝鸡", @"延安", @"咸阳"]],
                   [Province provinceWithHeader:@"河北" Footer:@"重工业基地" Cities:@[@"石家庄", @"邯郸", @"鞍山", @"唐山"]]
                   ];
    
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return _allCities.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [[_allCities[section] cities] count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *row = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:nil];
    row.textLabel.text = [_allCities[indexPath.section] cities][indexPath.row];
    
    return row;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    return [_allCities[section] header];
}

- (NSString *)tableView:(UITableView *)tableView titleForFooterInSection:(NSInteger)section
{
    return [_allCities[section] footer];
}

- (NSArray<NSString *> *)sectionIndexTitlesForTableView:(UITableView *)tableView
{
    NSMutableArray *index = [NSMutableArray array];
    for (Province *p in _allCities)
    {
        [index addObject:p.header];
    }
    
    return index;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
