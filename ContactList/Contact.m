//
//  Contact.m
//  ContactList
//
//  Created by Fariha on 6/5/18.
//  Copyright © 2018 Bootcamp. All rights reserved.
//

#import "Contact.h"

@implementation Contact

- (instancetype)initWithName:(NSString *)name email:(NSString *)email {
    if (self = [super init]) {
        _name = name;
        _email = email;
        _phoneNumbers = [[NSMutableArray alloc] init];
    }
    return self;
}

@end
