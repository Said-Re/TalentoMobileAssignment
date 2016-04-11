//
//  TMACityDetailIteractor.m
//  TalentoMobileAssigment
//
//  Created by Said Rehouni on 10/4/16.
//  Copyright © 2016 Said Rehouni. All rights reserved.
//

#import "TMACityDetailIteractor.h"

@implementation TMACityDetailIteractor

- (id)initWithDataManager:(TMACityDetailManager *)dataManager
{
    if (self = [super init])
    {
        _dataManager = dataManager;
    }
    
    return self;
}

#pragma mark - TMACityDetailInteractorInput

- (void)findCityWeatherInfo:(NSString *)cityName
{
    __weak typeof (self) welf = self;
    [self.dataManager cityWithInfo:cityName andCompletionBlock:^(TMACityInfo *city) {
        [welf.output foundCityWeatherInfo:city];
    }];
}

@end