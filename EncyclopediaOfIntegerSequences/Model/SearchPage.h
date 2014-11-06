//
//  SearchPage.h
//  EncyclopediaOfIntegerSequences
//
//  Created by Donal O'Shea on 31/10/2014.
//  Copyright (c) 2014 Donal O'Shea. All rights reserved.
//

#import "OEISPage.h"

@interface SearchPage : OEISPage

@property (strong,nonatomic) NSArray* searchResults;

- (SearchPage*)initFromSearchTerm:(NSString*)searchTerm;

+ (NSURL*)searchUrlFromSearchTerm:(NSString*)searchTerm;

+ (NSString*)fixFormattingOfSearchTerm:(NSString*)searchTerm;
@end
