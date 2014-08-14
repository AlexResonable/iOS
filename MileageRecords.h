//
//  MileageRecords.h
//  MapMilageManager
//
//  Created by Alexander John Resonable on 2/5/13.
//  Copyright (c) 2013 Alexander John Resonable. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Records.h"

// stores an array of mileage records
@interface MileageRecords : NSObject
{
    NSMutableArray *mileageArray;
}
-(id)init;
-(void)addRecord:(Records *)record;
-(Records *)getRecord:(int)index;
-(int)getCount;
-(double)getTotalMiles;
-(double)getTotalFuel;
-(void)clear;
@end
