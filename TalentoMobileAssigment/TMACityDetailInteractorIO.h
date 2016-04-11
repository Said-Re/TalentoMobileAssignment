//
//  TMACityDetailInteractorIO.h
//  TalentoMobileAssigment
//
//  Created by Said Rehouni on 11/4/16.
//  Copyright © 2016 Said Rehouni. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TMACityInfo.h"

@protocol TMACityDetailInteractorInput <NSObject>

- (void)findCityWeatherInfo:(NSString *)cityName;

@end

@protocol TMACityDetailInteractorOutput <NSObject>

- (void)foundCityWeatherInfo:(TMACityInfo *)city;

@end
