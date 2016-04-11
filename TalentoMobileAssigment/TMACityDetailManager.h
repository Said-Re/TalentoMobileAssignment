//
//  TMACityDetailManager.h
//  TalentoMobileAssigment
//
//  Created by Said Rehouni on 10/4/16.
//  Copyright © 2016 Said Rehouni. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TMACityInfo.h"

@interface TMACityDetailManager : NSObject

- (void)cityWithInfo:(NSString *)cityName
  andCompletionBlock:(void (^)(TMACityInfo *city))completionBlock;

@end
