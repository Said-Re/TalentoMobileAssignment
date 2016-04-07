//
//  TMASearchCityDataManager.m
//  TalentoMobileAssigment
//
//  Created by Said Rehouni on 7/4/16.
//  Copyright © 2016 Said Rehouni. All rights reserved.
//

#import "TMASearchCityDataManager.h"
#import <GoogleMaps/GoogleMaps.h>

@implementation TMASearchCityDataManager

- (id)initWithGooglePlacesClient:(TMAGooglePlacesClient *)googlePlacesClient
{
    if (self = [super init])
    {
        _googlePlacesClient = googlePlacesClient;
    }
    
    return self;
}

- (void)citiesWithName:(NSString *)cityName
    andCompletionBlock:(void (^)(NSArray *results))completionBlock
{
    __weak typeof (self) welf = self;
    [self.googlePlacesClient placeAutocompleteWithText:cityName
                                    andCompletionBlock:^(NSArray *results) {
        if (results)
        {
            completionBlock([welf citiesFromDataServer:results]);
        }
        else
        {
            completionBlock(@[]);
        }
    }];
}

#pragma mark - Private

- (NSArray *)citiesFromDataServer:(NSArray *)items
{
    NSMutableArray *cities = [[NSMutableArray alloc] init];
    for (GMSAutocompletePrediction *city in items)
    {
        [cities addObject:city.attributedFullText.string];
    }
    
    return cities;
}

@end