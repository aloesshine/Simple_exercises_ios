//
//  Province.m
//  UITableView_many
//
//  Created by aloes on 16/3/2.
//  Copyright © 2016年 aloes. All rights reserved.
//

#import "Province.h"

@implementation Province

+ (id)provinceWithHeader:(NSString *)header Footer:(NSString *)footer Cities:(NSArray *)cities
{
    Province *p = [[Province alloc] init];
    p.header = header;
    p.footer = footer;
    p.cities = cities;
    
    return p;
}

@end
