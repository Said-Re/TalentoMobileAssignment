//
//  TMAWeatherStation.m
//  TalentoMobileAssigment
//
//  Created by Said Rehouni on 11/4/16.
//  Copyright © 2016 Said Rehouni. All rights reserved.
//

#import "TMAWeatherStation.h"

@implementation TMAWeatherStation

- (id)initWithData:(NSDictionary *)data
{
    if (self = [super init])
    {
        [self setDataWithDictionary:data];
    }
    
    return self;
}

- (void)setDataWithDictionary:(NSDictionary*)data
{
    _name = [data objectForKey:@"stationName"];
    _lng = [[data objectForKey:@"lng"] doubleValue];
    _lat = [[data objectForKey:@"lat"] doubleValue];
    _temperature = [[data objectForKey:@"temperature"] floatValue];
}

@end