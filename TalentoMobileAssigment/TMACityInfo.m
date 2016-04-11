//
//  TMACityInfo.m
//  TalentoMobileAssigment
//
//  Created by Said Rehouni on 10/4/16.
//  Copyright © 2016 Said Rehouni. All rights reserved.
//

#import "TMACityInfo.h"

@implementation TMACityInfo

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
    _name = [data objectForKey:@"name"];
    _lat = [[data objectForKey:@"lat"] doubleValue];
    _lng = [[data objectForKey:@"lng"] doubleValue];
    
    if ([data objectForKey:@"bbox"] != nil)
    {
        _cardinalPoints = [[TMACardinalPoints alloc] initWithData:[data objectForKey:@"bbox"]];
    }
    else
    {
        _cardinalPoints = nil;
    }
}

- (BOOL)validCity
{
    if (self.cardinalPoints)
    {
        return YES;
    }
    return NO;
}

@end
