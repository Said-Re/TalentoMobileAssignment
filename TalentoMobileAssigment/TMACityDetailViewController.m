//
//  TMACityDetailViewController.m
//  TalentoMobileAssigment
//
//  Created by Said Rehouni on 10/4/16.
//  Copyright © 2016 Said Rehouni. All rights reserved.
//

#import "TMACityDetailViewController.h"
#import <MapKit/MapKit.h>
#import <CoreLocation/CoreLocation.h>
#import "TMAWeatherStation.h"

@interface TMACityDetailViewController ()

@property (weak, nonatomic) IBOutlet UILabel *cityName;
@property (weak, nonatomic) IBOutlet UILabel *cityTemperature;
@property (weak, nonatomic) IBOutlet MKMapView *mapView;
@property (weak, nonatomic) IBOutlet UISlider *temperatureMarker;

@end

@implementation TMACityDetailViewController

- (id)init
{
    if (self = [super initWithNibName:@"TMACityDetailViewController" bundle:nil]) {
        
    }
    
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

- (void)setMarkerOnMapWithName:(NSString *)name andLocation:(CLLocationCoordinate2D) coordinate
{
    MKPointAnnotation *cityMarker = [[MKPointAnnotation alloc] init];
    cityMarker.coordinate = coordinate;
    cityMarker.title = name;
    
    [self.mapView addAnnotation:cityMarker];
}

#pragma mark - TMACityDetailViewInterface

- (void)foundCityWeatherInfo:(TMACityInfo *)city
{
    MKCoordinateRegion region = MKCoordinateRegionMakeWithDistance(CLLocationCoordinate2DMake(city.lat, city.lng), 25000, 25000);
    [self.mapView setRegion:region];
    self.cityName.text = city.name;
    int temperature = 0;
    int temperatureCount = 0;
    [self setMarkerOnMapWithName:city.name andLocation:CLLocationCoordinate2DMake(city.lat, city.lng)];
    
    for (TMAWeatherStation *station in city.weatherStations)
    {
        if (station.temperature)
        {
            temperature += station.temperature;
            temperatureCount++;
        }
        [self setMarkerOnMapWithName:station.name andLocation:CLLocationCoordinate2DMake(station.lat, station.lng)];
    }
    self.cityTemperature.text = [NSString stringWithFormat:@"%i", temperature / temperatureCount];
}

- (void)noCityWeatherInfoFound
{
    UIAlertController *alerController = [UIAlertController alertControllerWithTitle:@"Error"
                                                                            message:@"No info weather found for this city"
                                                                     preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction *alerAction = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault
                                                       handler:^(UIAlertAction * _Nonnull action) {
        [self.navigationController popViewControllerAnimated:YES];
    }];
    
    [alerController addAction:alerAction];
    [self presentViewController:alerController animated:YES completion:nil];
}

@end