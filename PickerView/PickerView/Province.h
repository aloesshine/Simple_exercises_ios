//
//  Province.h
//  PickerView
//
//  Created by aloes on 16/4/29.
//  Copyright © 2016年 aloes. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Province : NSObject

@property (nonatomic, copy) NSString *name;
@property (nonatomic, weak) NSArray *cities;

+ (instancetype)provinceWithDict:(NSDictionary *)dict;
- (instancetype)initWithDict:(NSDictionary *)dict;

@end
