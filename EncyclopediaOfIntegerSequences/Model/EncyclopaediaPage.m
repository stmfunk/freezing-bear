//
//  NSObject+EncyclopediaPage.m
//  EncyclopediaOfIntegerSequences
//
//  Created by Donal O'Shea on 23/10/2014.
//  Copyright (c) 2014 Donal O'Shea. All rights reserved.
//

#import "EncyclopaediaPage.h"
#import "TFHpple.h"
#import <Foundation/Foundation.h>


@interface EncyclopaediaPage()

@end

@implementation EncyclopaediaPage

- (EncyclopaediaPage*)initWithIndex:(NSString *)index {
    self = [super init];
    NSString* url = [@"https://oeis.org/" stringByAppendingString:index];
    return [self initWithUrl:url];
}

- (NSString*)titlePath {
    return @"//tr/td[1][@valign='top']";
}

- (NSString*)sequenceString {
    if (!_sequenceString) {
        TFHpple *sequenceParser = [TFHpple hppleWithHTMLData:self.htmlData];
        NSString* sequencePath = @"//tt";
        NSArray *sequenceNode = [sequenceParser searchWithXPathQuery:sequencePath];
        _sequenceString = [[[sequenceNode firstObject] firstChild] content];
    }
    return _sequenceString;
}

@end