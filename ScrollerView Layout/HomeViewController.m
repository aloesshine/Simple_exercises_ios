//
//  HomeViewController.m
//  ScrollerView Layout
//
//  Created by aloes on 16/7/24.
//  Copyright © 2016年 aloes. All rights reserved.
//

#import "HomeViewController.h"

@interface HomeViewController ()
@property (weak, nonatomic) IBOutlet UIScrollView *titleScrollView;
@property (weak, nonatomic) IBOutlet UIScrollView *contentScrollView;

@end

@implementation HomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self setupTitle];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)setupTitle
{
    CGFloat lableY = 0;
    CGFloat lableW = 100;
    CGFloat lableH = self.titleScrollView.frame.size.height;
    
    // 创建标题lable
    for (NSInteger i = 0; i < 7; i ++)
    {
        UILabel *lable = [[UILabel alloc] init];
        CGFloat lableX = lableW * i;
        lable.frame = CGRectMake(lableX, lableY, lableW, lableH);
        lable.text = [NSString stringWithFormat:@"%ld",i + 1];
        lable.textAlignment = NSTextAlignmentCenter;
        lable.tag = i;
        lable.userInteractionEnabled = YES;
        lable.backgroundColor = [UIColor colorWithRed:arc4random_uniform(100)/100.0 green:arc4random_uniform(100)/100.0 blue:arc4random_uniform(100)/100.0 alpha:1.0];
        [lable addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(lableClick:)]];
        [self.titleScrollView addSubview:lable];
    }
    
    self.titleScrollView.contentSize = CGSizeMake(7 * lableW, lableH);
    self.contentScrollView.contentSize = CGSizeMake(7 * self.view.frame.size.width, self.contentScrollView.frame.size.height);
}

- (void)lableClick:(UITapGestureRecognizer *)reg
{
    NSInteger index = reg.view.tag;
    CGPoint offset = self.contentScrollView.contentOffset;
    offset.x = index * self.contentScrollView.frame.size.width;
    [self.contentScrollView setContentOffset:offset animated:YES];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
