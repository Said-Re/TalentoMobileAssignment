//
//  TMASearchCityWireFrame.m
//  TalentoMobileAssigment
//
//  Created by Said Rehouni on 6/4/16.
//  Copyright © 2016 Said Rehouni. All rights reserved.
//

#import "TMASearchCityWireFrame.h"
#import "TMASearchCityViewController.h"

@interface TMASearchCityWireFrame ()

@property (nonatomic, strong) TMASearchCityViewController *searchCityViewController;

@end

@implementation TMASearchCityWireFrame

- (void)presentSearchCityInterfaceFromWindow:(UIWindow *)window
{
    TMASearchCityViewController *searchCityViewController = [[TMASearchCityViewController alloc] init];
    UINavigationController *navigationController = [[UINavigationController alloc] initWithRootViewController:searchCityViewController];
    self.searchCityPresenter.userInterface = searchCityViewController;
    searchCityViewController.eventHandler = self.searchCityPresenter;
    self.searchCityViewController = searchCityViewController;
    
    window.rootViewController = navigationController;
}

- (void)presentCityDetailInterface
{
    [self.cityDetailWireframe presentCityDetailInterfaceFromViewController:self.searchCityViewController];
}

@end