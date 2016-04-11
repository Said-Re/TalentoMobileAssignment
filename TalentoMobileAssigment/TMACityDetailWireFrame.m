//
//  TMACityDetailWireFrame.m
//  TalentoMobileAssigment
//
//  Created by Said Rehouni on 7/4/16.
//  Copyright © 2016 Said Rehouni. All rights reserved.
//

#import "TMACityDetailWireFrame.h"
#import "TMACityDetailViewController.h"

@implementation TMACityDetailWireFrame

- (void)presentCityDetailInterfaceFromViewController:(UIViewController *)viewController
{
    TMACityDetailViewController *cityDetailViewController = [[TMACityDetailViewController alloc] init];
    self.presenter.userInterface = cityDetailViewController;
    [viewController.navigationController pushViewController:cityDetailViewController animated:YES];
}

@end
