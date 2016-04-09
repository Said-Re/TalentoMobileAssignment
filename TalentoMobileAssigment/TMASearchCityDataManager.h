//
//  TMASearchCityDataManager.h
//  TalentoMobileAssigment
//
//  Created by Said Rehouni on 7/4/16.
//  Copyright © 2016 Said Rehouni. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TMAGooglePlacesClient.h"
#import "TMACoreDataManager.h"

@interface TMASearchCityDataManager : NSObject

@property (nonatomic, strong) TMAGooglePlacesClient *googlePlacesClient;
@property (nonatomic, strong) TMACoreDataManager *coreDataManager;

- (id)initWithGooglePlacesClient:(TMAGooglePlacesClient *)googlePlacesClient andCoreDataManager: (TMACoreDataManager *) coreDataManager;
- (void)citiesWithName:(NSString *)cityName
    andCompletionBlock:(void (^)(NSArray *results))completionBlock;
- (void)citiesFromHistory:(void (^)(NSArray *results))completionBlock;

@end
