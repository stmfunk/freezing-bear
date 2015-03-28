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
    [self getContentOfSection:@"COMMENTS"];
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

- (NSString*)getContentOfSection:(NSString*)section {
    TFHpple *sectionParser = [TFHpple hppleWithHTMLData:self.htmlData];
    NSString* sectionTitlePath = @"//tr"; //td/font;
    NSArray *sectionTitleNodes = [sectionParser searchWithXPathQuery:sectionTitlePath];
    TFHppleElement* select;
    for (TFHppleElement* sectionTitleNode in sectionTitleNodes)
        for (TFHppleElement* child1 in [sectionTitleNode children])
            if ([child1.tagName isEqualToString:@"td"])
                for (TFHppleElement* child2 in [child1 children])
                    if ([child2.tagName isEqualToString:@"font"])
                        if ([[[child2 firstChild] content] isEqualToString:section])
                            select = child2;
    
    NSArray* neighbours = [[[select parent] parent] children];
    for (id element in neighbours) {
        NSLog(@"%@", [EncyclopaediaPage getAllTextFrom:element]);
    }
    return @"";
}

+ (NSString*)getAllTextFrom:(TFHppleElement*)element {
    NSString* accumulateText = @"";
    for (id node in [element children]) {
        if ([node isTextNode]) {
            accumulateText = [accumulateText stringByAppendingString:[node content]];
            accumulateText = [accumulateText stringByAppendingString:@"\n"];
        } else {
            accumulateText = [accumulateText stringByAppendingString:[EncyclopaediaPage getAllTextFrom:node]];
        }
    }
    return accumulateText;
}

@end