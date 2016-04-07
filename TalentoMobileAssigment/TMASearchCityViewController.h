//
//  TMASearchCityViewController.h
//  TalentoMobileAssigment
//
//  Created by Said Rehouni on 6/4/16.
//  Copyright © 2016 Said Rehouni. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TMAModuleInterface.h"
#import "TMASearchCityViewInterface.h"

@interface TMASearchCityViewController : UIViewController <TMASearchCityViewInterface, UITableViewDelegate, UITableViewDataSource, UISearchBarDelegate>

@property (nonatomic, strong) id <TMAModuleInterface> eventHandler;

@end
