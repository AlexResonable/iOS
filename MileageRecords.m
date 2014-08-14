//
//  MileageRecords.m
//  MapMilageManager
//
//  Created by Alexander John Resonable on 2/5/13.
//  Copyright (c) 2013 Alexander John Resonable. All rights reserved.
//

#import "MileageRecords.h"

@implementation MileageRecords

// initializes the array
-(id)init
{
    self = [super init];
    mileageArray = [[NSMutableArray alloc] init];
    return self;
}

// adds a mileage record to the array
-(void)addRecord:(Records *)record
{
    [mileageArray addObject:record];
}

-(Records *)getRecord:(int)index
{
    return [mileageArray objectAtIndex: index];
}

// returns the total sum of recorded fuel
-(double)getTotalFuel
{
    double totalFuel = 0;
    for(int i = 0; i < [mileageArray count]; i++)
    {
        totalFuel += [[mileageArray objectAtIndex:i] fuel];
    }
    return totalFuel;
}

// returns the total sum of recorded miles
-(double)getTotalMiles
{
    double totalMiles = 0;
    for(int i = 0; i < [mileageArray count]; i++)
    {
        totalMiles += [[mileageArray objectAtIndex:i] miles];
    }
    return totalMiles;
}

// returns the number of records in the array
-(int)getCount
{
    return [mileageArray count];
}

// clears/empties the array
-(void)clear
{
    [mileageArray removeAllObjects];
}

@end
