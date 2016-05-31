//
//  contact.m
//  Address Book
//
//  Created by aloes on 16/5/28.
//  Copyright © 2016年 aloes. All rights reserved.
//

#import "Contact.h"
#define keyName @"name"
#define keyPhone @"phone"

@implementation Contact 

- (instancetype)initWithName:(NSString *)name Phone:(NSString *)phone
{
    Contact *con = [[Contact alloc] init];
    
    con.name = name;
    con.phone = phone;
    
    return con;
}

+ (instancetype)contactWithName:(NSString *)name Phone:(NSString *)phone
{
    return [[Contact alloc] initWithName:name Phone:phone];
}

// 解档
- (instancetype)initWithCoder:(NSCoder *)coder
{
    self = [super init];
    if (self) {
        self.name = [coder decodeObjectForKey:keyName];
        self.phone = [coder decodeObjectForKey:keyPhone];
    }
    return self;
}

// 归档
- (void)encodeWithCoder:(NSCoder *)coder
{
    [coder encodeObject:self.name forKey:keyName];
    [coder encodeObject:self.phone forKey:keyPhone];
    
}
@end
