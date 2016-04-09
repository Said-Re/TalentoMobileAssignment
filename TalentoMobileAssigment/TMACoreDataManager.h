//
//  CoreDataManager.h
//  TalentoMobileAssigment
//
//  Created by Said Rehouni on 9/4/16.
//  Copyright © 2016 Said Rehouni. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>
#import "City.h"

@interface TMACoreDataManager : NSObject

- (void)fetchCitiesFromHistory:(void (^)(NSArray *results))completionBlock;
- (void)saveCityInHistoryWithName:(NSString *)cityName;

@end
