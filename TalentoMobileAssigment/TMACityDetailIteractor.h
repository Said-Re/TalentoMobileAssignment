//
//  TMACityDetailIteractor.h
//  TalentoMobileAssigment
//
//  Created by Said Rehouni on 10/4/16.
//  Copyright © 2016 Said Rehouni. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TMACityDetailInteractorIO.h"
#import "TMACityDetailManager.h"

@interface TMACityDetailIteractor : NSObject <TMACityDetailInteractorInput>

@property (nonatomic, strong) TMACityDetailManager *dataManager;
@property (nonatomic, strong) id <TMACityDetailInteractorOutput> output;

- (id)initWithDataManager:(TMACityDetailManager *)dataManager;

@end
