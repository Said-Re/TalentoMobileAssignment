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

- (void)findCities:(NSString *)cityName
{
    [self.interactor findUpcomingItemsWithText:cityName];
}

#pragma mark - TMASearchCityInteractorOuput

- (void)foundUpcomingItems:(NSArray *)upcomingItems
{
    [self.userInterface showUpcomingDisplayData:upcomingItems];
}

#pragma mark - private

- (NSArray *)dataForInterface:(NSArray *)upcomingItems
{
    return  nil;
}

@end
