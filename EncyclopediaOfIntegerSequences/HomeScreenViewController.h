//
//  ViewController.h
//  EncyclopediaOfIntegerSequences
//
//  Created by Donal O'Shea on 07/10/2014.
//  Copyright (c) 2014 Donal O'Shea. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HomeScreenViewController : UIViewController <UITextFieldDelegate>

- (void)textFieldDidBeginEditing:(UITextField *)textField;
- (void)textFieldDidEndEditing:(UITextField *)textField;
- (void)keyboardWasShown:(NSNotification*)keyboardNotification;
- (void)keyboardWasHidden:(NSNotification*)keyboardNotification;
- (void)moveVerticallyEverythingBy:(NSInteger)nPixels;
@end

