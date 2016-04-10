//
//  WeatherClient.m
//  TalentoMobileAssigment
//
//  Created by Said Rehouni on 10/4/16.
//  Copyright © 2016 Said Rehouni. All rights reserved.
//

#import "WeatherClient.h"
#import <AFNetworking/AFNetworking.h>
#import "AFNetworkActivityIndicatorManager.h"

NSString * const kWeatherAPIURL = @"http://api.geonames.org/";

@implementation WeatherClient

+ (instancetype)sharedClient
{
    static WeatherClient *_sharedClient = nil;
    static dispatch_once_t onceToken;
    
    dispatch_once(&onceToken, ^{
        
        [[AFNetworkActivityIndicatorManager sharedManager] setEnabled:YES];
        NSURLSessionConfiguration *sessionConfiguration = [NSURLSessionConfiguration defaultSessionConfiguration];
        _sharedClient = [[WeatherClient alloc] initWithBaseURL:[NSURL URLWithString:kWeatherAPIURL]
                                          sessionConfiguration:sessionConfiguration];
        
        _sharedClient.responseSerializer = [AFJSONResponseSerializer serializer];
    });
    
    return _sharedClient;
}

- (id)initWithBaseURL:(NSURL *)url sessionConfiguration:(NSURLSessionConfiguration *)sessionConfiguration
{
    self = [super initWithBaseURL:url sessionConfiguration:sessionConfiguration];
    
    return self;
}

- (void)citiesInfoWithName:(NSString *)cityName
        andCompletionBlock:(void (^)(NSArray *results))completionBlock
{
    NSDictionary *parameters = @{
                                 @"q"               : cityName,
                                 @"maxRows"         : @20,
                                 @"starRow"         : @0,
                                 @"lang"            : @"en",
                                 @"isNameRequired"  : @"true",
                                 @"style"           : @"FULL",
                                 @"username"        : @"demo"
                                 };
    
    [self GET:@"searchJSON" parameters:parameters progress:^(NSProgress *downloadProgress)
    {
        NSLog(@"%@", downloadProgress);
    }
      success:^(NSURLSessionDataTask *task, id responseObject)
    {
        NSLog(@"%@", responseObject);
        NSArray *results = (NSArray *)responseObject;
        completionBlock(results);
    }
      failure:^(NSURLSessionDataTask *task, NSError *error)
     {
         NSLog(@"%@", error);
         completionBlock(@[]);
    }];
}

@end