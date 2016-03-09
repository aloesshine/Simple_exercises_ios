//
//  rowView.m
//  linkman_manage
//
//  Created by aloes on 16/2/18.
//  Copyright (c) 2016年 aloes. All rights reserved.
//

#import "RowView.h"

@implementation RowView

+ (id)rowViewIcon
{
    RowView *row = [[NSBundle mainBundle] loadNibNamed:@"rowView" owner:nil options:nil][0];

//    [row.image setImage:[UIImage imageNamed:icon]
//               forState:UIControlStateNormal];
//    row.name.text = name;
    
    return row;
}

@end
