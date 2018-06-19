//
//  InputCollector.m
//  ContactList
//
//  Created by Fariha on 6/5/18.
//  Copyright © 2018 Bootcamp. All rights reserved.
//

#import "InputCollector.h"

@implementation InputCollector

- (instancetype)init {
    if (self = [super init]) {
        _history = [[NSMutableArray alloc] init];
    }
    return self;
}

- (NSString *)inputForPrompt:(NSString *)promptString {
    
    NSLog(@"%@", promptString);
    
    char inputChars[255];
    
    NSString* inputString = [NSString stringWithCString:fgets(inputChars, 255, stdin) encoding:NSUTF8StringEncoding];
    
    NSCharacterSet *characterSet = [NSCharacterSet whitespaceAndNewlineCharacterSet];
    
    [self.history addObject:inputString];
    
    return [inputString stringByTrimmingCharactersInSet:characterSet];
    
}

@end
