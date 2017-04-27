//
//  Categories.m
//  级联菜单
//
//  Created by aloes on 16/6/21.
//  Copyright © 2016年 aloes. All rights reserved.
//

#import "Categories.h"

@implementation Categories

+ (instancetype)categoriesWithDict:(NSDictionary *)dict
{
    Categories *c = [[Categories alloc] init];
    [c setValuesForKeysWithDictionary:dict];
    
    return c;
}

@end
