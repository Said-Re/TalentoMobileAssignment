//
//  TMASearchCityDataManager.h
//  TalentoMobileAssigment
//
//  Created by Said Rehouni on 7/4/16.
//  Copyright © 2016 Said Rehouni. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TMAGooglePlacesClient.h"

@interface TMASearchCityDataManager : NSObject

@property (nonatomic, strong) TMAGooglePlacesClient *googlePlacesClient;

- (id)initWithGooglePlacesClient:(TMAGooglePlacesClient *)googlePlacesClient;
- (void)citiesWithName:(NSString *)cityName
    andCompletionBlock:(void (^)(NSArray *results))completionBlock;

@end
