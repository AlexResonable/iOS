//
//  AppDelegate.h
//  MapMilageManager
//
//  Created by Alexander John Resonable on 2/4/13.
//  Copyright (c) 2013 Alexander John Resonable. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MileageRecords.h"

@class ViewController;

@interface AppDelegate : UIResponder <UIApplicationDelegate>
{
    MileageRecords *mileageRecords;
}

@property (strong, nonatomic) UIWindow *window;

@property (strong, nonatomic) ViewController *viewController;

@end
