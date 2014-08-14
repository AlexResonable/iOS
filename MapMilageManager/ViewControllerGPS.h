//
//  ViewControllerGPS.h
//  MapMilageManager
//
//  Created by Alexander John Resonable on 2/4/13.
//  Copyright (c) 2013 Alexander John Resonable. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>
#import "ViewControllerSummary.h"

// View Controller for the GPS Map
@interface ViewControllerGPS : UIViewController <MKMapViewDelegate>
{
    IBOutlet MKMapView *mapView;
}
@property (strong, nonatomic) MileageRecords *mileageRecords;
@end
