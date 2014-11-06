//
//  SearchViewController.m
//  EncyclopediaOfIntegerSequences
//
//  Created by Donal O'Shea on 30/10/2014.
//  Copyright (c) 2014 Donal O'Shea. All rights reserved.
//

#import "SearchViewController.h"
#import "SearchPage.h"

@interface SearchViewController ()
@property (weak, nonatomic) IBOutlet UITableView *SearchResults;
//@property (strong,nonatomic) NSArray* recipes;
@end

@implementation SearchViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [[self navigationItem] setTitle:self.searchPage.pageTitle];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.searchPage.searchResults count];
}

- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    NSString* simpleTableIdentifier = @"SearchResults";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:simpleTableIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:simpleTableIdentifier];
    }
    cell.textLabel.text = [self.searchPage.searchResults objectAtIndex:indexPath.row];
    return cell;
}

@end
