//
//  TMACityDetailPresenter.h
//  TalentoMobileAssigment
//
//  Created by Said Rehouni on 10/4/16.
//  Copyright © 2016 Said Rehouni. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TMACityDetailInteractorIO.h"
#import "TMACityDetailViewInterface.h"
#import "TMACityDetailModuleInterface.h"
#import "TMACityDetailModuleDelegateInterfaz.h"

@interface TMACityDetailPresenter : NSObject <TMACityDetailInteractorOutput, TMACityDetailModuleDelegateInterfaz>

@property (nonatomic, strong) id <TMACityDetailInteractorInput> iteractor;
@property (nonatomic, strong) id <TMACityDetailViewInterface> userInterface;

@end
