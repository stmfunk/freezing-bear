//
//  OEISPage.h
//  
//
//  Created by Donal O'Shea on 31/10/2014.
//
//

#import <Foundation/Foundation.h>

@interface OEISPage : NSObject
@property (strong,nonatomic,readonly) NSString* pageTitle;
@property (strong,nonatomic) NSArray* sequenceTitles;
@property (strong, nonatomic, readonly) NSString* titlePath;
@property (strong,nonatomic) NSDictionary* sequenceDescriptionByTitle;
@property (strong,nonatomic) NSData* htmlData;

- (id)initWithUrl:(NSString*)url;

@end
