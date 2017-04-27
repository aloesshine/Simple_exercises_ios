//
//  ViewController.m
//  级联菜单
//
//  Created by aloes on 16/6/21.
//  Copyright © 2016年 aloes. All rights reserved.
//

#import "ViewController.h"
#import "CategoryViewController.h"
#import "SubcategoryViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    CGFloat width = self.view.bounds.size.width * 0.5;
    CGFloat height = self.view.bounds.size.height;
    
    CategoryViewController *categoryVC = [[CategoryViewController alloc] init];
    categoryVC.view.frame = CGRectMake(0, 0, width, height);
    [self addChildViewController:categoryVC];
    [self.view addSubview:categoryVC.view];
    
    SubcategoryViewController *subcategoryVC = [[SubcategoryViewController alloc] init];
    subcategoryVC.view.frame = CGRectMake(width, 0, width, height);
    categoryVC.delegate = subcategoryVC;
    [self addChildViewController:subcategoryVC];
    [self.view addSubview:subcategoryVC.view];
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
