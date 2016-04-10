//
//  TMACityDetailManager.m
//  TalentoMobileAssigment
//
//  Created by Said Rehouni on 10/4/16.
//  Copyright © 2016 Said Rehouni. All rights reserved.
//

#import "TMACityDetailManager.h"
#import "WeatherClient.h"
#import "TMACityInfo.h"

@implementation TMACityDetailManager

- (void)cityWithInfo:(NSString *)cityName
    andCompletionBlock:(void (^)(NSArray *results))completionBlock
{
    __weak typeof (self) welf = self;
    [[WeatherClient sharedClient] citiesInfoWithName:cityName andCompletionBlock:^(NSArray *results) {
        if (results)
        {
            TMACityInfo *city = [welf cityFromDataServer:results];
            if (city)
            {
            
            }
        }
        else
        {
        
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

@end