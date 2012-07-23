//
//  DNViewController.m
//  LoopEnumerationBenchmark
//
//  Created by Markus Chmelar on 22.07.12.
//  Copyright (c) 2012 devsub.net. All rights reserved.
//

#import "DNViewController.h"
#import "DNEnumerationMethods.h"

#define kNumberOfRuns 1
#define kSleepIntervalMs 0

@interface DNViewController ()

@end

@implementation DNViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone) {
        return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
    } else {
        return YES;
    }
}

-(IBAction)runTestsDouble:(id)sender
{
    // Dispatch the tests in background to not block the main-queue
    // the tests may take to long so that the os may terminate the application
    // if we block the mainthread that long
    [_activityIndicator startAnimating];
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        // Sleep is to seperate the Test-Cases in Instruments
        DNEnumerationMethods *dut = [[DNEnumerationMethods alloc] initWithArraySize:5000];
        [NSThread sleepForTimeInterval:kSleepIntervalMs];
        [NSThread sleepForTimeInterval:kSleepIntervalMs];
        // Double Enumeration
        [dut doubleFastEnumerationSlicing:kNumberOfRuns];           // 1 
        [NSThread sleepForTimeInterval:kSleepIntervalMs];
        [dut doubleForLoop:kNumberOfRuns];                          // 2
        [NSThread sleepForTimeInterval:kSleepIntervalMs];
        [dut doubleHybrid:kNumberOfRuns];                           // 3
        [NSThread sleepForTimeInterval:kSleepIntervalMs];
        [dut doubleFastEnumerationAndEnumeration:kNumberOfRuns];    // 4
        [NSThread sleepForTimeInterval:kSleepIntervalMs];
        [dut doubleFastEnumerationPointerCheck:kNumberOfRuns];      // 5
        [NSThread sleepForTimeInterval:kSleepIntervalMs];
        dispatch_async(dispatch_get_main_queue(), ^{
            [_activityIndicator stopAnimating];
        });
    });
}
    
-(IBAction)runTestsSingle:(id)sender
{
    // Dispatch the tests in background to not block the main-queue
    // the tests may take to long so that the os may terminate the application
    // if we block the mainthread that long
    [_activityIndicator startAnimating];
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        // Sleep is to seperate the Test-Cases in Instruments
        DNEnumerationMethods *dut = [[DNEnumerationMethods alloc] initWithArraySize:1000000];
        [NSThread sleepForTimeInterval:kSleepIntervalMs];
        [NSThread sleepForTimeInterval:kSleepIntervalMs];
        // Single Enumeration
        [dut singleFastEnumeration:kNumberOfRuns];                  // 1
        [NSThread sleepForTimeInterval:kSleepIntervalMs];
        [dut singleFastEnumerationReverse:kNumberOfRuns];           // 2
        [NSThread sleepForTimeInterval:kSleepIntervalMs];
        [dut singleEnumeration:kNumberOfRuns];                      // 3
        [NSThread sleepForTimeInterval:kSleepIntervalMs];
        [dut singleEnumerationReverse:kNumberOfRuns];               // 4
        [NSThread sleepForTimeInterval:kSleepIntervalMs];
        [dut singleForLoop:kNumberOfRuns];                          // 5
        [NSThread sleepForTimeInterval:kSleepIntervalMs];   
        [dut singleForLoopReverse:kNumberOfRuns];                   // 6
        [NSThread sleepForTimeInterval:kSleepIntervalMs];
        [dut singleBlock:kNumberOfRuns];                            // 7
        [NSThread sleepForTimeInterval:kSleepIntervalMs]; 
        [dut singleBlockBackwards:kNumberOfRuns];                   // 8
        [NSThread sleepForTimeInterval:kSleepIntervalMs]; 
        [dut singleBlockConcurrent:kNumberOfRuns];                  // 9
        [NSThread sleepForTimeInterval:kSleepIntervalMs]; 
        // Enumeration 'all but the last element'
        [NSThread sleepForTimeInterval:kSleepIntervalMs];       
        [dut partialEnumerationForLoop:kNumberOfRuns];              // 10
        [NSThread sleepForTimeInterval:kSleepIntervalMs];
        [dut partialEnumerationFastSlicing:kNumberOfRuns];          // 11
        [NSThread sleepForTimeInterval:kSleepIntervalMs];       
        [dut partialEnumerationCheck:kNumberOfRuns];                // 12
        [NSThread sleepForTimeInterval:kSleepIntervalMs];      
        [dut partialEnumerationGetObjectsRange:kNumberOfRuns];      // 13
        [NSThread sleepForTimeInterval:kSleepIntervalMs];     
        [dut partialEnumerationWithBlock:kNumberOfRuns];            // 14
        [NSThread sleepForTimeInterval:kSleepIntervalMs];      
        [dut partialEnumerationWithBlockConcurrent:kNumberOfRuns];  // 15
        
        
        dispatch_async(dispatch_get_main_queue(), ^{
            [_activityIndicator stopAnimating];
        });
    });
}

@end
