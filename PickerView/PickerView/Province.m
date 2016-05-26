//
//  Province.m
//  PickerView
//
//  Created by aloes on 16/4/29.
//  Copyright © 2016年 aloes. All rights reserved.
//

#import "Province.h"

@implementation Province

+ (instancetype)provinceWithDict:(NSDictionary *)dict
{
    Province *p = [[Province alloc] initWithDict:dict];
    
    return p;
}

- (instancetype)initWithDict:(NSDictionary *)dict
{
    Province *p = [[Province alloc] init];
    
    [p setValuesForKeysWithDictionary:dict];
    
    return p;
}

@end
