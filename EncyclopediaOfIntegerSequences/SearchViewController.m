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
{
    NSArray* recipes;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    recipes = [NSArray arrayWithObjects:@"Egg Benedict", @"Mushroom Risotto", @"Full Breakfast", @"Hamburger", @"Ham and Egg Sandwich", @"Creme Brelee", @"White Chocolate Donut", @"Starbucks Coffee", @"Vegetable Curry", @"Instant Noodle with Egg", @"Noodle with BBQ Pork", @"Japanese Noodle with Pork", @"Green Tea", @"Thai Shrimp Cake", @"Angry Birds Cake", @"Ham and Cheese Panini", nil];
    [[self navigationItem] setTitle:self.searchPage.pageTitle];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [recipes count];
}

- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    NSString* simpleTableIdentifier = @"Recipes";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:simpleTableIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:simpleTableIdentifier];
    }
    cell.textLabel.text = [recipes objectAtIndex:indexPath.row];
    return cell;
}

@end
