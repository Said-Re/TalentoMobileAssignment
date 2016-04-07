//
//  TMAModuleInterface.h
//  TalentoMobileAssigment
//
//  Created by Said Rehouni on 6/4/16.
//  Copyright © 2016 Said Rehouni. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol TMAModuleInterface <NSObject>

- (void)presentCity:(NSString *)cityName;
- (void)findCities:(NSString *)cityName;

@end
