//
//  Shop.h
//  UITableView_simple
//
//  Created by aloes on 16/3/2.
//  Copyright © 2016年 aloes. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Shop : NSObject

@property (nonatomic, copy) NSString *icon;  // 图像
@property (nonatomic, copy) NSString *title;  // 标题
@property (nonatomic, copy) NSString *desc;  // 描述

+ (id)shopWithIcon:(NSString *)icon Title:(NSString *)title Desc:(NSString *)desc;

@end
