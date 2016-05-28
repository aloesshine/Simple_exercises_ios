//
//  contact.m
//  Address Book
//
//  Created by aloes on 16/5/28.
//  Copyright © 2016年 aloes. All rights reserved.
//

#import "Contact.h"

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

@end
