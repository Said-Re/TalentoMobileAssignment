//
//  TMAAppDependencies.m
//  TalentoMobileAssigment
//
//  Created by Said Rehouni on 7/4/16.
//  Copyright © 2016 Said Rehouni. All rights reserved.
//

#import "TMAAppDependencies.h"
#import "TMASearchCityWireFrame.h"
#import "TMAGooglePlacesClient.h"
#import "TMASearchCityDataManager.h"
#import "TMASearchCityInteractor.h"
#import "TMACoreDataManager.h"
#import "TMACityDetailPresenter.h"
#import "TMACityDetailIteractor.h"
#import "TMACityDetailManager.h"
#import "TMACityDetailWireFrame.h"

@class TMAGooglePlacesClient;

@interface TMAAppDependencies ()

@property (nonatomic, strong) TMASearchCityWireFrame *searchCityWireFrame;

@end

@implementation TMAAppDependencies

- (id)init
{
    if (self = [super init])
    {
        [self configureDependencies];
    }
    
    return self;
}

- (void)installRootViewControllerIntoWindow:(UIWindow *)window
{
    [self.searchCityWireFrame presentSearchCityInterfaceFromWindow:window];
}

- (void)configureDependencies
{
    TMAGooglePlacesClient *googlePlacesClient = [[TMAGooglePlacesClient alloc] init];
    TMACoreDataManager *coreDataManager = [[TMACoreDataManager alloc] init];
    
    // SearchCity Module
    self.searchCityWireFrame = [[TMASearchCityWireFrame alloc] init];
    TMASearchCityPresenter *searchCityPresenter = [[TMASearchCityPresenter alloc] init];
    TMASearchCityDataManager *searchCityDataManager = [[TMASearchCityDataManager alloc] initWithGooglePlacesClient:googlePlacesClient andCoreDataManager:coreDataManager];
    TMASearchCityInteractor *searchCityInteractor = [[TMASearchCityInteractor alloc] initWithDataManager:searchCityDataManager];
    
    self.searchCityWireFrame.searchCityPresenter = searchCityPresenter;
    searchCityInteractor.output = searchCityPresenter;
    searchCityPresenter.interactor = searchCityInteractor;
    searchCityPresenter.wireFrame = self.searchCityWireFrame;
    
    // CityDetail Module
    TMACityDetailPresenter *cityDetailPresenter = [[TMACityDetailPresenter alloc] init];
    TMACityDetailManager *cityDetailManager = [[TMACityDetailManager alloc] init];
    TMACityDetailIteractor *cityDetailIteractor = [[TMACityDetailIteractor alloc] initWithDataManager:cityDetailManager];
    TMACityDetailWireFrame *cityDetailWireFrame = [[TMACityDetailWireFrame alloc] init];
    
    cityDetailPresenter.iteractor = cityDetailIteractor;
    cityDetailWireFrame.presenter = cityDetailPresenter;
    searchCityPresenter.presenterCityDetailModule = cityDetailPresenter;
    self.searchCityWireFrame.cityDetailWireframe = cityDetailWireFrame;
}

@end
