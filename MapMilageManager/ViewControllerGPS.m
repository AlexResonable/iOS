//
//  ViewControllerGPS.m
//  MapMilageManager
//
//  Created by Alexander John Resonable on 2/4/13.
//  Copyright (c) 2013 Alexander John Resonable. All rights reserved.
//

#import "ViewControllerGPS.h"

@interface ViewControllerGPS ()

@end

@implementation ViewControllerGPS
@synthesize mileageRecords;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
    }
    return self;
}

// Loads the map
- (void)viewDidLoad
{
    [super viewDidLoad];
    [mapView setDelegate:self];
    [mapView setShowsUserLocation:YES];
    [[self navigationItem] setTitle:@"GPS"];
    UIBarButtonItem *bbi = [[UIBarButtonItem alloc] initWithTitle:@"Summary"
                            style:UIBarButtonItemStylePlain target:self
                            action:@selector(summaryButton:)];
    [[self navigationItem] setRightBarButtonItem:bbi];
}

// Updates the GPS map
-(void)mapView:(MKMapView *)mv didUpdateUserLocation:(MKUserLocation *)userLocation
{
    NSLog(@"new location");
    
    CLLocationCoordinate2D loc = userLocation.location.coordinate;
    MKCoordinateRegion region = MKCoordinateRegionMakeWithDistance(loc, 300, 300);
    [mv setRegion:region];
}

-(void) mapView:(MKMapView *)mv didFailToLocateUserWithError:(NSError *)error
{
    NSLog(@"map error: %@", error);
}

// Deallocates the map
-(void) dealloc
{
    mapView.delegate = nil;
}

-(IBAction)summaryButton:(id)sender
{
    ViewControllerSummary *vcSummary = [[ViewControllerSummary alloc]initWithNibName:@"ViewControllerSummary" bundle:nil];
    vcSummary.mileageRecords = mileageRecords;
    [[self navigationController] pushViewController:vcSummary animated:YES];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

@end
