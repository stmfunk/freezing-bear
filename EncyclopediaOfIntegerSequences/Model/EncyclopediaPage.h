//
//  NSObject+EncyclopediaPage.h
//  EncyclopediaOfIntegerSequences
//
//  Created by Donal O'Shea on 23/10/2014.
//  Copyright (c) 2014 Donal O'Shea. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface EncyclopediaPage : NSObject
@property (strong,nonatomic,readonly) NSString* pageTitle;

- (id)initWithUrl:(NSString*)url;
@end