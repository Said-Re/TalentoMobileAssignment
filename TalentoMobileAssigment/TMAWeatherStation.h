//
//  TMAWeatherStation.h
//  TalentoMobileAssigment
//
//  Created by Said Rehouni on 11/4/16.
//  Copyright © 2016 Said Rehouni. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TMAWeatherStation : NSObject

@property (nonatomic, copy) NSString *name;
@property (nonatomic) double lat;
@property (nonatomic) double lng;
@property (nonatomic) int temperature;

- (id)initWithData:(NSDictionary *)data;

@end