//
//  ViewControllerHistory.m
//  MapMilageManager
//
//  Created by Alexander John Resonable on 2/4/13.
//  Copyright (c) 2013 Alexander John Resonable. All rights reserved.
//

#import "ViewControllerHistory.h"

@interface ViewControllerHistory ()

@end

@implementation ViewControllerHistory
@synthesize mileageRecords, historyTable;

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
    [[self navigationItem] setTitle:@"History"];
    historyTable.delegate = self;
    historyTable.dataSource = self;
}

-(NSInteger) numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    NSLog(@"Returning mileageRecords count: %d", [mileageRecords getCount]);
    return [mileageRecords getCount];
}

// writes the mileage records to the table
-(UITableViewCell *) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *unused = @"UNUSED";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:unused];
    if (cell == nil)
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:unused];
    NSString *thisMileageRecord = [NSString stringWithFormat:@"%.2f mi %.2f g (%@)",
                             [[mileageRecords getRecord:indexPath.row] miles],
                             [[mileageRecords getRecord:indexPath.row] fuel],
                             [[mileageRecords getRecord:indexPath.row] recordDate]];
    cell.textLabel.text = thisMileageRecord;
    NSLog(@"MileageRecord[%d]: %@", indexPath.row, thisMileageRecord);
    return cell;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

@end
