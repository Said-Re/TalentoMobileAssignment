//
//  TMAGooglePlacesClient.m
//  TalentoMobileAssigment
//
//  Created by Said Rehouni on 7/4/16.
//  Copyright © 2016 Said Rehouni. All rights reserved.
//

#import "TMAGooglePlacesClient.h"
#import <GoogleMaps/GoogleMaps.h>

@interface TMAGooglePlacesClient ()

@property (nonatomic, strong) GMSPlacesClient *placeClient;

@end

@implementation TMAGooglePlacesClient

- (id)init
{
    if ((self = [super init]))
    {
        _placeClient = [[GMSPlacesClient alloc] init];
    }
    
    return self;
}

- (void)placeAutocompleteWithText:(NSString *)text
               andCompletionBlock: (void (^)(NSArray *results))completionBlock
{
    GMSAutocompleteFilter *filter = [[GMSAutocompleteFilter alloc] init];
    filter.type = kGMSPlacesAutocompleteTypeFilterCity;
    
    [self.placeClient autocompleteQuery:text
                              bounds:nil
                              filter:filter
                            callback:^(NSArray *results, NSError *error) {
                                if (error != nil) {
                                    NSLog(@"Autocomplete error %@", [error localizedDescription]);
                                }
                                else
                                {
                                    for (GMSAutocompletePrediction* result in results) {
                                        NSLog(@"Result '%@' with placeID %@", result.attributedFullText.string, result.placeID);
                                    }
                                }
                                completionBlock(results);
                            }];
}

@end
