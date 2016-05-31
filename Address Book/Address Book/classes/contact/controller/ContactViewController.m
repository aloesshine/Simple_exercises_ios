//
//  ContactViewController.m
//  Address Book
//
//  Created by aloes on 16/5/26.
//  Copyright © 2016年 aloes. All rights reserved.
//

#import "ContactViewController.h"
#import "AddViewController.h"
#import "Contact.h"
#import "EditViewController.h"

// 获取缓存路径
#define filePath [ NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES)[0] stringByAppendingPathComponent:@"contacts.data"]

@interface ContactViewController ()

@property (nonatomic,strong) NSMutableArray *contacts;

@end

@implementation ContactViewController

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    AddViewController *addVC = segue.destinationViewController;
    addVC.block = ^(Contact *con){
        
        
        // 将模型加入数组
        [self.contacts addObject:con];
        
        // 将模型数组归档
        [NSKeyedArchiver archiveRootObject:_contacts toFile:filePath];
        
        // 刷新表格
        [self.tableView reloadData];
        
    };
    
}

- (NSMutableArray *)contacts
{
    if (_contacts == nil) {
      
        _contacts = [NSKeyedUnarchiver unarchiveObjectWithFile:filePath];
        
        if (_contacts == nil) {
            _contacts = [[NSMutableArray alloc] init];
        }
    }
    return _contacts;
}

- (IBAction)logout:(UIBarButtonItem *)sender
{
    // 设置下拉菜单
    UIAlertController *alertcol = [UIAlertController alertControllerWithTitle:@"Are you logging out?" message:nil preferredStyle:UIAlertControllerStyleActionSheet];
    
    UIAlertAction *alertLogout = [UIAlertAction actionWithTitle:@"Logout" style:UIAlertActionStyleDestructive handler:^(UIAlertAction * _Nonnull action) {
        // 注销返回主菜单
        [self.navigationController popViewControllerAnimated:YES];
    }];
    
    UIAlertAction *alertCancel = [UIAlertAction actionWithTitle:@"Cancel" style:UIAlertActionStyleCancel handler:nil];
    
    [alertcol addAction:alertCancel];
    [alertcol addAction:alertLogout];
    
    [self presentViewController:alertcol animated:YES completion:nil];
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    // 分割线处理
    self.tableView.tableFooterView = [[UIView alloc] init];
    
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.contacts.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *id = @"cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:id];
    
    if (cell == nil)
    {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:id];
    }
    
    // 取出当前模型
    Contact *c = self.contacts[indexPath.row];
    
    cell.textLabel.text = c.name;
    cell.detailTextLabel.text = c.phone;
    
    return cell;
}

// 点击某行时调用
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    UIStoryboard *storyb = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    
    EditViewController *editVC = [storyb instantiateViewControllerWithIdentifier:@"edit"];
    
    Contact *c = self.contacts[indexPath.row];
    
    editVC.contact = c;
    editVC.block = ^(){
        [self.tableView reloadData];
        
        // 归档
        [NSKeyedArchiver archiveRootObject:_contacts toFile:filePath];
    };
    
    // 跳转到edit控制器
    [self.navigationController pushViewController:editVC animated:YES];
}


/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/


// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    // 删除模型数据
    [_contacts removeObjectAtIndex:indexPath.row];
    
    [NSKeyedArchiver archiveRootObject:_contacts toFile:filePath];
    
    [self.tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
}


/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
