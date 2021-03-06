//
//  AppDelegate.m
//  TalentoMobileAssigment
//
//  Created by Said Rehouni on 6/4/16.
//  Copyright © 2016 Said Rehouni. All rights reserved.
//

#import "AppDelegate.h"
#import <GoogleMaps/GoogleMaps.h>
#import "TMAAppDependencies.h"

@interface AppDelegate ()

@property (nonatomic, strong) TMAAppDependencies *appDependencies;

@end

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    [GMSServices provideAPIKey:@"AIzaSyDmwNSTjS38So7pxN53YLcZnuPYjvndXRM"];
    self.appDependencies = [[TMAAppDependencies alloc] init];
    self.window = [[UIWindow alloc] init];
    [self.appDependencies installRootViewControllerIntoWindow:self.window];
    [self.window makeKeyAndVisible];
    
    return YES;
}

@end