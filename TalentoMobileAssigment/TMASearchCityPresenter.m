//
//  TMASearchCityPresenter.m
//  TalentoMobileAssigment
//
//  Created by Said Rehouni on 6/4/16.
//  Copyright © 2016 Said Rehouni. All rights reserved.
//

#import "TMASearchCityPresenter.h"

@implementation TMASearchCityPresenter

#pragma mark - TMAModuleInterface

- (void)presentCity:(NSString *)cityName
{
    [self.interactor addCityWithName:cityName];
    [self.wireFrame presentCityDetailInterface];
    [self.presenterCityDetailModule findCityWeatherInfo:cityName];
}

- (void)findCities:(NSString *)cityName
{
    [self.interactor findUpcomingItemsWithText:cityName];
}

- (void)presentHistory
{
    [self.interactor fetchSearchHistory];
}

#pragma mark - TMASearchCityInteractorOuput

- (void)foundUpcomingItems:(NSArray *)upcomingItems
{
    [self.userInterface showUpcomingDisplayData:upcomingItems];
}

- (void)fetchedSearchHistory:(NSArray *)upcomingItems
{
    [self.userInterface showUpcomingDisplayData:upcomingItems];
}

@end
