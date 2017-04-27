//
//  Categories.h
//  级联菜单
//
//  Created by aloes on 16/6/21.
//  Copyright © 2016年 aloes. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Categories : NSObject

@property (nonatomic, copy) NSString *name;
@property (nonatomic, copy) NSString *highlighted_icon;
@property (nonatomic, copy) NSString *icon;
@property (nonatomic, strong) NSArray *subcategories;

+ (instancetype)categoriesWithDict:(NSDictionary *)dict;

@end
