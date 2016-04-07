//
//  TMASearchCityInteractor.m
//  TalentoMobileAssigment
//
//  Created by Said Rehouni on 7/4/16.
//  Copyright © 2016 Said Rehouni. All rights reserved.
//

#import "TMASearchCityInteractor.h"

@implementation TMASearchCityInteractor

- (id)initWithDataManager:(TMASearchCityDataManager *)dataManager
{
    if (self = [super init])
    {
        _dataManager = dataManager;
    }
    
    return self;
}

#pragma mark - TMASearchCityInteractorInput

- (void)findUpcomingItemsWithText:(NSString *)text
{
    __weak typeof(self) welf = self;
    [self.dataManager citiesWithName:text andCompletionBlock:^(NSArray *results) {
        [welf.output foundUpcomingItems:results];
    }];
}

@end
