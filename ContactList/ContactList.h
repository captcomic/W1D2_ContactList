//
//  ContactList.h
//  ContactList
//
//  Created by Fariha on 6/5/18.
//  Copyright © 2018 Bootcamp. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Contact.h"

@interface ContactList : NSObject

@property (nonatomic) NSMutableArray<Contact*> *contacts;
// @property (nonatomic) NSMutableArray *contacts;

- (void)addContact:(Contact *)newContact;

@end
