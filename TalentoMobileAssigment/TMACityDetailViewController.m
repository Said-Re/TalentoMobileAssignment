//
//  TMACityDetailViewController.m
//  TalentoMobileAssigment
//
//  Created by Said Rehouni on 10/4/16.
//  Copyright © 2016 Said Rehouni. All rights reserved.
//

#import "TMACityDetailViewController.h"

@interface TMACityDetailViewController ()

@end

@implementation TMACityDetailViewController

- (id)init
{
    if (self = [super initWithNibName:@"TMACityDetailViewController" bundle:nil]) {
        
    }
    
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

#pragma mark - TMACityDetailViewInterface

- (void)foundCityWeatherInfo:(TMACityInfo *)city
{
    
}

- (void)noCityWeatherInfoFound
{
    UIAlertController *alerController = [UIAlertController alertControllerWithTitle:@"Error"
                                                                            message:@"No info weather found for this city"
                                                                     preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction *alerAction = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault
                                                       handler:^(UIAlertAction * _Nonnull action) {
        [self.navigationController popViewControllerAnimated:YES];
    }];
    
    [alerController addAction:alerAction];
    [self presentViewController:alerController animated:YES completion:nil];
}

@end