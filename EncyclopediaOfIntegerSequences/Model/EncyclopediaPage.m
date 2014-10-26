//
//  NSObject+EncyclopediaPage.m
//  EncyclopediaOfIntegerSequences
//
//  Created by Donal O'Shea on 23/10/2014.
//  Copyright (c) 2014 Donal O'Shea. All rights reserved.
//

#import "EncyclopediaPage.h"
#import <Foundation/Foundation.h>
#import "TFHpple.h"

@interface EncyclopediaPage()
@property (strong,nonatomic) NSURL* pageUrl;
@property (strong,nonatomic) NSString* pageTitle;
@property (strong,nonatomic) NSData* htmlData;

- (instancetype)init;
@end

@implementation EncyclopediaPage

- (id)initWithUrl:(NSString*)url {
    self = [super init];
    NSURL* pageUrl = [[NSURL alloc] initWithString:url];
    self.pageUrl = pageUrl;
    return self;
}

- (NSData*)htmlData {
    if (!_htmlData) {
        _htmlData = [NSData dataWithContentsOfURL:self.pageUrl];
    }
    return _htmlData;
}

- (NSString*)pageTitle {
    if (!_pageTitle) {
        TFHpple *tutorialsParser = [TFHpple hppleWithHTMLData:self.htmlData];
        NSString* titlePath = @"//title";
        NSArray *tutorialsNodes = [tutorialsParser searchWithXPathQuery:titlePath];
        for (TFHppleElement *element in tutorialsNodes) {
            _pageTitle = [[element firstChild] content];
        }
    }
    return _pageTitle;
}

- (instancetype)init {
    return [super init];
}

@end