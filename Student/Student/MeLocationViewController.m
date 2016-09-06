//
//  MeLocationViewController.m
//  Student
//
//  Created by agile on 25/07/16.
//  Copyright (c) 2016 iraniya. All rights reserved.
//

#import "MeLocationViewController.h"

@interface MeLocationViewController ()

@end

@implementation MeLocationViewController
@synthesize currentStudentLocationLabel;
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.navigationItem.title=@"Contact Us";
    // Do any additional setup after loading the view from its nib.
    locationManagerObject = [[CLLocationManager alloc] init];
    geocoder = [[CLGeocoder alloc] init];
}

-(void)viewWillAppear:(BOOL)animated
{
    locationManagerObject.delegate = self;
    locationManagerObject.desiredAccuracy = kCLLocationAccuracyBest;
    
    [locationManagerObject startUpdatingLocation];
}

#pragma mark - CLLocationManagerDelegate
-(void)locationManager:(CLLocationManager *)manager didFailWithError:(NSError *)error
{
    NSLog(@"erroe%@",error);
    NSLog(@"manager%@",manager);
    UIAlertView *errorAlert = [[UIAlertView alloc]
                               initWithTitle:@"Error" message:@"Failed to Get Your Location" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
    [errorAlert show];
}

-(void)locationManager:(CLLocationManager *)manager didUpdateToLocation:(CLLocation *)newLocation fromLocation:(CLLocation *)oldLocation
{
    NSLog(@"current location %@",newLocation);
}

-(void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray *)locations
{
    NSLog(@"location%@",locations);
    CLLocation *currentLocation = [locations firstObject];
    // Stop Location Manager
    [locationManagerObject stopUpdatingLocation];
    
    //Reverse decoding
    NSLog(@"Resolving the Address");
    [geocoder reverseGeocodeLocation:currentLocation completionHandler:^(NSArray *placemarks, NSError *error) {
        NSLog(@"Found placemarks: %@, error: %@", placemarks, error);
        if (error == nil && [placemarks count] > 0) {
            placemark = [placemarks lastObject];
            currentStudentLocationLabel.text = [NSString stringWithFormat:@"%@ %@\n%@ %@\n%@\n%@",
                                 placemark.subThoroughfare, placemark.thoroughfare,
                                 placemark.postalCode, placemark.locality,
                                 placemark.administrativeArea,
                                 placemark.country];
        } else {
            NSLog(@"%@", error.debugDescription);
        }
    } ];
}
@end
