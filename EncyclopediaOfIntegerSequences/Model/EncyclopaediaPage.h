//
//  NSObject+EncyclopediaPage.h
//  EncyclopediaOfIntegerSequences
//
//  Created by Donal O'Shea on 23/10/2014.
//  Copyright (c) 2014 Donal O'Shea. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TFHppleElement.h"
#import "OEISPage.h"

@interface EncyclopaediaPage : OEISPage

- (EncyclopaediaPage*)initWithIndex:(NSString*)index;
- (NSString*)getContentOfSection:(NSString*)section;

+ (NSString*)getAllTextFrom:(TFHppleElement*)element;

@property (strong,nonatomic) NSString* sequenceString;
@end