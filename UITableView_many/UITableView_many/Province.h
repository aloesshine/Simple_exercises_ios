//
//  Province.h
//  UITableView_many
//
//  Created by aloes on 16/3/2.
//  Copyright © 2016年 aloes. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Province : NSObject

@property (nonatomic, copy) NSString *header;
@property (nonatomic, copy) NSString *footer;
@property (nonatomic, strong) NSArray *cities;

+ (id)provinceWithHeader:(NSString *)header Footer:(NSString *)footer Cities:(NSArray *)cities;

@end
