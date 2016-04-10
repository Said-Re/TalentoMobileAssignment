//
//  TMACardinalPoints.h
//  TalentoMobileAssigment
//
//  Created by Said Rehouni on 10/4/16.
//  Copyright © 2016 Said Rehouni. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TMACardinalPoints : NSObject

@property (nonatomic) double east;
@property (nonatomic) double south;
@property (nonatomic) double north;
@property (nonatomic) double west;

- (id)initWithData:(NSDictionary *)data;

@end
