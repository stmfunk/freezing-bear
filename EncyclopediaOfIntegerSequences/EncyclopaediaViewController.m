//
//  EncyclopediaViewController.m
//  EncyclopediaOfIntegerSequences
//
//  Created by Donal O'Shea on 07/12/2014.
//  Copyright (c) 2014 Donal O'Shea. All rights reserved.
//

#import "EncyclopaediaViewController.h"

@interface EncyclopaediaViewController ()
@property (weak, nonatomic) IBOutlet UILabel *DescriptionLabel;
@property (weak, nonatomic) IBOutlet UILabel *SequenceLabel;

@end

@implementation EncyclopaediaViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [[self navigationItem] setTitle:self.dataPage.pageTitle];
    [self.DescriptionLabel setText:self.dataPage.sequenceDescriptionByTitle[self.dataPage.sequenceTitles[0]]];
    [self.SequenceLabel setText:self.dataPage.sequenceString];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
