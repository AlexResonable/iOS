//
//  ViewControllerHistory.h
//  MapMilageManager
//
//  Created by Alexander John Resonable on 2/4/13.
//  Copyright (c) 2013 Alexander John Resonable. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MileageRecords.h"

// View Controller for the History
@interface ViewControllerHistory : UIViewController <UITableViewDelegate, UITableViewDataSource>
{
}
@property (strong, nonatomic) MileageRecords *mileageRecords;
@property (strong, nonatomic) IBOutlet UITableView *historyTable;

@end
