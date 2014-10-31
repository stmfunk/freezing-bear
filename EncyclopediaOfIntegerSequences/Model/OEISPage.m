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
@property (strong,nonatomic) NSData* htmlData;

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

@end
