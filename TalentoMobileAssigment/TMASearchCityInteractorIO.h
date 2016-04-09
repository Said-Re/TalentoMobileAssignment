//
//  TMASearchCityInteractorIO.h
//  TalentoMobileAssigment
//
//  Created by Said Rehouni on 7/4/16.
//  Copyright © 2016 Said Rehouni. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol TMASearchCityInteractorInput <NSObject>

- (void)findUpcomingItemsWithText:(NSString *)text;
- (void)fetchSearchHistory;

@end


@protocol TMASearchCityInteractorOutput <NSObject>

- (void)foundUpcomingItems:(NSArray *)upcomingItems;
- (void)fetchedSearchHistory:(NSArray *)upcomingItems;

@end