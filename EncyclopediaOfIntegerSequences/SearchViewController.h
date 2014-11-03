//
//  SearchViewController.h
//  EncyclopediaOfIntegerSequences
//
//  Created by Donal O'Shea on 30/10/2014.
//  Copyright (c) 2014 Donal O'Shea. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SearchPage.h"

@interface SearchViewController : UIViewController <UITableViewDelegate, UITableViewDataSource>

@property (strong, nonatomic) SearchPage* searchPage;

@end
