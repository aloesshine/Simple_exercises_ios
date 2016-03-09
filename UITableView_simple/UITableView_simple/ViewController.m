//
//  ViewController.m
//  UITableView_simple
//
//  Created by aloes on 16/3/2.
//  Copyright © 2016年 aloes. All rights reserved.
//

#import "ViewController.h"
#import "Shop.h"

@interface ViewController () <UITableViewDataSource, UITableViewDelegate>
{
    NSMutableArray *_allShops;
    NSMutableArray *_deletedShops;
}

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    Shop *s1 = [Shop shopWithIcon:@"011.png" Title:@"大笑" Desc:@"开心开心开心～～～"];
    Shop *s2 = [Shop shopWithIcon:@"012.png" Title:@"爱你" Desc:@"爱你爱你爱你～～～"];
    Shop *s3 = [Shop shopWithIcon:@"013.png" Title:@"头晕" Desc:@"好晕好晕好晕～～～"];
    Shop *s4 = [Shop shopWithIcon:@"014.png" Title:@"大哭" Desc:@"忧伤忧伤忧伤～～～"];
    Shop *s5 = [Shop shopWithIcon:@"015.png" Title:@"饥饿" Desc:@"好饿好饿好饿～～～"];
    Shop *s6 = [Shop shopWithIcon:@"016.png" Title:@"抓狂" Desc:@"好烦好烦好烦～～～"];
    _allShops = [NSMutableArray arrayWithObjects:s1,s2,s3,s4,s5,s6, nil];
    
    _deletedShops = [NSMutableArray array];
    
}

#pragma mark 设置行数
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (_allShops.count == 0) {
        _edit.enabled = NO;
        _select.enabled = NO;
    } else {
        _edit.enabled = YES;
        _select.enabled = YES;
    }
    if (_deletedShops.count == 0) {
        _trash.enabled = NO;
        _text.title = @"Aloes的表情包";
    } else {
        _trash.enabled = YES;
        NSString *name = [NSString stringWithFormat:@"Aloes的表情包(%lu)",_deletedShops.count];
        _text.title = name;
    }
    
    return _allShops.count;
}

#pragma mark 设置每一行的内容
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    //从缓存池中读取cell
    static NSString *ID = @"pp";   // 只分配一次内存
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:ID];
    }
    
    //读取模型搭建界面
    Shop *s = _allShops[indexPath.row];
    cell.imageView.image = [UIImage imageNamed:s.icon];
    cell.textLabel.text = s.title;
    cell.detailTextLabel.text = s.desc;
    
    if ([_deletedShops containsObject:s]) { // 被选中
        cell.accessoryType = UITableViewCellAccessoryCheckmark;
    } else {  // 没有被选中
        cell.accessoryType = UITableViewCellAccessoryNone;
    }
    
    return cell;
}

#pragma mark 设置每行的行高
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 70;
}

#pragma mark 选中某一行
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    // 设置取消选中
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    Shop *s = _allShops[indexPath.row];
    
    if ([_deletedShops containsObject:s]) { // 选中状态
        [_deletedShops removeObject:s];
    } else {
        [_deletedShops addObject:s];
    }
    
    // 更新这一行
    [tableView reloadRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationTop];
}


#pragma mark 设置弹框 （ios9 新特性）
//- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
//{
//    Shop *s = _allShops[indexPath.row];
//    
//    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"图片详细信息" message:nil preferredStyle:UIAlertControllerStyleAlert];
//    
//    [alert addTextFieldWithConfigurationHandler:^(UITextField * _Nonnull textField) {
//        textField.text = s.title;
//    }];
//    
//    UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:nil];
//    
//    // 设置按钮，并设置执行代码
//    UIAlertAction *okAction = [UIAlertAction actionWithTitle:@"好的" style:UIAlertActionStyleDestructive handler:^(UIAlertAction * _Nonnull action) {
//        s.title = alert.textFields[0].text;
//        [_tableView reloadRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationMiddle];
//    }];
//    [alert addAction:cancelAction];
//    [alert addAction:okAction];
//    
//    [self presentViewController:alert animated:YES completion:nil];
//}

#pragma mark 开启编辑模式
- (IBAction)edit:(UIBarButtonItem *)sender
{
    [_tableView setEditing:_tableView.editing == YES ? NO : YES animated:YES];
}

#pragma mark 全部反选
- (IBAction)allSelect:(UIBarButtonItem *)sender
{
    NSMutableArray *temp = [NSMutableArray array];
    for (Shop *s in _allShops){
        if (![_deletedShops containsObject:s]) { // s 不在删除列表内
            [temp addObject:s];
        }
    }
    
    [_deletedShops removeAllObjects];
    
    for (Shop *ss in temp) {
        [_deletedShops addObject:ss];
    }
    
    [_tableView reloadData];
}

#pragma mark 删除选中行
- (IBAction)remove:(UIBarButtonItem *)sender
{
    NSMutableArray *deletedRow = [NSMutableArray array];
    NSIndexPath *path = [[NSIndexPath alloc] init];
    for (Shop *s in _deletedShops) {
        path = [NSIndexPath indexPathForRow:[_allShops indexOfObject:s] inSection:0];
        [deletedRow addObject:path];
    }
    
    [_allShops removeObjectsInArray:_deletedShops];
    
    [_deletedShops removeAllObjects];
    
    [_tableView deleteRowsAtIndexPaths:deletedRow withRowAnimation:UITableViewRowAnimationTop];
}

#pragma mark 处理编辑模式中的删除事件
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle != UITableViewCellEditingStyleDelete) return;
    
    Shop *s = _allShops[indexPath.row];
    
    if ([_deletedShops containsObject:s]) {
        [_deletedShops removeObject:s];
    }
    
    [_allShops removeObject:s];
    [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationTop];
}

#pragma mark 处理编辑模式中的排序事件
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)sourceIndexPath toIndexPath:(NSIndexPath *)destinationIndexPath
{
    Shop *s = _allShops[sourceIndexPath.row];
    
    [_allShops removeObject:s];
    
    [_allShops insertObject:s atIndex:destinationIndexPath.row];
    
    [tableView reloadData];
}
@end
