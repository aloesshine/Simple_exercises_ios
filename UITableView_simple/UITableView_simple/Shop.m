//
//  Shop.m
//  UITableView_simple
//
//  Created by aloes on 16/3/2.
//  Copyright © 2016年 aloes. All rights reserved.
//

#import "Shop.h"

@implementation Shop

+ (id)shopWithIcon:(NSString *)icon Title:(NSString *)title Desc:(NSString *)desc
{
    Shop *s = [[Shop alloc] init];
    s.icon = icon;
    s.title = title;
    s.desc = desc;
    
    return s;
}

@end
