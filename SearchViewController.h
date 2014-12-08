//
//  SearchViewController.h
//  EncyclopediaOfIntegerSequences
//
//  Created by Donal O'Shea on 21/11/2014.
//  Copyright (c) 2014 Donal O'Shea. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SearchPage.h"
#import "EncyclopaediaPage.h"

@interface SearchViewController : UITableViewController <UITableViewDelegate, UITableViewDataSource>
@property (strong,nonatomic) SearchPage* searchPage;
@property (strong,nonatomic) NSArray* results;
@property (strong,nonatomic) NSDictionary* resultPairs;

@end
