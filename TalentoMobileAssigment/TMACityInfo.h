//
//  TMACityInfo.h
//  TalentoMobileAssigment
//
//  Created by Said Rehouni on 10/4/16.
//  Copyright © 2016 Said Rehouni. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TMACardinalPoints.h"

@interface TMACityInfo : NSObject

@property (nonatomic, copy) NSString *name;
@property (nonatomic, strong) TMACardinalPoints *cardinalPoints;
@property (nonatomic, strong) NSArray *weatherStations;
@property (nonatomic) double lat;
@property (nonatomic) double lng;

- (id)initWithData:(NSDictionary *)data;
- (BOOL)validCity;

@end
