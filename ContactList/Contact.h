//
//  Contact.h
//  ContactList
//
//  Created by Fariha on 6/5/18.
//  Copyright © 2018 Bootcamp. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Contact : NSObject

@property (nonatomic, copy) NSString *name;
@property (nonatomic, copy) NSString *email;
@property (nonatomic) NSMutableArray<NSString*> *phoneNumbers;

- (instancetype)initWithName:(NSString *)name email:(NSString *)email;

@end
