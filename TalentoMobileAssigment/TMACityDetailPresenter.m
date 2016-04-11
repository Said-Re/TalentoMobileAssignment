//
//  TMACityDetailPresenter.m
//  TalentoMobileAssigment
//
//  Created by Said Rehouni on 10/4/16.
//  Copyright © 2016 Said Rehouni. All rights reserved.
//

#import "TMACityDetailPresenter.h"

@implementation TMACityDetailPresenter

#pragma mark - TMACityDetailInteractorOuput

- (void)foundCityWeatherInfo:(TMACityInfo *)city
{
    if (city)
    {
        [self.userInterface foundCityWeatherInfo:city];
    }
    else
    {
        [self.userInterface noCityWeatherInfoFound];
    }
    
}

#pragma mark - TMACityDetailModuleDelegateInterfaz

- (void)findCityWeatherInfo:(NSString *)cityName
{
    [self.iteractor findCityWeatherInfo:cityName];
}

@end