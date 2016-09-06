//
//  MeLocationViewController.h
//  Student
//
//  Created by agile on 25/07/16.
//  Copyright (c) 2016 iraniya. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreLocation/CoreLocation.h>
#import <MapKit/MapKit.h>

@interface MeLocationViewController : UIViewController<CLLocationManagerDelegate>
{
    CLLocationManager *locationManagerObject;
    CLGeocoder *geocoder;
    CLPlacemark *placemark;
    
}
@property (weak, nonatomic) IBOutlet UILabel *currentStudentLocationLabel;
@end
