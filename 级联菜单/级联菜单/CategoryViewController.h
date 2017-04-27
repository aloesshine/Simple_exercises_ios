//
//  CategoryViewController.h
//  级联菜单
//
//  Created by aloes on 16/6/21.
//  Copyright © 2016年 aloes. All rights reserved.
//

#import <UIKit/UIKit.h>
@class SubcategoryViewController;
@class CategoryViewController;

@protocol CategoryViewControllerDelegate <NSObject>

@optional
- (void)categoryView:(CategoryViewController *)categoryView didSelectSubcategories:(NSArray *)subcategories;

@end

@interface CategoryViewController : UITableViewController

@property (nonatomic, weak) id<CategoryViewControllerDelegate> delegate;

@end

