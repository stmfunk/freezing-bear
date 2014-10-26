//
//  ViewController.m
//  EncyclopediaOfIntegerSequences
//
//  Created by Donal O'Shea on 07/10/2014.
//  Copyright (c) 2014 Donal O'Shea. All rights reserved.
//

#import "ViewController.h"
#import "Model/EncyclopediaPage.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UITextField *SearchInput;
@property (weak, nonatomic) IBOutlet UILabel *DisplayTitle;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}
- (IBAction)getSearchFromInput:(id)sender {
    NSString* title = self.SearchInput.text;
    EncyclopediaPage* page = [[EncyclopediaPage alloc] initWithUrl:title];
    self.DisplayTitle.text = page.pageTitle;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
