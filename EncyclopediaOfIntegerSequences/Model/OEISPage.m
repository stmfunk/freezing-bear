//
//  OEISPage.m
//  
//
//  Created by Donal O'Shea on 31/10/2014.
//
//

#import "OEISPage.h"
#import "TFHpple.h"

@interface OEISPage()
@property (strong,nonatomic) NSURL* pageUrl;
@property (strong,nonatomic) NSString* pageTitle;

- (instancetype)init;
@end

@implementation OEISPage
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

- (NSString*)titlePath {
    return @"//tr/td[1]/a";
}

- (NSArray*)sequenceTitles {
    if (!_sequenceTitles) {
        NSMutableArray* createTitles = [[NSMutableArray alloc] init];
        TFHpple *pageParser = [TFHpple hppleWithHTMLData:self.htmlData];
        NSArray *titlesNodes = [pageParser searchWithXPathQuery:self.titlePath];
        for (TFHppleElement *element in titlesNodes) {
            [createTitles addObject:[[[element firstChild] content]stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]]];
        }
        _sequenceTitles = createTitles;
    }
    return _sequenceTitles;
}

- (NSDictionary*)sequenceDescriptionByTitle {
    if (!_sequenceDescriptionByTitle) {
        TFHpple *pageParser = [TFHpple hppleWithHTMLData:self.htmlData];
        
        NSMutableDictionary* createSeqDict = [[NSMutableDictionary alloc] init];
        NSString* descriptionPath = @"//tr/td[3][@valign='top']";
        
        NSArray *descriptionNodes = [pageParser searchWithXPathQuery:descriptionPath];
        NSInteger iterator = 0;
        for (TFHppleElement* element in descriptionNodes) {
            if (self.sequenceTitles[iterator] == NULL) break;
            [createSeqDict setObject:[[[element firstChild] content]stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] forKey:self.sequenceTitles[iterator++]];
        }
        _sequenceDescriptionByTitle = createSeqDict;
    }
    return _sequenceDescriptionByTitle;
}



@end
