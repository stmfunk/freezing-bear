//
//  ViewController.m
//  EncyclopediaOfIntegerSequences
//
//  Created by Donal O'Shea on 07/10/2014.
//  Copyright (c) 2014 Donal O'Shea. All rights reserved.
//

#import "HomeScreenViewController.h"
#import "SearchViewController.h"
#import "Model/SearchPage.h"

#define HOME @"Home"

@interface HomeScreenViewController ()
@property (weak, nonatomic) IBOutlet UITextField *SearchInput;
@property (strong,nonatomic) SearchPage* page;
@end

@implementation HomeScreenViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [[self navigationItem] setTitle:HOME];
}

- (IBAction)getSearchFromInput:(id)sender {
    NSString* title = self.SearchInput.text;
    self.page = [[SearchPage alloc] initWithUrl:title];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Make sure your segue name in storyboard is the same as this line
    if ([[segue identifier] isEqualToString:@"SearchResults"])
    {
        SearchViewController *vc = [segue destinationViewController];
        vc.searchPage = self.page;
    }
}

@end
