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
@property (weak, nonatomic) IBOutlet UIImageView *HomeLogo;
@property (weak, nonatomic) IBOutlet UIButton *SearchButton;
@end

@implementation HomeScreenViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [[self navigationItem] setTitle:HOME];
    [self.SearchInput setReturnKeyType:UIReturnKeyDone];
    self.SearchInput.delegate = self;
}

- (IBAction)getSearchFromInput:(id)sender {
    NSString* title = self.SearchInput.text;
    self.page = [[SearchPage alloc] initFromSearchTerm:title];
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

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    [textField resignFirstResponder];
    return YES;
}

- (void)textFieldDidBeginEditing:(UITextField *)textField {
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationDelegate:self];
    [UIView setAnimationDuration:0.5];
    [UIView setAnimationBeginsFromCurrentState:YES];
    textField.frame = CGRectMake(textField.frame.origin.x, (textField.frame.origin.y - 100.0), textField.frame.size.width, textField.frame.size.height);
    self.HomeLogo.frame = CGRectMake(self.HomeLogo.frame.origin.x, (self.HomeLogo.frame.origin.y - 100.0), self.HomeLogo.frame.size.width, self.HomeLogo.frame.size.height);
    self.SearchButton.frame = CGRectMake(self.SearchButton.frame.origin.x, (self.SearchButton.frame.origin.y - 100.0), self.SearchButton.frame.size.width, self.SearchButton.frame.size.height);
    [UIView commitAnimations];
}

- (void)textFieldDidEndEditing:(UITextField *)textField {
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationDelegate:self];
    [UIView setAnimationDuration:0.5];
    [UIView setAnimationBeginsFromCurrentState:YES];
    textField.frame = CGRectMake(textField.frame.origin.x, (textField.frame.origin.y + 100.0), textField.frame.size.width, textField.frame.size.height);
    self.HomeLogo.frame = CGRectMake(self.HomeLogo.frame.origin.x, (self.HomeLogo.frame.origin.y + 100.0), self.HomeLogo.frame.size.width, self.HomeLogo.frame.size.height);
    self.SearchButton.frame = CGRectMake(self.SearchButton.frame.origin.x, (self.SearchButton.frame.origin.y + 100.0), self.SearchButton.frame.size.width, self.SearchButton.frame.size.height);
    [UIView commitAnimations];
}

@end
