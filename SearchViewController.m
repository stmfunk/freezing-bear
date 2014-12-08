//
//  SearchViewController.m
//  EncyclopediaOfIntegerSequences
//
//  Created by Donal O'Shea on 21/11/2014.
//  Copyright (c) 2014 Donal O'Shea. All rights reserved.
//

#import "SearchViewController.h"
#import "EncyclopaediaViewController.h"

@interface SearchViewController ()

@end

@implementation SearchViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [[self navigationItem] setTitle:self.searchPage.pageTitle];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSArray*)results {
    if (!_results) {
        _results = [self.resultPairs allKeys];
    }
    return _results;
}

- (NSDictionary*)resultPairs {
    if (!_resultPairs) {
        _resultPairs = self.searchPage.searchResults;
    }
    return _resultPairs;
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [self.results count];
}




- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Search Result Cell" forIndexPath:indexPath];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"Search Result Cell"];
    }
    
    cell.textLabel.text = [self.results objectAtIndex:indexPath.row];
    
    cell.detailTextLabel.text = self.resultPairs[[self.results objectAtIndex:indexPath.row]];
    
    return cell;
}

#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
    if ([[segue identifier] isEqualToString:@"EncyclopediaPage"]) {
        UITableViewCell* selectedCell = (UITableViewCell *)sender;
        EncyclopaediaPage* currentPage = [[EncyclopaediaPage alloc] initWithIndex:selectedCell.textLabel.text];
        EncyclopaediaViewController* vc = [segue destinationViewController];
        vc.dataPage = currentPage;
    }
}

@end
