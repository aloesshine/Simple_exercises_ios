//
//  News.h
//  news
//
//  Created by aloes on 16/3/12.
//  Copyright © 2016年 aloes. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface News : NSObject

@property (nonatomic, copy) NSString *title;
@property (nonatomic, copy) NSString *source;
@property (nonatomic, copy) NSString *comments;
@property (nonatomic, copy) NSString *icon;

+ (id)newsWithDict:(NSDictionary *)dict;
- (id)initWithDict:(NSDictionary *)dict;

@end
