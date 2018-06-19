//
//  InputCollector.h
//  ContactList
//
//  Created by Fariha on 6/5/18.
//  Copyright © 2018 Bootcamp. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface InputCollector : NSObject

@property (nonatomic) NSMutableArray<NSString*> *history;

- (NSString *)inputForPrompt:(NSString *)promptString;

@end
