//
//  TMACityDetailViewInterface.h
//  TalentoMobileAssigment
//
//  Created by Said Rehouni on 11/4/16.
//  Copyright © 2016 Said Rehouni. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TMACityInfo.h"

@protocol TMACityDetailViewInterface <NSObject>

- (void)foundCityWeatherInfo:(TMACityInfo *)city;
- (void)noCityWeatherInfoFound;

@end