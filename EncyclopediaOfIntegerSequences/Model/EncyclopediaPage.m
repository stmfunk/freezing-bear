//
//  NSObject+EncyclopediaPage.m
//  EncyclopediaOfIntegerSequences
//
//  Created by Donal O'Shea on 23/10/2014.
//  Copyright (c) 2014 Donal O'Shea. All rights reserved.
//

#import "EncyclopediaPage.h"
#import <Foundation/Foundation.h>


@interface EncyclopediaPage()

@end

@implementation EncyclopediaPage

- (EncyclopediaPage*)initWithIndex:(NSString *)index {
    self = [super init];
    NSString* url = [@"https://oeis.org/" stringByAppendingString:index];
    return [self initWithUrl:url];
}

@end