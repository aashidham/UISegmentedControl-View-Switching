//
//  accountingAppDelegate.h
//  accounting
//
//  Created by Aaditya's MacBook on 10/21/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@class RootViewController, CalendarViewController;

@interface accountingAppDelegate : NSObject <UIApplicationDelegate> {

}

@property (nonatomic, retain) UIWindow *window;
@property (nonatomic, retain) UISegmentedControl* segmentedControl;
@property (nonatomic, retain) UINavigationController *navigationController;
@property (nonatomic, retain) RootViewController* rVC;
@property (nonatomic, retain) CalendarViewController* cVC;

- (NSArray*)toolBarItems;

@end
