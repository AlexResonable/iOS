//
//  ViewControllerSummary.m
//  MapMilageManager
//
//  Created by Alexander John Resonable on 2/4/13.
//  Copyright (c) 2013 Alexander John Resonable. All rights reserved.
//

#import "ViewControllerSummary.h"

@interface ViewControllerSummary ()

@end

@implementation ViewControllerSummary
@synthesize mileageRecords;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [[self navigationItem] setTitle:@"Summary"];
    UIBarButtonItem *bbi = [[UIBarButtonItem alloc] initWithTitle:@"History"
                            style:UIBarButtonItemStylePlain target:self
                            action:@selector(historyButton:)];
    [[self navigationItem] setRightBarButtonItem:bbi];
    
    // Fills in the labels with the appropriate record
    if([mileageRecords getCount]!= 0){
        double miles = [mileageRecords getTotalMiles];
        NSLog(@"Total Miles:%.2f ", miles);
        double fuel = [mileageRecords getTotalFuel];
        NSLog(@"Total Fuel:%.2f ", fuel);
        double averageM = miles / fuel;
        NSLog(@"Average Mileage: %.2f", averageM);
        [totalMilesLabel setText:[NSString stringWithFormat:@"%.2f", miles]];
        [totalFuelLabel setText:[NSString stringWithFormat:@"%.2f", fuel]];
        [averageMileageLabel setText:[NSString stringWithFormat:@"%.2f", averageM]];
        [numOfRecordsLabel setText:[NSString stringWithFormat:@"%d", [mileageRecords getCount]]];
    }
}

// clears the records
-(IBAction)reset:(id)sender
{
    [mileageRecords clear];
    totalMilesLabel.text = @"";
    totalFuelLabel.text = @"";
    averageMileageLabel.text = @"";
    numOfRecordsLabel.text = @"";
}

-(IBAction)historyButton:(id)sender
{
    ViewControllerHistory *vcHistory = [[ViewControllerHistory alloc]initWithNibName:@"ViewControllerHistory" bundle:nil];
    vcHistory.mileageRecords = mileageRecords;
    [[self navigationController] pushViewController:vcHistory animated:YES];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

@end
