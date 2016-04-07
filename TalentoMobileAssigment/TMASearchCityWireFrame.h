//
//  TMASearchCityWireFrame.h
//  TalentoMobileAssigment
//
//  Created by Said Rehouni on 6/4/16.
//  Copyright © 2016 Said Rehouni. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "TMACityDetailWireFrame.h"
#import "TMASearchCityPresenter.h"

@class TMASearchCityPresenter;

@interface TMASearchCityWireFrame : NSObject

@property (nonatomic, strong) TMACityDetailWireFrame *cityDetailWireframe;
@property (nonatomic, strong) TMASearchCityPresenter *searchCityPresenter;

- (void)presentSearchCityInterfaceFromWindow:(UIWindow *)window;
- (void)presentCityDetailInterface;

@end
