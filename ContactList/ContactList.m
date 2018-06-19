//
//  ContactList.m
//  ContactList
//
//  Created by Fariha on 6/5/18.
//  Copyright © 2018 Bootcamp. All rights reserved.
//

#import "ContactList.h"

@implementation ContactList

- (instancetype)init {
    if (self = [super init]) {
        _contacts = [[NSMutableArray alloc] init];
    }
    return self;
}

-(void)addContact:(Contact *)newContact {
    [self.contacts addObject:newContact];
}

@end
