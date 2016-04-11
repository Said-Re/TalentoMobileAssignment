//
//  TMACityDetailManager.m
//  TalentoMobileAssigment
//
//  Created by Said Rehouni on 10/4/16.
//  Copyright © 2016 Said Rehouni. All rights reserved.
//

#import "TMACityDetailManager.h"
#import "WeatherClient.h"
#import "TMAWeatherStation.h"

@implementation TMACityDetailManager

- (void)cityWithInfo:(NSString *)cityName
    andCompletionBlock:(void (^)(TMACityInfo *city))completionBlock
{
    __weak typeof (self) welf = self;
    [[WeatherClient sharedClient] citiesInfoWithName:cityName andCompletionBlock:^(NSArray *results) {
        if (results)
        {
            TMACityInfo *city = [self cityFromDataServer:results];
            if (city)
            {
                [[WeatherClient sharedClient] cityTemperatureWithCardinalPoints:city.cardinalPoints
                                                             andCompletionBlock:^(NSArray *results) {
                    if (results && results.count > 0)
                    {
                        city.weatherStations = [self weatherStationsFromDataServer:results];
                        completionBlock(city);
                    }
                    else
                    {
                        completionBlock(nil);
                    }
                }];
            }
            else
            {
                completionBlock(nil);
            }
        }
        else
        {
            completionBlock(nil);
        }
                            
    }];
}
- (TMACityInfo *)cityFromDataServer:(NSArray *)items
{
    for (NSDictionary *cityDictionary in items)
    {
        TMACityInfo *city = [[TMACityInfo alloc] initWithData:cityDictionary];
        if (city.validCity)
        {
            return city;
        }
    }
    return nil;
}

- (NSArray *)weatherStationsFromDataServer:(NSArray *)items
{
    NSMutableArray *weatherStations = [[NSMutableArray alloc] init];
    for (NSDictionary *weatherStationDictionary in items)
    {
        TMAWeatherStation *weatherStation = [[TMAWeatherStation alloc] initWithData:weatherStationDictionary];
        [weatherStations addObject:weatherStation];
    }
    return weatherStations;
}

@end