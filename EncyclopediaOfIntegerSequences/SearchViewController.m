//
//  SearchViewController.m
//  EncyclopediaOfIntegerSequences
//
//  Created by Donal O'Shea on 30/10/2014.
//  Copyright (c) 2014 Donal O'Shea. All rights reserved.
//

#import "SearchViewController.h"

@interface SearchViewController ()
@property (weak, nonatomic) IBOutlet UILabel *DisplayTitle;

@end

@implementation SearchViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.DisplayTitle.text = self.pageTitle;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
