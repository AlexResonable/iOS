//
//  ViewControllerSummary.h
//  MapMilageManager
//
//  Created by Alexander John Resonable on 2/4/13.
//  Copyright (c) 2013 Alexander John Resonable. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ViewControllerHistory.h"
#import "ViewController.h"
#import "MileageRecords.h"

// View Controller for the Summary
@interface ViewControllerSummary : UIViewController
{
    __weak IBOutlet UILabel *numOfRecordsLabel;
    __weak IBOutlet UILabel *totalMilesLabel;
    __weak IBOutlet UILabel *totalFuelLabel;
    __weak IBOutlet UILabel *averageMileageLabel;
    
}
@property (strong, nonatomic) MileageRecords *mileageRecords;

-(IBAction)reset:(id)sender;
@end
