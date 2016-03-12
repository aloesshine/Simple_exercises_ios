//
//  News.m
//  news
//
//  Created by aloes on 16/3/12.
//  Copyright © 2016年 aloes. All rights reserved.
//

#import "News.h"

@implementation News

- (id)initWithDict:(NSDictionary *)dict
{
    if (self = [super init]) {
        self.title = dict[@"title"];
        self.source = dict[@"source"];
        self.comments = dict[@"commets"];
        self.icon = dict[@"icon"];
    }
    
    return self;
}

+ (id)newsWithDict:(NSDictionary *)dict
{
    return [[News alloc] initWithDict:dict];
}

@end
