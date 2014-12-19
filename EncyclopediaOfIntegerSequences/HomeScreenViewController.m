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
@property (weak, nonatomic) UITextField *currentlyEditingTextField;
@property (nonatomic) NSInteger keyboardOffset;
@end

@implementation HomeScreenViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [[self navigationItem] setTitle:HOME];
    [self.SearchInput setReturnKeyType:UIReturnKeyDone];
    self.SearchInput.delegate = self;
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWasShown:)name:UIKeyboardDidShowNotification object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWasHidden:)name:UIKeyboardDidHideNotification object:nil];
    self.keyboardOffset = 0;
    
}

- (void)keyboardWasShown:(NSNotification*)keyboardNotification {
    CGSize keyboardSize = [[[keyboardNotification userInfo] objectForKey:UIKeyboardFrameBeginUserInfoKey] CGRectValue].size;
    CGRect screenRect = [[UIScreen mainScreen] bounds];
    CGFloat screenHeight = screenRect.size.height;
    CGFloat topOfKeyboard = screenHeight - keyboardSize.height;
    CGPoint textFieldPosition = self.currentlyEditingTextField.frame.origin;
    if ((textFieldPosition.y + self.currentlyEditingTextField.frame.size.height) > topOfKeyboard) {
        self.keyboardOffset = topOfKeyboard - (textFieldPosition.y + self.currentlyEditingTextField.frame.size.height) - 5;
        [self moveVerticallyEverythingBy:self.keyboardOffset];
    }
}

- (void)keyboardWasHidden:(NSNotification*)keyboardNotification {
    [self moveVerticallyEverythingBy:-self.keyboardOffset];
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
    self.currentlyEditingTextField = textField;
}

- (void)textFieldDidEndEditing:(UITextField *)textField {
    self.currentlyEditingTextField = NULL;
}

- (void)moveVerticallyEverythingBy:(NSInteger)nPixels {
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationDelegate:self];
    [UIView setAnimationDuration:0.5];
    [UIView setAnimationBeginsFromCurrentState:YES];
    for (id element in self.view.subviews) {
        if ([element respondsToSelector:@selector(frame)]) {
            UIView* elementView = (UIView*)element;
            elementView.frame = CGRectMake(elementView.frame.origin.x, (elementView.frame.origin.y + nPixels), elementView.frame.size.width, elementView.frame.size.height);
        }
    }
    [UIView commitAnimations];
}

@end
