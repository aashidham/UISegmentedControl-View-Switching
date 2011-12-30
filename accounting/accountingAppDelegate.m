//
//  accountingAppDelegate.m
//  accounting
//
//  Created by Aaditya's MacBook on 10/21/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "accountingAppDelegate.h"
#import "RootViewController.h"
#import "CalendarViewController.h"

@implementation accountingAppDelegate

@synthesize navigationController;
@synthesize window=_window;
@synthesize segmentedControl,cVC,rVC;

#pragma mark -
#pragma mark Helper Methods

- (void) firstPane
{
    NSArray * theViewControllers = [NSArray arrayWithObject:self.cVC];
    [self.navigationController setViewControllers:theViewControllers animated:NO];
}

- (void)indexDidChangeForSegmentedControl:(UISegmentedControl *)aSegmentedControl
{
    NSUInteger index = aSegmentedControl.selectedSegmentIndex;
    switch (index) {
        case 0:
        {
            [self firstPane];
            break;
        }
        case 1:
        {
            NSArray * theViewControllers = [NSArray arrayWithObject:self.rVC];
            [self.navigationController setViewControllers:theViewControllers animated:NO];
            break;        
        }
        default:
            break;
    }
}


- (NSArray*)toolBarItems
{
    UIBarButtonItem *segmentedControlButtonItem = [[UIBarButtonItem alloc] initWithCustomView:(UIView *)self.segmentedControl];
    [segmentedControl addTarget:self
                         action:@selector(indexDidChangeForSegmentedControl:)
               forControlEvents:UIControlEventValueChanged];
    NSArray *barArray = [NSArray arrayWithObject: segmentedControlButtonItem];
    return barArray;
}


-(void)onTick:(NSTimer *)timer{
    [[NSNotificationCenter defaultCenter] 
     postNotificationName:@"TestNotification" 
     object:self];
}


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    // Override point for customization after application launch.
    // Add the navigation controller's view to the window and display.
    self.cVC = [[CalendarViewController alloc] init];
    self.rVC = [[RootViewController alloc] init];
    NSArray* topLevelObjects = [[NSBundle mainBundle] loadNibNamed:@"SegmentedControl" owner:self options:nil];
    self.segmentedControl = [topLevelObjects objectAtIndex:0];
    self.navigationController = [[UINavigationController alloc] init];
    [self.navigationController setToolbarHidden:NO];
    [self firstPane];
    [self.window addSubview:self.navigationController.view];
    [self.window makeKeyAndVisible];
    
    return YES;
}



- (void)dealloc
{
    [_window release];
    [segmentedControl release];
    [navigationController release];
    [rVC release];
    [cVC release];
    [super dealloc];
}

@end
