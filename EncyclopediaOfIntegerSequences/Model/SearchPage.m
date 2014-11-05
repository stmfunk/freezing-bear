//
//  SearchPage.m
//  EncyclopediaOfIntegerSequences
//
//  Created by Donal O'Shea on 31/10/2014.
//  Copyright (c) 2014 Donal O'Shea. All rights reserved.
//

#import "SearchPage.h"

@interface SearchPage()
@property (strong,nonatomic) NSURL* pageUrl;
@end

@implementation SearchPage

@dynamic pageUrl;

- (NSArray*)searchResults {
    
    return @[];
}

- (SearchPage*)initFromSearchTerm:(NSString *)searchTerm {
    self.pageUrl = [SearchPage searchUrlFromSearchTerm:searchTerm];
    return [super init];
}

+ (NSURL*)searchUrlFromSearchTerm:(NSString *)searchTerm {
    NSString* url = @"http://oeis.org/search?q=";
    NSArray* searchTerms = [searchTerm componentsSeparatedByString:@","];
    for (NSString* obj in [searchTerms subarrayWithRange:NSMakeRange(0, searchTerms.count-1)])
        url = [url stringByAppendingString:[NSString stringWithFormat:@"%d%%2C", [obj intValue]]];
    url = [url stringByAppendingString:searchTerms[searchTerms.count-1]];
    return [NSURL URLWithString:url];
}

@end
