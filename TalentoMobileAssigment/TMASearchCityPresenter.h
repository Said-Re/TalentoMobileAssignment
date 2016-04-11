//
//  TMASearchCityPresenter.h
//  TalentoMobileAssigment
//
//  Created by Said Rehouni on 6/4/16.
//  Copyright © 2016 Said Rehouni. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TMASearchCityInteractorIO.h"
#import "TMASearchCityViewInterface.h"
#import "TMASearchCityWireFrame.h"
#import "TMAModuleInterface.h"
#import "TMACityDetailModuleDelegateInterfaz.h"

@class TMASearchCityWireFrame;

@interface TMASearchCityPresenter : NSObject <TMASearchCityInteractorOutput, TMAModuleInterface>

@property (nonatomic, strong) TMASearchCityWireFrame *wireFrame;
@property (nonatomic, strong) id <TMASearchCityViewInterface> userInterface;
@property (nonatomic, strong) id <TMASearchCityInteractorInput> interactor;
@property (nonatomic, strong) id <TMACityDetailModuleDelegateInterfaz> presenterCityDetailModule;


@end
