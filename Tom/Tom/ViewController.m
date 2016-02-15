//
//  ViewController.m
//  Tom
//
//  Created by aloes on 16/2/15.
//  Copyright (c) 2016年 aloes. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
{
    NSDictionary *_dic;
}

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    NSBundle *bundle = [NSBundle mainBundle];
    NSString *path = [bundle pathForResource:@"tom" ofType:@"plist"];
     _dic = [NSDictionary dictionaryWithContentsOfFile:path];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)bnt_click:(UIButton *)sender
{
    if (_tom.isAnimating) return;
    
    NSMutableArray *images = [NSMutableArray array];
    int count = [_dic[[sender titleForState:UIControlStateNormal]] intValue];
    for (int i = 0; i < count; i++)
    {
        NSString *name = [NSString stringWithFormat:@"%@_%02d.jpg",[sender titleForState:UIControlStateNormal],i];
        NSString *path = [[NSBundle mainBundle] pathForResource:name ofType:nil];
        UIImage *image = [[UIImage alloc] initWithContentsOfFile:path];
        [images addObject:image];
    }
    
    _tom.animationImages = images;
    _tom.animationRepeatCount = 1;
    _tom.animationDuration = 0.1 * count;
    [_tom startAnimating];
}

@end
