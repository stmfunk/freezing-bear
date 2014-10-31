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

- (id)initWithUrl:(NSString*)url;
@end
