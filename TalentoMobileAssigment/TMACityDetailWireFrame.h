//
//  TMACityDetailWireFrame.h
//  TalentoMobileAssigment
//
//  Created by Said Rehouni on 7/4/16.
//  Copyright © 2016 Said Rehouni. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "TMACityDetailPresenter.h"

@interface TMACityDetailWireFrame : NSObject

@property (nonatomic, strong) TMACityDetailPresenter *presenter;

- (void)presentCityDetailInterfaceFromViewController:(UIViewController *)viewController;

@end
