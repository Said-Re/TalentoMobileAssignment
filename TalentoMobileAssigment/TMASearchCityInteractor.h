//
//  TMASearchCityInteractor.h
//  TalentoMobileAssigment
//
//  Created by Said Rehouni on 7/4/16.
//  Copyright © 2016 Said Rehouni. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TMASearchCityDataManager.h"
#import "TMASearchCityInteractorIO.h"

@interface TMASearchCityInteractor : NSObject <TMASearchCityInteractorInput>

@property (nonatomic, strong) TMASearchCityDataManager *dataManager;
@property (nonatomic, strong) id <TMASearchCityInteractorOutput> output;

- (id)initWithDataManager:(TMASearchCityDataManager *)dataManager;

@end