//
//  SearchPage.m
//  EncyclopediaOfIntegerSequences
//
//  Created by Donal O'Shea on 31/10/2014.
//  Copyright (c) 2014 Donal O'Shea. All rights reserved.
//

#import "SearchPage.h"
#import "TFHpple.h"

@interface SearchPage()
@property (strong,nonatomic) NSURL* pageUrl;
@property (strong,nonatomic) NSData* htmlData;
@end

@implementation SearchPage

@dynamic pageUrl;
@dynamic htmlData;

- (NSDictionary*)searchResults {
    TFHpple *pageParser = [TFHpple hppleWithHTMLData:self.htmlData];
    NSString* titlePath = @"//tr/td[1]/a";
    NSString* descriptionPath = @"//tr/td[3][@valign='top']";
    
    NSMutableDictionary* returnResults = [[NSMutableDictionary alloc] init];
    NSArray *titlesNodes = [pageParser searchWithXPathQuery:titlePath];
    NSArray *descriptionNodes = [pageParser searchWithXPathQuery:descriptionPath];
    NSInteger iterator = 0;
    for (TFHppleElement *element in titlesNodes) {
        if (iterator >= 10) break;
            [returnResults setObject:
         [[[descriptionNodes[iterator++] firstChild] content] stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]]
                          forKey:[[element firstChild] content]];
    }
    return returnResults;
}

- (SearchPage*)initFromSearchTerm:(NSString *)searchTerm {
    self.pageUrl = [SearchPage searchUrlFromSearchTerm:searchTerm];
    return [super init];
}

+ (NSString*)fixFormattingOfSearchTerm:(NSString*)searchTerm {
    NSArray* spaceless = [searchTerm componentsSeparatedByString:@" "];
    NSString* retString = @"";
    for (NSString* substr in spaceless) {
        if (retString.length > 0) retString = [retString stringByAppendingString:@","];
            retString = [retString stringByAppendingString:[substr stringByTrimmingCharactersInSet:[NSCharacterSet characterSetWithCharactersInString:@", "]]];
    }
    return retString;
}

+ (NSURL*)searchUrlFromSearchTerm:(NSString *)searchTerm {
    NSRegularExpression* matchesSearch = [[NSRegularExpression alloc] initWithPattern:@"[0-9][, ]+" options:0 error:nil];
    if ([matchesSearch numberOfMatchesInString:searchTerm options:0
                                         range:NSMakeRange(0, searchTerm.length)] > 0) {
        searchTerm = [SearchPage fixFormattingOfSearchTerm:searchTerm];
        NSString* url = @"http://oeis.org/search?q=";
        NSArray* searchTerms = [searchTerm componentsSeparatedByString:@","];
        for (NSString* obj in [searchTerms subarrayWithRange:NSMakeRange(0, searchTerms.count-1)])
            url = [url stringByAppendingString:[NSString stringWithFormat:@"%d%%2C", [obj intValue]]];
        url = [url stringByAppendingString:searchTerms[searchTerms.count-1]];
        url = [url stringByAppendingString:@"&sort=&language=english&go=Search"];
        return [NSURL URLWithString:url];
    } else
        return nil;
}

@end
