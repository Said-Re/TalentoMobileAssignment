//
//  WeatherClient.h
//  TalentoMobileAssigment
//
//  Created by Said Rehouni on 10/4/16.
//  Copyright © 2016 Said Rehouni. All rights reserved.
//

#import <AFNetworking/AFNetworking.h>

@interface WeatherClient : AFHTTPSessionManager

+ (instancetype)sharedClient;

- (void)citiesInfoWithName:(NSString *)cityName
        andCompletionBlock:(void (^)(NSArray *results))completionBlock;

@end
