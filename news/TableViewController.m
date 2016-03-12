//
//  TableViewController.m
//  news
//
//  Created by aloes on 16/3/12.
//  Copyright © 2016年 aloes. All rights reserved.
//

#import "TableViewController.h"
#import "NewsCell.h"
#import "News.h"

@interface TableViewController ()
{
    NSMutableArray *_allnewes;
}

@end

@implementation TableViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    _allnewes = [NSMutableArray array];
    
    News *n1  = [News newsWithDict:@{
                                     @"title" : @"akhafksfkjsgfkjsd",
                                     @"commets" : @"评论:100",
                                     @"source" : @"kjdfkjsbg"
                                     }];
    [_allnewes addObject:n1];
    _myTableView.rowHeight = 80;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source
#pragma mark 显示数据组数
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _allnewes.count;
}

#pragma mark 每行返回的cell
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NewsCell *cell = [tableView dequeueReusableCellWithIdentifier:[NewsCell ID]];
    
    if (cell == nil) {
        cell = [NewsCell newsCell];
    }
    
    cell.news = _allnewes[indexPath.row];
    
    return cell;
}


/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

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
