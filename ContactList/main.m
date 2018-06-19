//
//  main.m
//  ContactList
//
//  Created by Fariha on 6/5/18.
//  Copyright © 2018 Bootcamp. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "InputCollector.h"
#import "Contact.h"
#import "ContactList.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {

        InputCollector *inputCollector = [[InputCollector alloc] init];
        
        ContactList *contactList = [[ContactList alloc] init];
        
        BOOL done = NO;
        
        while (!done) {
            
            BOOL duplicate = NO;
            
            NSString *inputString = [inputCollector inputForPrompt:@"\nWhat would you like do next?\nnew - Create a new contact\nlist - List all contacts\nfind (contact) - Search contacts\nshow (contact id) - Show contact details\nquit - Exit application "];
            
            if ([inputString isEqualToString:@"quit"]) {
                NSLog(@"You typed %@", inputString);
                break;
            } else if ([inputString isEqualToString:@"new"]){
                NSLog(@"You typed %@", inputString);
                
                NSString *name = [inputCollector inputForPrompt:@"\nEnter name:"];
                NSString *email = [inputCollector inputForPrompt:@"\nEnter email:"];
    
                // NSString *name = @"johndoe";
                // NSString *email = @"johndoe@example.com";
                
                
                for (Contact *contact in contactList.contacts) {
                    if ([contact.email isEqualToString:email]) {
                        duplicate = YES;
                        break;
                    }
                }
                    
                if (duplicate) {
                    NSLog(@"Duplicate entry");
                    continue;
                } else {
                    Contact *contact = [[Contact alloc] initWithName:name email:email];
                    
                    [contactList addContact:contact];
                    
                    //NSLog(@"%@", contact.name);
                    //NSLog(@"%@", contact.email);
                    
                    //NSLog(@"%@", contactList.contacts[0].name);
                    //NSLog(@"%@", contactList.contacts[0].email);
                    
                    //NSLog(@"%@", ((Contact*)contactList.contacts[0]).name);
                    //NSLog(@"%@", ((Contact*)contactList.contacts[0]).email);
                
                    
                    NSString *hasPhoneNumber = [inputCollector inputForPrompt:@"Do you want to enter a phone number (Y/N)?"];
                    
                    while ([hasPhoneNumber isEqualToString:@"Y"] || [hasPhoneNumber isEqualToString:@"y"]) {
                        
                        NSString *phoneNumber = [inputCollector inputForPrompt:@"Enter phone number:"];
                        
                        //[contact.phoneNumbers addObject:phoneNumber];
                        
                        [contactList.contacts[contactList.contacts.count - 1].phoneNumbers addObject:phoneNumber];
                        
                        hasPhoneNumber = [inputCollector inputForPrompt:@"Do you want to enter another phone number (Y/N)?"];
                    }
                
                }
  
            } else if ([inputString isEqualToString:@"list"]) {
                NSLog(@"You typed %@", inputString);
                
                int index = 0;
                
                for (Contact *contact in contactList.contacts) {
                    NSLog(@"%d %@", index++, contact.name);
                }
                
            } else if ([inputString hasPrefix:@"show "]) {
                NSLog(@"You typed %@", inputString);

                NSString *indexString = [inputString substringFromIndex:5];
                
                // check that indexString has no non-numeric characters
                if ([indexString rangeOfCharacterFromSet:[[NSCharacterSet decimalDigitCharacterSet] invertedSet]].location == NSNotFound) {
                    
                    NSInteger index = [indexString integerValue];
                    
                    if ((index >= 0) && (index < contactList.contacts.count)) {
                        
                        Contact *contact = contactList.contacts[index];
                        
                        if (contact.phoneNumbers.count != 0) {
                            NSString *allPhoneNumbers = [contact.phoneNumbers componentsJoinedByString: @"\n"];
                            NSLog(@"\n%@\n%@\n%@", contact.name, contact.email, allPhoneNumbers);
                        } else {
                            NSLog(@"\n%@\n%@", contact.name, contact.email);
                        }
                        
                    } else {
                        NSLog(@"Contact does not exist");
                    }
                } else {
                    NSLog(@"Contact must be a number");
                }
                
            } else if ([inputString hasPrefix:@"find "]) {
                NSLog(@"You typed %@", inputString);
                
                NSString *search = [inputString substringFromIndex:5];
                //NSString *search = @"foo";
                
                NSLog(@"Searching for: %@", search);
                
                //NSMutableArray<Contact*> *searchResults = [[NSMutableArray alloc] init];
                
                for (Contact *contact in contactList.contacts) {
                    if ([contact.name containsString:search] || [contact.email containsString:search]) {
                        //[searchResults addObject:contact];
                        NSLog(@"%@ <%@>", contact.name, contact.email);
                    }
                }
   
            } else if ([inputString isEqualToString:@"history"]) {
                NSLog(@"You typed %@", inputString);
                
                for (int i = 0; i < 3; i++) {
                    // print last three inputs
                    NSLog(@"%@", inputCollector.history[inputCollector.history.count - 2 - i]);
                }
                
            } else {
                NSLog(@"Invalid input");
            }
        }
    }
    return 0;
}
