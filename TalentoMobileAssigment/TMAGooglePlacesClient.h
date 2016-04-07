//
//  TMAGooglePlacesClient.h
//  TalentoMobileAssigment
//
//  Created by Said Rehouni on 7/4/16.
//  Copyright © 2016 Said Rehouni. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TMAGooglePlacesClient : NSObject

- (id)init;
- (void)placeAutocompleteWithText:(NSString *)text
               andCompletionBlock: (void (^)(NSArray *results))completionBlock;


@end
