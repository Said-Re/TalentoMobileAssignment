//
//  TMACardinalPoints.m
//  TalentoMobileAssigment
//
//  Created by Said Rehouni on 10/4/16.
//  Copyright © 2016 Said Rehouni. All rights reserved.
//

#import "TMACardinalPoints.h"

@implementation TMACardinalPoints

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
    _east = [[data objectForKey:@"east"] doubleValue];
    _south = [[data objectForKey:@"south"] doubleValue];
    _north = [[data objectForKey:@"north"] doubleValue];
    _west = [[data objectForKey:@"west"] doubleValue];
}

@end
