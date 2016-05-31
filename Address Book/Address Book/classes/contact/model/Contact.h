//
//  contact.h
//  Address Book
//
//  Created by aloes on 16/5/28.
//  Copyright © 2016年 aloes. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Contact : NSObject <NSCoding>

@property (nonatomic, copy) NSString *name;
@property (nonatomic, copy) NSString *phone;

+ (instancetype)contactWithName:(NSString *)name Phone:(NSString *)phone;
- (instancetype)initWithName:(NSString *)name Phone:(NSString *)phone;

@end
