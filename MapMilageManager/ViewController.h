//
//  ViewController.h
//  MapMilageManager
//
//  Created by Alexander John Resonable on 2/4/13.
//  Copyright (c) 2013 Alexander John Resonable. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ViewControllerHistory.h"
#import "ViewControllerGPS.h"
#import "ViewControllerSummary.h"
#import "Records.h"
#import "MileageRecords.h"

// ViewController for the Mileage Calculator
@interface ViewController : UIViewController <UITextFieldDelegate>
{
    __weak IBOutlet UILabel *dateToday; // Date label
    __weak IBOutlet UILabel *mileage;   // Mileage label
    __weak IBOutlet UITextField *odometer;  // Odometer textfield
    __weak IBOutlet UITextField *fuelAdded; // Fuel Added textfield
    double odometerValue;   // stores the odometer value
    double fuelAddedValue;  // stores the fuel added value
    double calculatedMileage;   // stores the computed mileage
    bool validValues;   // validates the input values
}
@property (strong, nonatomic) MileageRecords *mileageRecords;

-(IBAction)addMileageRecord:(id)sender;
-(BOOL)textFieldSHouldReturn:(UITextField *)textField;
@end
