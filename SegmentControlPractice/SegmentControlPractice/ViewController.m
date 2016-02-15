//
//  ViewController.m
//  SegmentControlPractice
//
//  Created by aloes on 16/2/6.
//  Copyright (c) 2016年 aloes. All rights reserved.
//

#import "ViewController.h"

#define initCount 9
#define imageSize 60

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    [self adjustImageWithRowCount:2 andCreate:YES];
    
}

- (void)adjustImageWithRowCount:(NSUInteger) rowCount andCreate:(BOOL) create
{
    CGFloat gap = (self.view.frame.size.width - rowCount * imageSize) / (rowCount + 1);
    CGFloat oneX = gap;
    CGFloat oneY = 100;
    
    for (int i = 0; i < initCount; i++)
    {
        CGFloat x = oneX + (i % rowCount) * (imageSize + gap);
        CGFloat y = oneY + (i / rowCount) * (imageSize + gap);
        if (create)
        {
            UIImageView *image = [[UIImageView alloc] init];
            image.image = [UIImage imageNamed:[NSString stringWithFormat:@"01%d.png",i % 9]];
            image.frame = CGRectMake(x, y, imageSize, imageSize);
            [self.view addSubview:image];
        }
        else
        {
            [UIView beginAnimations:nil context:nil];
            [UIView setAnimationDuration:0.5];
            
            UIView *temp = self.view.subviews[i + 1];
            
            temp.frame = CGRectMake( x, y, imageSize, imageSize);
            
            [UIView commitAnimations];
        }
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)lineCount:(UISegmentedControl *)sender
{
    [self adjustImageWithRowCount:(sender.selectedSegmentIndex + 2) andCreate:NO];
}

@end
