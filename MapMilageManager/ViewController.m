//
//  ViewController.m
//  MapMilageManager
//
//  Created by Alexander John Resonable on 2/4/13.
//  Copyright (c) 2013 Alexander John Resonable. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController
@synthesize mileageRecords;

// setups the stack navigation
// with the mileage calculator as the default view controller
- (void)viewDidLoad
{
    [super viewDidLoad];
    
	[[self navigationItem] setTitle:@"M Calc"];
    odometer.delegate = self;
    fuelAdded.delegate = self;
    NSDate *now =[NSDate date];
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    
    [dateFormatter setDateStyle:NSDateFormatterMediumStyle];
    [dateFormatter setTimeStyle:NSDateFormatterShortStyle];
    dateToday.text = [dateFormatter stringFromDate:now];
    
    UIBarButtonItem *bbi = [[UIBarButtonItem alloc] initWithTitle:@"GPS"
                           style:UIBarButtonItemStylePlain target:self
                           action:@selector(gpsButton:)];
    
    UIBarButtonItem *bbi2 = [[UIBarButtonItem alloc] initWithTitle:@"Summary"
                            style:UIBarButtonItemStylePlain target:self
                            action:@selector(summaryButton:)];
    
    UIBarButtonItem *bbi3 = [[UIBarButtonItem alloc] initWithTitle:@"History"
                            style:UIBarButtonItemStylePlain target:self
                            action:@selector(historyButton:)];
    
    NSArray *bbiArray = [[NSArray alloc] initWithObjects:bbi, bbi2, bbi3, nil];
    [[self navigationItem] setRightBarButtonItems:bbiArray];
}

-(BOOL)textFieldSHouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    return YES;
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
    }
    return self;
}

-(IBAction)addMileageRecord:(id)sender
{
    validValues = true;
    [odometer setTextColor:[UIColor blackColor]];
    [fuelAdded setTextColor:[UIColor blackColor]];
    
    // takes the values in the respective text field and converts it to double
    odometerValue = [odometer.text doubleValue];
    fuelAddedValue = [fuelAdded.text doubleValue];
    
    // validate the input values
    // informs the user that the value is invalid and
    // sets the text color to red
    if(odometerValue <= 0){
        odometer.text = @"enter a value > 0";
        [odometer setTextColor:[UIColor redColor]];
        validValues = false;
    }
    if(fuelAddedValue <= 0){
        fuelAdded.text = @"enter a value > 0";
        [fuelAdded setTextColor:[UIColor redColor]];
        validValues = false;
    }
    
    // if the values are validated show the computed mileage
    if(validValues){
        calculatedMileage = odometerValue / fuelAddedValue;
        [mileage setText:[NSString stringWithFormat:@"%.2f MPG", calculatedMileage]];
        
        NSDate *now = [NSDate date];
        NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
        [dateFormatter setDateStyle:NSDateFormatterShortStyle];
        
        Records *currentRecord =[[Records alloc] init];
        currentRecord.miles = odometerValue;
        currentRecord.fuel = fuelAddedValue;
        currentRecord.recordDate = [dateFormatter stringFromDate: now];
        [mileageRecords addRecord:currentRecord];
        NSLog(@"A record has been added! Record size:%u", [mileageRecords getCount]);
    }
    [odometer resignFirstResponder];
    [fuelAdded resignFirstResponder];
}

-(IBAction)gpsButton:(id)sender
{
    ViewControllerGPS *vcGPS = [[ViewControllerGPS alloc]initWithNibName:@"ViewControllerGPS" bundle:nil];
    vcGPS.mileageRecords = mileageRecords;
    [[self navigationController] pushViewController:vcGPS animated:YES];
}

-(IBAction)summaryButton:(id)sender
{
    ViewControllerSummary *vcSummary = [[ViewControllerSummary alloc]initWithNibName:@"ViewControllerSummary" bundle:nil];
    vcSummary.mileageRecords = mileageRecords;
    [[self navigationController] pushViewController:vcSummary animated:YES];
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
    // Dispose of any resources that can be recreated.
}

@end
